<?php
namespace Home\Controller;

use Think\Controller;

class DownController extends Controller
{
    public function index()
    {
        $parameter = $this->parameterCheck();
        $type = $parameter['type'];
        if('upgrade' == $type ) {
            $event = '下载升级包' . $parameter['context'];            
        } else if('map' == $type) {
            $event = '下载地图包' . $parameter['context'];
        }else {
            $this->ajaxReturn(['status' => 'false','message' => '参数错']);
        }
        
        \Home\Common\Record\UserLog::add($event, '下载');
        
        $this->ajaxReturn(['status' => 'ok']);
    }
    
    /**
     * 入参检查
     * @return  get参数数组
     */

    private function parameterCheck()
    {

        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('get.'), [
                'type' => ['type' => 'string'],
                'context' => ['type' => 'string', 'required' => false],
            ]);
        } catch (\Exception $ex) {
            $this->ajaxReturn(['status' => 'false','message' => '参数错']);
        }

        return I('post.');
    }
}