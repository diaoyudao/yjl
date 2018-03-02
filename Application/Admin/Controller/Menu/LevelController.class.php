<?php
namespace Admin\Controller\Menu;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class LevelController extends Controller
{
    protected $list_levels = [];  // 排序输出层级节点
    protected $select_levels = [];  // 排序输出层级节点select

    /**
     * 层级主页
     */
    public function index()
    {
        $model = M('menu_level');
        $result = $model->order('weight desc')->select();
        $this->list_levels[] = C('ZTREE_ROOT');
        $this->select_levels[] = ['name' => C('ZTREE_ROOT.name'), 'value' => C('ZTREE_ROOT.level_id')];
        $this->getChildrenNodes($result, C('ZTREE_ROOT.level_id'));

        $this->assign('levels', $this->list_levels);
        $this->assign('select_levels', $this->select_levels);
        $this->display();
    }

    public function add()
    {
        if (IS_GET) {  // 获取页面
            $this->display();
            return;
        }

        // 提交数据
        $this->addSubmit();
    }

    /**
     * 数据提交
     */
    public function change()
    {
        $paramter = $this->parameterCheck('change');
        $this->duplicateCheck('change');

        $model = M('menu_level');
        if ($paramter['pid'] != 0) {
            $ret = $model->where('level_id = %d', $paramter['pid'])->select();
            if (!$ret) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '父节点不存在，请检查！']);
            }
        }

        $data = array_merge([], $paramter);

        $ret = $model->where('level_id = %d', $paramter['level_id'])->save($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '修改节点：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }


    /**
     * 删除
     */
    public function delete()
    {
        $parameter = $this->parameterCheck('delete');
        $model = M('menu_level');
        $level = $model->find($parameter['level_id']);
        // 删除用户
        $ret = $model->delete($parameter['level_id']);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);   // '该节点下含内容数据，无法删除'
        }

        if($level['image_url']) {
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $level['image_url']);
        }
        if($level['image_url']) {
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $level['thumbnail_url']);
        }

        $temp_log_string = '删除节点：' . $level['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);

    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter = $this->parameterCheck();
        $this->duplicateCheck();

        $model = M('menu_level');
        if ($paramter['pid'] != 0) {
            $ret = $model->where('level_id = %d', $paramter['pid'])->select();
            if (!$ret) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '父节点不存在，请检查！']);
            }
        }
        $data = array_merge([], $paramter);

        $ret = $model->add($data);
        if (false == $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增节点：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 递归查询，包含层级内容和选中层级
     * @param $datas
     * @param $level_id
     */
    private function getChildrenNodes($datas, $level_id, $depth = 1)
    {
        // 查找是否有子节点
        foreach ($datas as $item) {
            if ($item['pid'] == $level_id) {
                $item['open'] = (2 > $depth) ? true : false;
                $this->list_levels[] = $item;
                $name = $item['name'];
                for ($i = 1; $i <= $depth; $i++) {
                    $name = '　' . $name;
                }
                $this->select_levels[] = ['name' => $name, 'value' => $item['level_id']];

                $temp_depth = $depth + 1;
                $this->getChildrenNodes($datas, $item['level_id'], $temp_depth);
            }
        }
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($type = 'add')
    {
        $model = M('menu_level');
        $where['pid'] = I('post.pid');
        $where['name'] = I('post.name');

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['level_id'] = ['NEQ', I('post.level_id')];
            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该用户已经存在，请检查！']);
        }
    }

    /**
     * 入参检查
     * @param $type [add|change|delete]
     * @return  post参数数组
     */
    private function parameterCheck($type = 'add')
    {
        if ($type == 'delete' || $type == 'change') {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'level_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！']);
                exit;
            }
        }

        if ($type == 'add' || $type == 'change') {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'pid' => ['type' => 'integer'],
                    'name' => ['type' => 'string'],
                    'weight' => ['type' => 'integer'],
                    'link_url' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                    'note' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                    'status' => ['enum_eq' => [0, 1],],
                    'image_url' => ['type' => 'string', 'allow_empty' => true],
                    'thumbnail_url' => ['type' => 'string', 'allow_empty' => true],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
            }
        }

        return I('post.');
    }
}