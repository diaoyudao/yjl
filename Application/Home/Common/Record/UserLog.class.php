<?php
namespace Home\Common\Record;

class UserLog
{
    public static function add($event = '', $menu_name = '')
    {
        $data = self::margeData($event, $menu_name);

        $model = M('user_log');
        $ret = $model->add($data);
        if (false === $ret) {
            \Think\Log::write('write user_log db error,content=' + $event);
        }
    }

    public static function changeLastCall()
    {
        $login_time = cookie('tm');
        $model = M('user_log');

        $where['ip'] = get_client_ip();
        $where['client_type'] = self::getUersAgent();
        $where['login_time'] = $login_time;
        $id = $model->field('user_log_id,create_time')->where($where)->order('create_time desc')->limit(1)->select();
        if(!$id) {
            return false;
        }

        $sec = ((new \DateTime())->getTimestamp() - (new \DateTime($id[0]['create_time']))->getTimestamp()) / 60;

        $data['login_time'] = $login_time;
        $data['duration'] = $sec <= 0 ? 1 : (int)$sec;

        $ret = $model->where('user_log_id = %d', $id[0]['user_log_id'])->save($data);
        if (false === $ret) {
            \Think\Log::write('cok失败:'.$model->getDbError());
            return false;
        }

        return true;
    }

    private static function margeData($event, $menu_name)
    {
        $data['client_type'] = self::getUersAgent();
        $data['url'] = $_SERVER['REQUEST_URI'];
        $data['ip'] = get_client_ip();
        $data['controller'] = CONTROLLER_NAME;
        $data['action'] = ACTION_NAME;
        $data['menu_name'] = $menu_name;
        $data['event'] = $event;
        $data['login_time'] = cookie('tm');
        $data['duration'] = 1;

        return $data;
    }

    private static function getUersAgent()
    {
        $client =  $_SERVER['HTTP_USER_AGENT'];
        if(false !== stripos($client, 'android')) {
            return 'Android';
        } else if(false !== stripos($client, 'iphone')) {
            return 'iPhone';
        } else if(false !== stripos($client, 'mac')) {
            return 'Mac';
        } else if(false !== stripos($client, 'Firefox')) {
            return 'Firefox';
        } else if(false !== stripos($client, 'Chrome')) {
            return 'Chrome';
        } else if(false !== stripos($client, 'MSIE')) {
            return 'IE';
        } else {
            return $client;
        }
    }
}
