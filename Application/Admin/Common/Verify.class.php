<?php
namespace Admin\Common;

/**
 * 
 */
class Verify
{
    public function get()
    {
        $config = [
            'fontSize' => 30, // 验证码字体大小
            'length' => 4, // 验证码位数
            'useNoise' => true, // 验证码杂点
            'expire' => C('VERIFY_TIMEOUT'),  // 秒过期
            'seKey' => C('VERIFY_KEY'), // 加密
        ];
        $Verify = new \Think\Verify($config);
        $Verify->entry(C('VERIFY_ID'));
    }

    public function check_verify($code)
    {
        $config = [
            'seKey' => C('VERIFY_KEY'), // 加密
        ];
        $verify = new \Think\Verify($config);

        return $verify->check($code, C('VERIFY_ID'));
    }
}