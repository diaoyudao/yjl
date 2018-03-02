<?php
namespace Adminen\Common\Record;

class StaffLog
{
    public function add($event)
    {
        $data['staff_code'] = session('login_id');
        $data['name'] = session('staff_name');
        $data['ip'] = get_client_ip();
        $data['controller'] = CONTROLLER_NAME;
        $data['action'] = ACTION_NAME;
        $data['menu_name'] = session('current_menu_name');
        $data['event'] = $event;
        $data['zh_en'] = '英文版';

        $model = M('StaffLog', '',C('DB_STAFF_CONFIG'));
        $ret = $model->add($data);
        if (!$ret) {
            \Think\Log::write('write staff_log error,content=' + $event);
        }
    }
}
