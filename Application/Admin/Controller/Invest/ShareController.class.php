<?php
namespace Admin\Controller\Invest;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class ShareController extends Controller
{
    /**
     * 列表
     */
    public function lists()
    {
        $model = M('Share');

        $paramter = $this->searchParameterCheck();
        $where = $this->composeParam($paramter);

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($where)->order('weight desc,begin_time desc')->select();
//        dump($result);
        $this->assign('counts', $count);
        $this->assign('shares', $result);
        $this->assign('pager', $page);
        $this->display();
    }

    public function search(){
        $model = M('share');
        $shares = $model->where('status =%d', C('STATUS_INVALID'))
            ->order('weight desc,begin_time desc')->select();

        $update_times=M('gradeUpdateTime')->getField('update_time',true);
        $this->splitShare($shares);
        $this->assign('share_time', $update_times[1]);
        $this->display();

    }

    public function changeStatus()
    {
        $model = M('share');
        $model->where(['status'=>C('STATUS_VALID')])->delete();
        $data['status']=C('STATUS_VALID');
        $res = $model->where(['status'=>C('STATUS_INVALID')])->save($data);

        if (false === $res) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }
        $this->ajaxReturn(['status' => 'ok']);
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
        if (IS_GET) {  // 获取页面
            $datas = M('Share')->find(I('get.share_id'));

            $this->assign('share', $datas);
            $this->display('add');

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
    public function save()
    {
        if (IS_GET) {  // 获取页面
            $id = 1000000002;
            $datas = M('gradeUpdateTime')->find($id);
            $this->assign('share', $datas);
            $this->display();
            return;
        }

        // 提交数据
        $this->saveSubmit();
    }

    public function import()
    {
        if (IS_GET) {  // 获取页面
            $this->display();

            return;
        }

        // 提交数据
        $this->importSubmit();
    }

    /**
     * 删除
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

    private function deleteBatch($parameter,$staff_id,$release)
    {
        $temp_log_string = '批量删除股票评级：';

        $model = M('Share');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $file = $model->find($id);

                if (1 == $release && $file['staff_id'] != $staff_id) {
                    $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的评级']);
                } else {
                    $ret = $model->delete($id);
                }
                if (false === $ret) {
                    throw new \Exception($model->getDbError());
                }

                $temp_log_string .= $file['institution'] . ',';
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $ex->getMessage()]);
        }

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function deleteOne($parameter,$staff_id,$release)
    {
        $model = M('Share');
        $file = $model->find($parameter['share_id']);

        // 删除
        if (1 == $release && $file['staff_id'] != $staff_id) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '您不能删除其他编辑者的评级']);
        } else {
            $ret = $model->delete($parameter['share_id']);
        }
        if (false === $ret) {
            $model->rollback();
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '删除股票评级：' . $file['institution'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }
    /**
     * 批量审核内容
     */
    private function auditBatch($parameter)
    {
        $temp_log_string = '批量待审核内容：';

        $model = M('Share');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                $ret = $model->where(['share_id' => $id])->save(['status' => C('STATUS_INVALID')]);
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
     * 批量发布内容
     */
    private function releaseBatch($parameter)
    {
        $temp_log_string = '批量发布内容：';

        $model = M('Share');
        $model->startTrans();
        try {
            foreach ($parameter['ids'] as $id) {
                $advert = $model->find($id);
                $ret = $model->where(['share_id' => $id])->save(['status' => C('STATUS_VALID')]);
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

    private function auditOne($parameter)
    {
        $model = M('Share');
        $advert = $model->find($parameter['share_id']);
        $ret = $model->where(['share_id' => $parameter['share_id']])->save(['status' => C('STATUS_INVALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '待审核内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function releaseOne($parameter)
    {
        $model = M('Share');
        $advert = $model->find($parameter['share_id']);
        $ret = $model->where(['share_id' => $parameter['share_id']])->save(['status' => C('STATUS_VALID')]);
        if (false === $ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }


        $temp_log_string = '发布内容：' . $advert['name'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }
    private function changeSubmit()
    {
        $paramter = $this->parameterCheck('change');
        $this->duplicateCheck('change');

        $model = M('Share');

        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['staff_id'] = session('staff_id');

        $ret = $model->where('share_id = %d', $paramter['share_id'])->save($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        $temp_log_string = '修改股票评级：' . $paramter['institution'];
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

        $model = M('Share');
        $data = array_merge([], $paramter);
        $data['update_time'] = (new \DateTime())->format('Y-m-d H:i:s');
        $data['staff_id'] = session('staff_id');

        $ret = $model->add($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '新增股票评级：' . $paramter['institution'];
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 修改更新时间提交
     */
    private function saveSubmit()
    {
        $paramter = $this->parameterCheck('save');

        $model = M('gradeUpdateTime');
        $data = array_merge([], $paramter);

        $where['id'] = 1000000002;
        $ret = $model->where($where)->save($data);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $temp_log_string = '修改股票评级更新时间';
        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function importSubmit()
    {
//        $model = M('share');
//        $model->where(['status' => C('STATUS_INVALID')])->delete();

        $file_path_name = $this->saveFile();
        $file_path_name = C('UPLOAD_FILE_ROOT_PATH') . $file_path_name;

        try {
            $this->importDb($file_path_name);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败,exception:' . $ex->getMessage()]);
        }

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function importDb($file_path_name)
    {
        $head = ['投行/券商', '日期', '分析师', '评级', '目标价', '分类'];

        $file = fopen($file_path_name, 'r');
        //setlocale(LC_ALL,array('zh_CN.gbk','zh_CN.gb2312','zh_CN.gb18030'));
        $data = fgetcsv($file);
        foreach ($head as $key => $item) {
            if (empty($data[$key]) || iconv('gbk', 'utf-8', $data[$key]) != $item) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '失败，请检查文件内容头是否正确！']);
            }
        }

        $goods_list = [];
        while ($data = fgetcsv($file)) { //每次读取CSV里面的一行内容
            //此为一个数组，要获得每一个数据，访问数组下标即可    
            $goods_list[] = $data;
        }
        fclose($file);

        $model = M('share');
        $model->where(['status' => C('STATUS_INVALID')])->delete();
        $model->startTrans();

//        $model->where('1')->delete();

        foreach ($goods_list as $arr) {
            if (empty($arr[5]) || false === strpos('买入,卖出,中性', iconv('gbk', 'utf-8', $arr[5]))) {
                $model->rollback();

                $this->ajaxReturn(['status' => 'failed', 'message' => '失败：分类类别只能是买入、卖出或中性！']);
            }
            $data['staff_id'] = session('staff_id');
            $data['status'] = C('STATUS_INVALID');//0
            $data['institution'] = iconv('gbk', 'utf-8', $arr[0]);
            $data['begin_time'] = iconv('gbk', 'utf-8', $arr[1]);
            $data['analyst'] = iconv('gbk', 'utf-8', $arr[2]);
            $data['grade'] = iconv('gbk', 'utf-8', $arr[3]);
            $data['hkd'] = iconv('gbk', 'utf-8', $arr[4]);
            $data['type'] = iconv('gbk', 'utf-8', $arr[5]);

            $ret = $model->add($data);
            if (false === $ret) {
                $model->rollback();

                $this->ajaxReturn(['status' => 'failed', 'message' => '失败,格式错误']);
            }
        }

        $model->commit();
    }

    private function saveFile()
    {
        $md5 = I('post.md5', "");
        if (!empty($md5)) {
        }


        $upload = new \Admin\Common\Upload\File();// 实例化上传类
        $upload->maxSize = 2 * 1024 * 1024;// 设置附件上传大小
        $upload->exts = array('csv');// 设置附件上传类型
        $upload->rootPath = C('UPLOAD_FILE_ROOT_PATH'); // 设置附件上传根目录
        $upload->savePath = C('UPLOAD_FILE_SAVE_PATH'); // 设置附件上传（子）目录
        $upload->saveName = 'md5';
        $upload->subName = '/';       // 禁止自动添加子目录
        $upload->saveExt = 'excel';    // 文件名后缀统一采用excel

        // 上传文件
        $info = $upload->upload();
        if (!$info) {
            // 上传错误提示错误信息

            $this->ajaxReturn(['status' => 'failed', 'message' => '失败：' . $upload->getError()]);
        } else {// 上传成功
            return $info['up_file']['savepath'] . $info['up_file']['savename'];
        }
    }

    /**
     * 重复检查
     * @param $type  类型，add是新增，change是修改
     */
    private function duplicateCheck($type = 'add')
    {
        $model = M('Share');
        if ($type == 'add') {
            $result = $model->where("institution= '%s' and begin_time= '%s'"
                , I('post.institution'), I('post.begin_time'))->select();
        } else {
            $result = $model->where("institution= '%s' and begin_time= '%s' and share_id != %d"
                , I('post.institution'), I('post.begin_time'), I('post.share_id'))
                ->select();
        }

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该机构同一时间股票评级已经存在，请检查！']);
        }
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
                    'share_id' => ['type' => 'integer'],
                ]);
            }
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('post.');
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
                    'share_id' => ['type' => 'integer'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
            }
        } elseif ($type == 'save') {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'update_time' => ['type' => 'string'],
                ]);
            } catch (\Exception $ex) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
            }
        } else {
            try {
                (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                    'type' => ['type' => 'string'],
                    'institution' => ['type' => 'string'],
                    'analyst' => ['type' => 'string'],
                    'grade' => ['type' => 'string'],
                    'hkd' => ['type' => 'numeric'],
                    'begin_time' => ['type' => 'date'],
                    'weight' => ['type' => 'number'],
                ]);
            } catch (\Exception $ex) {

                $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
            }

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
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }

    /*
     * param $paramter array
     * 参数组装a
     */
    private function composeParam($paramter)
    {
        if (!empty($paramter['institution'])) {
            $where['institution'] = ['like', '%' . $paramter['institution'] . '%'];
        }

        if (!empty($paramter['type'])) {
            $where['type'] = $paramter['type'];
        }
        if (null !== ($paramter['status']) && "" !== ($paramter['status'])) {
            $where['status'] = $paramter['status'];
        }
        return $where;
    }

    private function splitShare($shares)
    {
        $types = [
            'buy' => '买入',
            'sold' => '卖出',
            'neuter' => '中性',
        ];

        $buy = [];
        $sold = [];
        $neuter = [];
        $i = 1;
        foreach ($shares as &$share) {
            $share['key'] = $i++;
            if ($share['type'] == $types['buy']) {
                $buy[] = $share;
            }

            if ($share['type'] == $types['sold']) {
                $sold[] = $share;
            }

            if ($share['type'] == $types['neuter']) {
                $neuter[] = $share;
            }
        }

        $this->assign('buy', $buy);
        $this->assign('sold', $sold);
        $this->assign('neuter', $neuter);
    }
}