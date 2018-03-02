<?php
namespace Admin\Common;
/**
 * @Release
 * Class Release
 * @package Admin\Common
 */
class Release
{
    private $staff_id;

    public function __construct()
    {
        $this->staff_id = session('staff_id');
    }

    /**
     * 获取用户权限，编辑者，审核者
     * @return 1:编辑者； 2:审核者
     */
    public function getRelease()
    {        
        $where['staff_id'] = $this->staff_id;
        $staff =  M('staff')->find($this->staff_id);
        
        return $staff['identity'];
    }
}