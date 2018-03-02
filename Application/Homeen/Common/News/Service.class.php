<?php
namespace Homeen\Common\News;

class Service
{
    const SHOW_TAGS_LISTS = [
        "news" => "News Centre",
        "media" => "Media Reports",
        "group" => "Group News",
        "duty" => "Social Responsibilities",
        'estate' => 'Property Development',
        'life' => 'A-Living',
        'education' => 'Education',
        'duty_education' => 'Education',
        'environment' => 'Environment',
        'duty_environment' => 'Environment',
        'duty_other' => 'Other',
        'building' => '楼盘速递',

    ];

    // 集团新闻
    public function group($level_id = null, $sql_paramter)
    {
        if ($level_id === null) {
            $level_where['status'] = C('STATUS_VALID');
            $level_where['name'] = self::SHOW_TAGS_LISTS['group'];
            $level_id = M('menu_level')->where($level_where)->getField('level_id');
        }

        $notice_app = new \Homeen\Common\Page\Notice($level_id);
        return $notice_app->getNotice('', $sql_paramter['where'], $sql_paramter['limit'], $sql_paramter['order']);
    }

    // 地产新闻
    public function estate($level_id = null, $sql_paramter)
    {
        return $this->commonNotice('estate', $level_id, $sql_paramter);
    }
	
	// 楼盘速递
	public function building($month = null,$tags=null, $where = [], $limit = null,$order)
	{
		if (null != $month){
			$level_id = $this->getBuildingChildrenId($month);
		}
		
		$notice_app = new \Home\Common\Page\Notice($level_id);
		return $notice_app->getNotice($tags, $where, $limit,$order);
	}

    // life
    public function life($level_id = null, $sql_paramter)
    {
        return $this->commonNotice('life', $level_id, $sql_paramter);
    }

    // education
    public function education($level_id = null, $sql_paramter)
    {
        return $this->commonNotice('education', $level_id, $sql_paramter);
    }

    // environment
    public function environment($level_id = null, $sql_paramter)
    {
        return $this->commonNotice('environment', $level_id, $sql_paramter);
    }

    private function commonNotice($type, $level_id, $array)
    {
        if ($level_id === null) {
            $level_id = $this->getMediaChildrenId($type);
        }

        $notice_app = new \Homeen\Common\Page\Notice($level_id);
        return $notice_app->getNotice('', $array['where'], $array['limit'], $array['order']);
    }

    private function commonDuty($type, $level_id, $array)
    {
        if ($level_id === null) {
            $level_id = $this->getDutyChildrenId($type);
        }

        $notice_app = new \Homeen\Common\Page\Notice($level_id);
        return $notice_app->getNotice('', $array['where'], $array['limit'], $array['order']);
    }

    //dutyEducation
    public function dutyEducation($level_id = null, $sql_paramter)
    {
        return $this->commonDuty('duty_education', $level_id, $sql_paramter);
    }

    //dutyOther
    public function dutyOther($level_id = null, $sql_paramter)
    {

        return $this->commonDuty('duty_other', $level_id, $sql_paramter);

    }

    //dutyEnvironment
    public function dutyEnvironment($level_id = null, $sql_paramter)
    {
       
        return $this->commonDuty('duty_environment', $level_id, $sql_paramter);

    }

    private function getMediaChildrenId($type)
    {
        $level_where['status'] = C('STATUS_VALID');
        $level_where['name'] = self::SHOW_TAGS_LISTS['media'];
        $pid = M('menu_level')->where($level_where)->getField('level_id');

        $level_where['name'] = self::SHOW_TAGS_LISTS[$type];
        $level_where['pid'] = $pid;
        $level_id = M('menu_level')->where($level_where)->getField('level_id');

        return $level_id;
    }

    private function getDutyChildrenId($type)
    {
        $level_where['status'] = C('STATUS_VALID');
        $level_where['name'] = self::SHOW_TAGS_LISTS['duty'];
        $pid = M('menu_level')->where($level_where)->getField('level_id');

        $level_where['name'] = self::SHOW_TAGS_LISTS[$type];
        $level_where['pid'] = $pid;
        $level_id = M('menu_level')->where($level_where)->getField('level_id');

        return $level_id;
    }

    private function getBuildingChildrenId($type)
    {
        $level_where['status'] = C('STATUS_VALID');
        $level_where['name'] = self::SHOW_TAGS_LISTS['building'];
        $pid = M('menu_level')->where($level_where)->getField('level_id');

        $level_where['name'] = $type;
        $level_where['pid'] = $pid;
        $level_id = M('menu_level')->where($level_where)->getField('level_id');

        return $level_id;
    }
}