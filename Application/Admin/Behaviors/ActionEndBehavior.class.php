<?php
namespace Admin\Behaviors;
/**
 * @desc session 操作类
 * Class Privilege
 * @package Admin\Behaviors
 */
class ActionEndBehavior extends  \Think\Behavior
{
    /**
     * @param = [
     *      'status' => (integer),
     *      'message' => (string)
     * ]
     */
    public function run(&$param)
    {        
        echo json_encode($param);
        exit;
    }
}