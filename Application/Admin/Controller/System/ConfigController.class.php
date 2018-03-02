<?php
namespace Admin\Controller\System;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class ConfigController extends Controller
{
    public function change()
    {
        if (IS_GET) {  // 获取页面
            $result = M('Config')->where('status=1')->order('weight')->select();

            $this->assign('configs', $result);
            $this->display();

            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    private function changeSubmit()
    {
        $parameter = $this->parameterCheck();

        $temp_log_string = '修改系统配置：';

        $model = M('Config');
        $model->startTrans();
        try {
            foreach ($parameter as $key => $item) {
                $where['name'] = $key;
                $where['status'] = C('STATUS_VALID');
                $values['value'] = $item;

                $ret = $model->where($where)->save($values);
                if (false === $ret) {
                    $model->rollback();

                    $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败！']);
                }

                $temp_log_string .= $key . '=' . $item . ',';
            }
            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();

            $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败']);
        }

        (new StaffLog)->add($temp_log_string);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function parameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'upload_file_size' => ['type' => 'integer', 'required' => false],
                'admin_web_name' => ['type' => 'string'],
                'web_name' => ['type' => 'string'],                
            ]);
        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        return I('post.');
    }
}