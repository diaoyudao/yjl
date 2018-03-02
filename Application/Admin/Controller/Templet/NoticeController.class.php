<?php
namespace Admin\Controller\Templet;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class NoticeController extends Controller
{
    public function webstick()
    {
        $notice_id = I('post.notice_id');

        $where_level['_string'] = 'level_id=1000000142 OR PID=1000000141';
        $levels = M('menu_level')->where($where_level)->getField('level_id', true);

        $model = M('Notice');
        $where['level_id'] = ['IN', $levels];
        $where['web_stick'] = 1;
        if ($notice_id) {
            $where['notice_id'] = ['NEQ', $notice_id];
        }

        $count = $model->where($where)->count();

        $this->ajaxReturn(['status' => 'ok', 'number' => $count]);
    }

    public function lists()
    {
        $model = M('Notice');
        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);
        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('web_stick desc,tags desc,weight desc,begin_time desc,update_time desc')
            ->select();
        //(new StaffLog)->add('查看列表');  // 日志记录

        $menu_app = new \Admin\Common\Menu();
        $source_levels = C('MENU_NOTICE_LEVELS');
        $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        foreach ($result as &$item) {
            $item['menu_name'] = $menu_app->getMenuName($item['level_id']);
        }


        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('notices', $result);
        $this->assign('select_levels', $select_levels);
        $this->display();
    }

    /**
     * 查看
     */
    public function search()
    {
        $notice_id = I('get.notice_id', 0, FILTER_VALIDATE_INT);
        if (!$notice_id) {
            $this->show("参数错误");
            return;
        }

        (new StaffLog)->add('新闻预览:' . $notice_id);  // 日志记录


        $model = M('Notice');
        $notice = $model->find($notice_id);

        $this->assign('news', $notice);
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

    public function changeOne()
    {
        if (IS_GET) {  // 获取页面
            $this->changePage();
            return;
        }

        // 提交数据
        $this->changeOneSubmit();
    }

    /**
     * 删除
     */
    public function delete()
    {
        $parameter = $this->deleteParameterCheck();
        $staff_id=session('staff_id');
        $release = (new \Admin\Common\Release())->getRelease();

        if ('' != (I('post.batch', ''))) {
            // 批量删除
            $this->deleteBatch($parameter,$staff_id,$release);
            return;
        }

        $this->deleteOne($parameter,$staff_id,$release);
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

    /*
     * param $paramter array
     * 参数组装a
     */
    private function composeParam($paramter)
    {
        $where = (new \Admin\Common\MenuPrivilege())->mergeLevelWhere();

        if (isset($paramter['level_id']) && '' != $paramter['level_id']) {
            if ($where['level_id']) {
                $where['_string'] = 'level_id =' . $paramter['level_id'];
            } else {
                $where['level_id'] = $paramter['level_id'];
            }
        }

        if (!empty($paramter['tags'])) {
            $where['tags'] = ['like', '%' . $paramter['tags'] . '%'];
        }

        if (!empty($paramter['name'])) {
            $where['name'] = ['like', '%' . $paramter['name'] . '%'];
        }

        if (null !== ($paramter['status']) && "" !== ($paramter['status'])) {
            $where['status'] = $paramter['status'];
        }
        if ($paramter['end_time'] == null && $paramter['begin_time']) {
            $where['begin_time'] = array('egt', $paramter['begin_time']);
        }
        if ($paramter['begin_time'] == null && $paramter['end_time']) {
            $where['begin_time'] = array('elt', $paramter['end_time']);
        }
        if ($paramter['begin_time'] && $paramter['end_time']) {
            $date = date_create($paramter['end_time']);
            date_modify($date, '+1 day');
            $end_date = date_format($date, 'Y-m-d');

            $where['begin_time'] = array(array('egt', $paramter['begin_time']), array('lt', $end_date));

        }
        return $where;
    }

    private function deleteOne($parameter,$staff_id,$release)
    {
        $model = M('Notice');
        $advert = $model->find($parameter['notice_id']);

        if (1 == $release && $advert['staff_id']!= $staff_id){
            $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的文章']);
        }else{
            $ret = $model->delete($parameter['notice_id']);
        }

        if (!$ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        // 删除文件
        if ($advert['image_url']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['image_url']);
        }
        if ($advert['thumbnail_url']) {  // 删除文件，失败也继续
            mv_file(C('IMAGE_SAVE_PATH_ROOT') . $advert['thumbnail_url']);
        }

        $temp_log_string = '删除内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function auditOne($parameter)
    {
        $model = M('Notice');
        $advert = $model->find($parameter['notice_id']);
        $ret = $model->where(['notice_id' => $parameter['notice_id']])->save(['status' => C('STATUS_INVALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '待审核内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function releaseOne($parameter)
    {
        $model = M('Notice');
        $advert = $model->find($parameter['notice_id']);
        $ret = $model->where(['notice_id' => $parameter['notice_id']])->save(['status' => C('STATUS_VALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '发布内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量删除角色
     */
    private function deleteBatch($parameter,$staff_id,$release)
    {
        $temp_log_string = '批量删除内容：';
        
        $files = [];
        $model = M('Notice');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                if ($advert['image_url']) {
                    $files[] = [
                        'image_url' => $advert['image_url'],
                        'thumbnail_url' => $advert['thumbnail_url'],
                    ];
                }

                if (1 == $release && $advert['staff_id']!= $staff_id){
                    $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的文章']);
                }else{
                    $ret = $model->delete($id);
                }

                if (!$ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }

                $temp_log_string .= $advert['name'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }

        // 删除文件，无论文件删除成功与否，都返回成功
        $this->batchDeleteFile($files);

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 批量审核内容
     */
    private function auditBatch($parameter)
    {
        $temp_log_string = '批量待审核内容：';

        $model = M('Notice');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                $ret = $model->where(['notice_id' => $id])->save(['status' => C('STATUS_INVALID')]);
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }
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
        $temp_log_string = '批量发布内容：';

        $model = M('Notice');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                $ret = $model->where(['notice_id' => $id])->save(['status' => C('STATUS_VALID')]);
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
                }
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
     * 批量删除文件
     */
    private function batchDeleteFile($files)
    {
        try {
            foreach ($files as $file) {
                mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['image_url']);
                mv_file(C('IMAGE_SAVE_PATH_ROOT') . $file['thumbnail_url']);
            }
        } catch (\Exception $ex) {
            \Think\Log::write('删除文件失败');
        }
    }

    /**
     * 数据提交
     */
    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');

        $note = I('post.note', '');

        $this->duplicateCheck($paramter, 'change');

        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['note'] = (new \Admin\Common\Textarea($note))->convertEnterToNone();
        $data['staff_id'] = session('staff_id');
        if (!isset($data['stick'])) {
            $data['stick'] = 0;
        }

        $model = M('Notice');
        $model->startTrans();
        try {
            if (!empty($data['web_stick'])) {
                $web_stick['web_stick'] = 0;
                $ret = $model->where('notice_id != %d', $paramter['notice_id'])->save($web_stick);
                if (false === $ret) {
                    throw \Exception($model->getDbError());
                }
            }

            $ret = $model->where('notice_id = %d', $paramter['notice_id'])->save($data);
            if (false === $ret) {
                throw \Exception($model->getDbError());
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '修改内容：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 数据提交
     */
    private function changeOneSubmit()
    {
        $paramter = $this->parameterCheck('change');

        $note = I('post.note', '');

        $this->duplicateCheck($paramter, 'change');

        $data = array_merge([], $paramter);
        $data['note'] = (new \Admin\Common\Textarea($note))->convertEnterToNone();
        $data['staff_id'] = session('staff_id');
        if (!isset($data['stick'])) {
            $data['stick'] = 0;
        }

        $model = M('Notice');
        $model->startTrans();
        try {
            if (!empty($data['web_stick'])) {
                $web_stick['web_stick'] = 0;
                $ret = $model->where('notice_id != %d', $paramter['notice_id'])->save($web_stick);
                if (false === $ret) {
                    throw \Exception($model->getDbError());
                }
            }

            $ret = $model->where('notice_id = %d', $paramter['notice_id'])->save($data);
            if (false === $ret) {
                throw \Exception($model->getDbError());
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '修改内容：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 获取修改页面
     */
    private function changePage()
    {
        $notice_id = I('get.notice_id', 0, FILTER_VALIDATE_INT);
        if (!$notice_id) {
            $this->show("参数错误");
            return;
        }

        $model = M('Notice');
        $notice = $model->find($notice_id);

        $source_levels = C('MENU_NOTICE_LEVELS');
        $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);

        if ($notice['desc']) {
            $notice['desc'] = (new \Admin\Common\Textarea($notice['desc']))->convertBrToEnter();
        }

        if ($notice['note']) {
            $notice['note'] = (new \Admin\Common\Textarea($notice['note']))->convertEnterToNone();
        }

        $this->assign('select_levels', $select_levels);
        $this->assign('notice', $notice);
        $this->display('add');
    }


    /**
     * 获取添加页面
     */
    private function addPage()
    {
        $source_levels = C('MENU_NOTICE_LEVELS');
        $select_levels = (new \Admin\Common\MenuPrivilege())->filterAuthorityLevels($source_levels);
        $this->assign('select_levels', $select_levels);
        $this->display();
    }

    /**
     * 添加数据提交
     */
    private function addSubmit()
    {
        $paramter = $this->parameterCheck();
        $this->duplicateCheck($paramter);

        $note = I('post.note', '');

        $data = array_merge([], $paramter);
        $data['note'] = (new \Admin\Common\Textarea($note))->convertEnterToNone();
        $data['staff_id'] = session('staff_id');

        $model = M('Notice');
        $model->startTrans();
        try {
            if (!empty($data['web_stick'])) {
                $web_stick['web_stick'] = 0;
                $ret = $model->where('true')->save($web_stick);
                if (false === $ret) {
                    throw \Exception($model->getDbError());
                }
            }

            $ret = $model->add($data);
            if (false === $ret) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '执行错误']);
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增内容：' . $paramter['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($paramter, $type = 'add')
    {
        $model = M('Notice');

        $where['level_id'] = $paramter['level_id'];
        $where['name'] = $paramter['name'];
        $where['tags'] = $paramter['tags'];

        if ($type == 'add') {
            $result = $model->where($where)->select();
        } else {
            $where['notice_id'] = ['NEQ', $paramter['notice_id']];
            $result = $model->where($where)->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该内容名已经存在，请检查！']);
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
                    'notice_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);

                exit;
            }
        }

        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'level_id' => ['type' => 'integer'],
                'name' => ['type' => 'string'],
                'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'desc' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'keyword' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'image_url' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'thumbnail_url' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'image_url2' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'thumbnail_url2' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'author' => ['type' => 'string'],
                'source' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'weight' => ['type' => 'integer'],
                'status' => ['enum_eq' => [0, 1]],
                'begin_time' => ['type' => 'string', 'allow_empty' => true],
                'end_time' => ['type' => 'string', 'allow_empty' => true],
                'stick' => ['enum_eq' => [0, 1], 'required' => false],
            ]);
        } catch (\Exception $ex) {

            // $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！']);
            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        $paramter = I('post.');

        if ($paramter['desc']) {
            $paramter['desc'] = (new \Admin\Common\Textarea($paramter['desc']))->convertEnterToBr();
        }

        if (empty($paramter['begin_time'])) {
            $paramter['begin_time'] = (new \DateTime())->format('Y-m-d');
        }

        if ('' === ($paramter['end_time'])) {
            $paramter['end_time'] = null;
        }

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
                    'notice_id' => ['type' => 'integer'],
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
                'level_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'name' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'status' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'pg' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'begin_time' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'end_time' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('get.');
    }
}