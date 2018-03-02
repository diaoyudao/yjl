<?php
namespace Admin\Common\Record;

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
        $data['zh_en'] = '中文版';

        $model = M('StaffLog');
        $ret = $model->add($data);
        if (!$ret) {
            \Think\Log::write('write staff_log error,content=' + $event);
        }
    }
}
