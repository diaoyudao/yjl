<?php
namespace Admin\Controller\Business;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class CityController extends Controller
{
    public function lists()
    {
        $name = I('get.name', '');

        $model = M('HelpType');

        if($name) {
            $where['name'] = ['like', '%'.$name.'%'];
        }

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->where($where)->order('weight desc')
            ->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->select();

        (new StaffLog)->add('查看帮助分类列表');  // 日志记录

        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('types', $result);
        $this->display();
    }

    /**
     * 新增
     */
    public function add()
    {
        if (IS_GET) {  // 获取页面
            $this->addPage();
            return;
        }

        // 提交数据
        $this->addSubmit();
    }

    /**
     * 修改
     */
    public function change()
    {
        if (IS_GET) {  // 获取页面
            $this->assign('labels', C('HELP_LABEL'));
            $this->changePage();
            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    /**
     * 删除
     */
    public function delete()
    {
        $parameter = $this->deleteParameterCheck();

        if ('' != (I('post.batch', ''))) {
            // 批量删除
            $this->deleteBatch($parameter);
            return;
        }

        $this->deleteOne($parameter);
    }

    private function deleteOne($parameter)
    {
        $model = M('HelpType');
        $type = $model->find($parameter['help_type_id']);

        $ret = $model->delete($parameter['help_type_id']);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '删除帮助分类：' . $type['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除
     */
    private function deleteBatch($parameter)
    {
        $temp_log_string = '批量删除帮助分类：';

        $model = M('HelpType');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $type = $model->find($id);

                $ret = $model->delete($id);
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }

                $temp_log_string .= $type['name'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 数据提交
     */
    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');
        $this->duplicateCheck('change');

        $model = M('HelpType');
        $ret = $model->where('help_type_id = %d', $paramter['help_type_id'])->save($paramter);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败！']);
        }

        $temp_log_string = '修改帮助分类：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 获取修改页面
     */
    private function changePage()
    {
        $type_id = I('get.help_type_id', 0, FILTER_VALIDATE_INT);
        if (!$type_id) {
            $this->show("参数错误");
            return;
        }

        $model = M('HelpType');
        $type = $model->find($type_id);

        $this->assign('type', $type);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage()
    {
        $this->assign('labels', C('HELP_LABEL'));
        $this->display();
    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter = $this->parameterCheck();
        $this->duplicateCheck();

        $data = array_merge([], $paramter);

        $model = M('HelpType');
        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行错误']);
        }

        $temp_log_string = '新增帮助分类：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($type = 'add')
    {
        $model = M('HelpType');
        if ($type == 'add') {
            $result = $model->where("name = '%s'", I('post.name'))->select();
        } else {
            $result = $model->where("name = '%s' and help_type_id != %d"
                , I('post.name'), I('post.help_type_id'))
                ->select();
        }

        if ($result) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '该帮助分类名已经存在，请检查！']);
        }
    }

    /**
     * 入参检查
     * @param $type [add|change]
     * @return  post参数数组
     */
    private function parameterCheck($type = 'add')
    {
        if ($type == 'change') {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'help_type_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);

                exit;
            }
        }

        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'name' => ['type' => 'string'],
                'status' => ['enum_eq' => [0, 1]],
            ]);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        return I('post.');
    }

    /**
     * 入参检查
     * @param $type delete
     * @return  post参数数组
     */
    private function deleteParameterCheck()
    {
        try {
            if ('' != (I('post.batch', ''))) {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'ids' => [
                        'type' => 'array',
                        'value' => [
                            'type' => 'integer'
                        ]
                    ],
                ]);
            } else {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'city_id' => ['type' => 'integer'],
                ]);
            }
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('post.');
    }
}