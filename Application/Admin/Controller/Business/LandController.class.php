<?php
namespace Admin\Controller\Business;

use Think\Controller;
use Admin\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class LandController extends Controller
{
    const CITY_TAGS = '地产-城市';
    const TYPE_TAGS = '地产-业态';
    const LAND_TAGS = 'land';

    public function lists()
    {
        $model = M('land');

        $paramter = $this->searchParameterCheck();
        list($sql_query, $sql_parameter, $where) = $this->mergeSql($paramter);

        $count = $model->where($where)->count();
        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->query($sql_query, $sql_parameter);
        //(new StaffLog)->add('查看列表');  // 日志记录
        $citys = M('type')->where("tags = '%s' and status=%d", self::CITY_TAGS, C('STATUS_VALID'))->select();


        $this->assign('citys', $citys);
        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('lands', $result);
        $this->display();
    }

    /**
     * 查看
     */
    public function search()
    {
        $land_id = I('get.land_id', 0, FILTER_VALIDATE_INT);
        if (!$land_id) {
            $this->show("参数错误");
            return;
        }

        (new StaffLog)->add('酒店预览:' . $land_id);  // 日志记录


        $show_tags_lists = [
            'head' => '头部图片',
            'note' => '正文图片',
            'cover' => '封面图片',
            'logo' => 'logo',
            'code' => '二维码',
            'room' => '户型图',
            'plan' => '规划图',
            'real' => '实景图',
            'land' => 'land',
            'is_hot' => '1',
            'is_sales' => '1',
        ];
        $data['land_id'] = $land_id;

        $model = M('land_image');
        $images = $model->where($data)->order("weight desc")->select();

        $where['land_id'] = $land_id;
        $where['status'] = C('STATUS_VALID');
        $estate = M('land')->field('*')
            ->where($where)->order("weight desc,begin_time desc")->select();

        foreach ($images as $v) {
            if ($v['tags'] == $show_tags_lists['head']) $head_images[] = $v;
            if ($v['tags'] == $show_tags_lists['note']) $note_images[] = $v;
            if ($v['tags'] == $show_tags_lists['cover']) $cover_images[] = $v;
            if ($v['tags'] == $show_tags_lists['code']) $code_images[] = $v;
            if ($v['tags'] == $show_tags_lists['room']) $room_images[] = $v;
            if ($v['tags'] == $show_tags_lists['plan']) $plan_images[] = $v;
            if ($v['tags'] == $show_tags_lists['real']) $real_images[] = $v;
        }


        $sale_w['l.status'] = C('STATUS_VALID');
        $sale_w['l.tags'] = $show_tags_lists['land'];
        $sale_w['l.is_hot'] = $show_tags_lists['is_hot'];
        $sale_w['l.is_sales'] = $show_tags_lists['is_sales'];
        $sale_w['i.tags'] = $show_tags_lists['cover'];
        $model = M('land');
        $result = $model->alias('l')->field('l.land_id,i.image_url1')
            ->join(' land_image i on i.land_id = l.land_id')
            ->where($sale_w)->order("l.weight desc, l.begin_time desc")->select();
//		dump($result);

        // 楼盘地图周边


        $this->assign('estate', $estate);
        $this->assign('head_images', $head_images);
        $this->assign('note_images', $note_images);
        $this->assign('cover_images', $cover_images);
        $this->assign('code_images', $code_images);
        //户型图
        $this->assign('room_images', $room_images);
        //规划图
        $this->assign('plan_images', $plan_images);
        //实景图
        $this->assign('real_images', $real_images);
        //热销楼盘
        $this->assign('sales', $result);
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
            $this->changePage();
            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    /**
     * 待审核
     */
    public function audit()
    {
        $parameter = $this->deleteParameterCheck();

        if ('' != (I('post.batch', ''))) {
            // 批量待审核
            $this->auditBatch($parameter);
            return;
        }

        $this->auditOne($parameter);
    }

    /**
     * 发布
     */
    public function release()
    {
        $parameter = $this->deleteParameterCheck();

        if ('' != (I('post.batch', ''))) {
            // 批量发布
            $this->releaseBatch($parameter);
            return;
        }

        $this->releaseOne($parameter);
    }

    /**
     * 删除角色
     * @request {
     *      role_id: (integer),
     * }
     */
    public function delete()
    {
        $parameter = $this->deleteParameterCheck();
        $staff_id = session('staff_id');
        $release = (new \Admin\Common\Release())->getRelease();

        if ('' != (I('post.batch', ''))) {
            // 批量删除
            $this->deleteBatch($parameter,$staff_id,$release);
            return;
        }

        $this->deleteOne($parameter,$staff_id,$release);
    }

    private function mergeSql($parameter)
    {
        $page_count = C('ONE_PAGE_SIZE');
        $cur_row = (I('get.pg', 1, FILTER_VALIDATE_INT) - 1) * $page_count;

        $sql = "select a.*,(select name from type where type_id=a.city_id) city_name
                  from land a where true %s order by weight desc,begin_time limit $cur_row, $page_count";

        list($sql_where, $sql_parameter, $where) = $this->queryWhere($parameter);
        $sql = sprintf($sql, $sql_where);

        return [$sql, $sql_parameter, $where];
    }

    private function queryWhere($paramter)
    {
        $sql_where = '';
        $sql_parameter = [];

        $sql_where .= " and ( tags = '%s' )";
        $sql_parameter[] = self::LAND_TAGS;
        $where['tags'] = self::LAND_TAGS;

        if (!empty($paramter['city_id'])) {
            $sql_where .= " and ( city_id = %d )";
            $sql_parameter[] = $paramter['city_id'];
            $where['city_id'] = $paramter['city_id'];
        }
        if (null !== ($paramter['status']) && "" !== ($paramter['status'])) {
            $sql_where .= " and ( status = %d )";
            $sql_parameter[] = $paramter['status'];
            $where['status'] = $paramter['status'];
        }
        if (!empty($paramter['address'])) {
            $sql_where .= " and ( address like '%s' )";
            $sql_parameter[] = '%' . $paramter['address'] . '%';
            $where['address'] = ['like', '%' . $paramter['address'] . '%'];
        }

        if (!empty($paramter['name'])) {
            $sql_where .= "  and ( name like '%s' )";
            $sql_parameter[] = '%' . $paramter['name'] . '%';
            $where['name'] = ['like', '%' . $paramter['name'] . '%'];
        }

        return [$sql_where, $sql_parameter, $where];
    }

    private function auditOne($parameter)
    {
        $model = M('land');
        $advert = $model->find($parameter['land_id']);
//        $status=abs($advert['status']-1);
        $ret = $model->where(['land_id' => $parameter['land_id']])->save(['status' => C('STATUS_INVALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '待审核楼盘：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function releaseOne($parameter)
    {
        $model = M('land');
        $advert = $model->find($parameter['land_id']);
//        $status=abs($advert['status']-1);
        $ret = $model->where(['land_id' => $parameter['land_id']])->save(['status' => C('STATUS_VALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '发布楼盘：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function deleteOne($parameter,$staff_id,$release)
    {
        $model = M('land');
        $land = $model->where("land_id = %d", $parameter['land_id'])->find();
        if (1 == $release && $land['staff_id'] != $staff_id) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的酒店']);
        } else {
            $ret = $model->delete($parameter['land_id']);
        }

        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '请先删除楼盘的图片']);
        }

        $this->deleteImage($land);

        $temp_log_string = '删除楼盘：' . $land['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }


    /**
     * 批量审核内容
     */
    private function auditBatch($parameter)
    {
        $temp_log_string = '批量待审核楼盘：';

//        $advert_status = [];
        $model = M('land');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
//                $status=abs($advert['status']-1);
                $ret = $model->where(['land_id' => $id])->save(['status' => C('STATUS_INVALID')]);
//                dump($ret);exit;
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }
//                $advert_status[]= $model->find($id);;
                $temp_log_string .= $advert['name'] . ',';
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
     * 批量审核内容
     */
    private function releaseBatch($parameter)
    {
        $temp_log_string = '批量发布楼盘：';

//        $advert_status = [];
        $model = M('land');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
//                $status=abs($advert['status']-1);
                $ret = $model->where(['land_id' => $id])->save(['status' => C('STATUS_VALID')]);
//                dump($ret);exit;
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }
//                $advert_status[]= $model->find($id);;
                $temp_log_string .= $advert['name'] . ',';
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
     * 批量删除角色
     */
    private function deleteBatch($parameter,$staff_id,$release)
    {
        $temp_log_string = '批量删除楼盘：';

        $land_ids = [];
        $model = M('land');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $land = $model->find($id);
                $land_ids[] = ['land_id' => $id];
                if (1 == $release && $land['staff_id'] != $staff_id) {
                    $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的酒店']);
                } else {
                    $ret = $model->delete($id);
                }
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }

                $temp_log_string .= $land['name'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->deleteImage($land_ids);

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function deleteImage($lands)
    {
        foreach ($lands as $land) {
            $model = M('land_image');
            $result = $model->where('land_id = %d', $land['land_id'])->select();

            foreach ($result as $image) {
                // 删除文件
                if ($image['image_url1']) {  // 删除文件，失败也继续
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $image['image_url1']);
                }
                if ($image['thumbnail_url1']) {  // 删除文件，失败也继续
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $image['thumbnail_url1']);
                }

                if ($image['image_url2']) {  // 删除文件，失败也继续
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $image['image_url2']);
                }
                if ($image['thumbnail_url2']) {  // 删除文件，失败也继续
                    mv_file(C('IMAGE_SAVE_PATH_ROOT') . $image['thumbnail_url2']);
                }
            }
        }
    }

    /**
     * 数据提交
     */
    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');
        $this->duplicateCheck($paramter, 'change');

        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');

        if ($data['desc']) {
            $data['desc'] = (new \Admin\Common\Textarea($data['desc']))->convertEnterToBr();
        }
        if ($data['note']) {
            $data['note'] = (new \Admin\Common\Textarea($data['note']))->convertEnterToNone();
        }
        $model = M('land');
        $ret = $model->where('land_id = %d', $paramter['land_id'])->save($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '修改楼盘：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 获取修改页面
     */
    private function changePage()
    {
        $land_id = I('get.land_id', 0, FILTER_VALIDATE_INT);
        if (!$land_id) {
            $this->show("参数错误");
            return;
        }

        $model = M('land');
        $land = $model->find($land_id);

        if ($land['desc']) {
            $land['desc'] = (new \Admin\Common\Textarea($land['desc']))->convertBrToEnter();
        }

        if ($land['note']) {
            $land['note'] = (new \Admin\Common\Textarea($land['note']))->convertEnterToNone();
        }

        $where['status'] = C('STATUS_VALID');
        $where['tags'] = self::CITY_TAGS;
        $citys = M('type')->where($where)->select();

        $where['tags'] = self::TYPE_TAGS;
        $types = M('type')->where($where)->select();


        $this->assign('citys', $citys);
        $this->assign('types', $types);
        $this->assign('land', $land);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage()
    {
        $where['status'] = C('STATUS_VALID');
        $where['tags'] = self::CITY_TAGS;
        $citys = M('type')->where($where)->select();

        $where['tags'] = self::TYPE_TAGS;
        $types = M('type')->where($where)->select();


        $this->assign('citys', $citys);
        $this->assign('types', $types);
        $this->display();
    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter = $this->parameterCheck();
        $this->duplicateCheck($paramter);

        if (empty($paramter['begin_time'])) {
            $paramter['begin_time'] = (new \DateTime())->format('Y-m-d');
        }
        if ('' === ($paramter['end_time'])) {
            $paramter['end_time'] = null;
        }

        $data = array_merge([], $paramter);
        $data['staff_id'] = session('staff_id');
        $data['tags'] = self::LAND_TAGS;
        if ($data['desc']) {
            $data['desc'] = (new \Admin\Common\Textarea($data['desc']))->convertEnterToBr();
        }
        if ($data['note']) {
            $data['note'] = (new \Admin\Common\Textarea($data['note']))->convertEnterToNone();
        }
        $model = M('land');
        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增楼盘：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  楼盘，add是新增，change是修改
     */
    private function duplicateCheck($paramter, $type = 'add')
    {
        $model = M('land');

        $where['city_id'] = $paramter['city_id'];
        $where['name'] = $paramter['name'];

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['land_id'] = ['NEQ', $paramter['land_id']];
            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该名称已经存在，请检查！']);
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
                    'land_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);

                exit;
            }
        }

        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'is_hot' => ['enum_eq' => [0, 1], 'required' => false],
                'name' => ['type' => 'string'],
                'city_id' => ['type' => 'integer'],
                'type' => ['type' => 'string'],
                'address' => ['type' => 'string'],
                'tel' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'is_sales' => ['enum_eq' => [0, 1]],
                'weight' => ['type' => 'integer'],
                'begin_time' => ['type' => 'string', 'allow_empty' => true],
                'end_time' => ['type' => 'string', 'allow_empty' => true],
                'status' => ['enum_eq' => [0, 1]],
                'positon_x' => ['type' => 'numeric', 'allow_empty' => true],
                'positon_y' => ['type' => 'numeric', 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        $paramter = I('post.');
        if (empty($paramter['begin_time'])) {
            $paramter['begin_time'] = (new \DateTime())->format('Y-m-d');
        }
        if ('' === ($paramter['end_time'])) {
            $paramter['end_time'] = null;
        }
        $paramter['is_hot'] = $paramter['is_hot'] ?? 0;

        return $paramter;
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
                    'land_id' => ['type' => 'integer'],
                ]);
            }
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('post.');
    }

    /**
     * 入参检查
     * @return  get参数数组
     */
    private function searchParameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('get.'), [
                'city_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }
}