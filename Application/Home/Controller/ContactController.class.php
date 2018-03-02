<?php
namespace Home\Controller;

use Think\Controller;

class ContactController extends Controller
{
    public function index()
    {
        $this->display();
    }

    public function customer()
    {
        $this->display();
    }

    public function investment()
    {
        $this->display();
    }

    public function honest()
    {
        $this->display();
    }

    /**
     * 举报表单
     */
    public function honestform()
    {
        if(IS_GET) {
            $this->display();

            return;
        }
        
        $parameter = $this->honestformParameterCheck();
        $this->honestformDuplicateCheck($parameter);
        
        $model = M('witnesses');
        $ret = $model->add($parameter);
        if(false === $ret) {
            $this->ajaxReturn(['status' => 'failed','message' => $model->getDbError()]);
        }

        $filename = '/home/www/yjl/Application/Home/View/default/Mail/honestmail.tpl';
        $to_mail = M('config')->where("name = 'honest_mail'")->field('value')->select();

        $mail_app = new \Admin\Common\Mail($to_mail[0]['value'], $to_mail[0]['value']);
        $mail_app->setFileContext($filename, $parameter);
        list($status, $msg) = $mail_app->sendmail('雅居乐官网邮件-廉洁举报');
        
        $this->ajaxReturn(['status' => 'ok']);
    }

    public function media()
    {
        if(IS_GET) {
            $this->display();

            return;
        }
        
        $parameter = $this->mediaParameterCheck();
        $this->mediaDuplicateCheck($parameter);
        
        $model = M('interviews');
        $ret = $model->add($parameter);
        if(false === $ret) {
            $this->ajaxReturn(['status' => 'failed','message' => $model->getDbError()]);
        }

        $filename = '/home/www/yjl/Application/Home/View/default/Mail/mediacontact.tpl';
        $to_mail = M('config')->where("name = 'media_mail'")->field('value')->select();

        $mail_app = new \Admin\Common\Mail($to_mail[0]['value'], $to_mail[0]['value']);
        $mail_app->setFileContext($filename, $parameter);
        list($status, $msg) = $mail_app->sendmail('雅居乐官网邮件-媒体登记');
        
        $this->ajaxReturn(['status' => 'ok']);
    }

    /**
     * 招聘
     */
    public function recruit()
    {
        $this->display();
    }

    private function honestformDuplicateCheck($parameter)
    {
        $model = M('witnesses');
        $where['defendant'] = $parameter['defendant'];
        $where['plaintiff'] = $parameter['plaintiff'];
        $where['tel'] = $parameter['tel'];
        $where['mail'] = $parameter['mail'];
        $where['note'] = $parameter['note'];
        $where['address'] = $parameter['address'];
        $where['process'] = $parameter['process'];

        $result = $model->where($where)->select();

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该举报信息已经存在，请勿重复提交！']);
        }
    }
    
    private function honestformParameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'defendant' => ['type' => 'string'],
                'city' => ['type' => 'string'],
                'company_type' => ['type' => 'string'],
                'partiton' => ['type' => 'string'],
                'desc' => ['type' => 'string'],
                'plaintiff' => ['type' => 'string'],
                'mail' => ['type' => 'string'],
                'tel' => ['type' => 'string'],
                'qq' => ['type' => 'string'],
                'note' => ['type' => 'string'],
                'address' => ['type' => 'string'],
                'process' => ['type' => 'string'],
                'evidence' => ['type' => 'string'],
                'file_name' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'file_url' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'verify' => ['type' => 'string'],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！']);
        }

        // 检查验证码
        session_start();
        $ret = (new \Admin\Common\Verify())->check_verify(I('post.verify'));
        if (!$ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '验证码无效，请刷新后重试！']);
        }
        
        $parameter = I('post.');
        
        $desc = '';
        foreach(I('post.') as $key => $item) {
            if('desc' == $key) {
                $desc = $item . ', ';
            }
        }
        $parameter['desc'] = trim($desc, ', ');

        $parameter['ip'] = get_client_ip();
        $parameter['attachment'] = $parameter['file_url'] ;
        
        return $parameter;
    }
    
    /**
     * 重复检查
     */
    private function mediaDuplicateCheck($parameter)
    {
        $model = M('interviews');
        $where['organize'] = $parameter['organize'];
        $where['name'] = $parameter['name'];
        $where['tel'] = $parameter['tel'];
        $where['note'] = $parameter['note'];

        $result = $model->where($where)->select();

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该采访信息已经存在，请勿重复提交！']);
        }
    }
    
    private function mediaParameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'organize' => ['type' => 'string'],
                'name' => ['type' => 'string'],
                'tel' => ['type' => 'string'],
                'note' => ['type' => 'string'],
                'verify' => ['type' => 'string'],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '参数错误，请检查！.']);
        }

        // 检查验证码
        session_start();
        $ret = (new \Admin\Common\Verify())->check_verify(I('post.verify'));
        if (!$ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '验证码无效，请刷新后重试！']);
        }

        return I('post.');
    }

    public function test()
    {
        $this->display();
    }
}