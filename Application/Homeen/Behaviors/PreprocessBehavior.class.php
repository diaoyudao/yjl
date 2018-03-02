<?php
namespace Homeen\Behaviors;
/**
 * @privilege_group
 * Class Privilege
 * @package Home\Behaviors
 */
class PreprocessBehavior extends \Think\Behavior
{
    //行为执行入口
    public function run(&$param)
    {
        $this->setTheme();
        /*
        $menu_name = $this->checkUrl();
        if(false === $menu_name) {
            return ;
        }

        $cookie = cookie('n');
        if(empty($cookie)) {
            $this->setFirstLogin($menu_name);
        } else if('bl' == $cookie) {
            $ctm = cookie('ctm');
            if(C('DURATION_OUT_TIME') <= ((new \DateTime())->getTimestamp()) - ((new \DateTime($ctm))->getTimestamp())) {
                if('COK' != $menu_name) {
                    $this->setFirstLogin($menu_name);
                }
                return;
            }

            $this->setLogined($menu_name);
        }
        */
    }

    private function setTheme()
    {
        if ($this->isMobile()) {
            \Think\Log::write('mobile client');
            C('DEFAULT_THEME', 'mobile');
        } else {
            \Think\Log::write('PC client');
            C('DEFAULT_THEME', 'default');
        }
    }

    private function isMobile()
    {
        //return true;
        $agent = $_SERVER['HTTP_USER_AGENT'];
        \Think\Log::write($agent);
//        $bIsIpad = stripos($agent, 'ipad');
        $bIsIphoneOs = stripos($agent, 'iphone os');
        $bIsMidp = stripos($agent, 'midp');
        $bIsUc7 = stripos($agent, 'rv:1.2.3.4');
        $bIsUc = stripos($agent, 'ucweb');
        $bIsAndroid = stripos($agent, 'android');
        $bIsCE = stripos($agent, 'windows ce');
        $bIsWM = stripos($agent, 'windows mobile');

        if (false !== $bIsIphoneOs || false !== $bIsMidp || false !== $bIsUc7 || false !== $bIsUc || false !== $bIsAndroid || false !== $bIsCE || false !== $bIsWM) {
            return true;
        }
        return false;
    }

    private function setFirstLogin($menu_name)
    {
        cookie('n', 'bl', ['expire' => C('COOKIE_EXPIRE'), 'prefix' => C('COOKIE_PREFIX')]);
        cookie('tm', (new \DateTime())->format('Y-m-d H:i:s'), ['expire' => C('COOKIE_EXPIRE'), 'prefix' => C('COOKIE_PREFIX')]);
        cookie('ctm', (new \DateTime())->format('Y-m-d H:i:s'), ['expire' => C('COOKIE_EXPIRE'), 'prefix' => C('COOKIE_PREFIX')]);

        \Homeen\Common\Record\UserLog::add('首次访问', $menu_name);
    }

    private function setLogined($menu_name)
    {
        cookie('ltm', cookie('ctm'), ['expire' => C('COOKIE_EXPIRE'), 'prefix' => C('COOKIE_PREFIX')]);
        cookie('ctm', (new \DateTime())->format('Y-m-d H:i:s'), ['expire' => C('COOKIE_EXPIRE'), 'prefix' => C('COOKIE_PREFIX')]);

        \Homeen\Common\Record\UserLog::changeLastCall();

        if ('COK' != $menu_name) {
            \Homeen\Common\Record\UserLog::add('访问', $menu_name);
        }
    }

    private function checkUrl()
    {
        $url = parse_url($_SERVER['REQUEST_URI']);
        foreach (C('HOME_MENU_LISTS') as $key => $value) {
            $key = C('HOME_PATH') . $key;
            if ($url['path'] == $key) {
                return $value;
            }
        }

        return false;
    }
}