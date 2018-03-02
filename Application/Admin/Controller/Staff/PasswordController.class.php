<?php
namespace Admin\Controller\Staff;

use Think\Controller;
use Admin\Common\Record\StaffLog;

/**
 * 后台管理登录
 * @package Admin\Controller
 */
class PasswordController extends Controller
{
    public function change()
    {
        if (IS_GET) {  // 获取页面
            $this->display();
            return;
        }

        // 提交数据
        $this->changeSubmit();
    }

    /**
     * 重置密码
     */
    public function reset()
    {
        $staff_id = I('post.staff_id',-1, FILTER_VALIDATE_INT);
        if(0 > $staff_id) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '用户不正确']);
        }

        $model = M('Staff');
        $new_passwd = md5(C('INIT_PASSWORD'));

        $staff = $model->find($staff_id);
        $model->where('staff_id = %d', $staff_id)->save(['password' => $new_passwd]);

        (new StaffLog)->add('重置密码，用户：'.$staff['name']);  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function changeSubmit()
    {
        $parameter = $this->checkParameter();

        $old_passwd = md5($parameter['old_passwd']);
        $new_passwd = md5($parameter['new_passwd']);
        $staff_id = session('staff_id');

        $model = M('Staff');
        $model->startTrans();
        try {
            $count = $model->where("staff_id = %d and password = '%s' and status = 1", $staff_id, $old_passwd)->count();
            if (0 >= $count) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '旧密码不正确，请检查!']);
            }

            $data['password'] = $new_passwd;
            $ret = $model->where('staff_id = %d', $staff_id)->save($data);
            if ($ret === false) {
                $this->ajaxReturn(['status' => 'failed', 'message' => '执行失败！']);
            }

            $model->commit();
        } catch (\Exception $ex) {
            $model->rollback();
            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        (new StaffLog)->add('修改密码');  // 日志记录

        $this->ajaxReturn(['status' => 'ok']);
    }

    private function checkParameter()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'old_passwd' => ['regexp' => '/^.{1,20}$/'],
                'new_passwd' => ['regexp' => '/^(?=.*[0-9].*)(?=.*[A-Za-z].*)[0-9A-Za-z!@#\$%\^&\*]{8,20}$/'],
            ]);
        } catch (\Exception $ex) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '密码格式不对']);
        }

        if (C('INIT_PASSWORD') == I('post.new_passwd')) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '新密码不能等于初始密码！']);
        }

        return I('post.');
    }
}