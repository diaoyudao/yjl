<?php
namespace Adminen\Controller\Templet;

use Think\Controller;
use Adminen\Common\Record\StaffLog;

class TestController extends Controller
{
    public function Index()
    {
        //phpinfo();
        $this->test2();
        $this->sendmail();
    }

    public function test(){
        echo 'ttt';
        try{
            $this->sendmail();
        } catch(\Exception $ex){
            echo '--exception:'.$ex->getMessage();
        }
    }

    private function test2()
    {
        $fp = fsockopen("127.0.0.1", 25, $errno, $errstr, 20);
        if (!$fp)
            echo "$errstr ($errno) <br> ";
        else
            echo 'ok <br> ';
    }

    private function sendmail()
    {
        require_once('./ThinkPHP/Library/Vendor/PhpMailer/class.phpmailer.php');

        $mail = new \PHPMailer();

        $body = $mail->getFile('./public/contents.html');
        $body = preg_replace("[\]", '', $body);

         $mail->IsSMTP(); // telling the class to use SMTP
        $mail->IsSendmail();
        $mail->Host = "172.16.30.128"; // SMTP server mail2.agile.com.cn
        $mail->Port = 25;

        $mail->From = "test@byyh.cn";
        $mail->FromName = "test@byyh.cn";
        $mail->SMTPAuth = true;
        $mail->Username = "mailtest";  // SMTP服务器用户名
        $mail->Password = "123456";

        $mail->Subject = "test mail";

        $mail->AltBody = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

        $mail->MsgHTML('test2</br>zhangsn');

        $mail->AddAddress("ljc539553@163.com", "test");

        $mail->AddAttachment("/home/www/git.sh");             // attachment

        echo 'begin send</br>';
        if (!$mail->Send()) {
            echo "Mailer Error: " . $mail->ErrorInfo;
        } else {
            echo "Message sent!";
        }
    }

    private function sendpop3()
    {
        require_once('./ThinkPHP/Library/Vendor/PhpMailer/class.phpmailer.php');
        require_once('./ThinkPHP/Library/Vendor/PhpMailer/class.pop3.php');

        $pop = new \POP3();
        $pop->Authorise('pop3.example.com', 110, 30, 'mailer', 'password', 1);

        $mail = new \PHPMailer();

        $mail->IsSMTP();
        $mail->SMTPDebug = 2;
        $mail->IsHTML(false);

        $mail->Host = 'relay.example.com';

        $mail->From = 'mailer@example.com';
        $mail->FromName = 'Example Mailer';

        $mail->Subject = 'My subject';
        $mail->Body = 'Hello world';
        $mail->AddAddress('name@anydomain.com', 'First Last');

        if (!$mail->Send()) {
            echo $mail->ErrorInfo;
        }
    }

    private function tt()
    {
        require_once('class.phpmailer.php');
        require_once("class.smtp.php");
        $mail  = new PHPMailer();

        $mail->CharSet    ="UTF-8";                 //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置为 UTF-8
        $mail->IsSMTP();                            // 设定使用SMTP服务
        $mail->SMTPAuth   = true;                   // 启用 SMTP 验证功能
        $mail->SMTPSecure = "ssl";                  // SMTP 安全协议
        $mail->Host       = "smtp.gmail.com";       // SMTP 服务器
        $mail->Port       = 465;                    // SMTP服务器的端口号
        $mail->Username   = "your_name@gmail.com";  // SMTP服务器用户名
        $mail->Password   = "your_password";        // SMTP服务器密码
        $mail->SetFrom('发件人地址', '发件人名称');    // 设置发件人地址和名称
        $mail->AddReplyTo("邮件回复人地址","邮件回复人名称");
        // 设置邮件回复人地址和名称
        $mail->Subject    = '';                     // 设置邮件标题
        $mail->AltBody    = "为了查看该邮件，请切换到支持 HTML 的邮件客户端";
        // 可选项，向下兼容考虑
        $mail->MsgHTML('');                         // 设置邮件内容
        $mail->AddAddress('收件人地址', "收件人名称");
//$mail->AddAttachment("images/phpmailer.gif"); // 附件
        if(!$mail->Send()) {
            echo "发送失败：" . $mail->ErrorInfo;
        } else {
            echo "恭喜，邮件发送成功！";
        }
    }

}