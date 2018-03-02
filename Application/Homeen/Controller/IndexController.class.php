<?php
namespace Homeen\Controller;

use Home\Common\Page\Image;
use Think\Controller;

class IndexController extends Controller
{

    public function index()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'nav' => '导航图片',
            'market' => '股市概况',
            'index' => '首页',
            'join' => '加入雅居乐',
            'join_en' => 'Join Agile',

        ];

        $level_id = M('menuLevel')->where(['name' => $show_tags_lists['index'], 'status' => C('STATUS_VALID')])->getField('level_id');

        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);
        $nav_images = $image->getImage($show_tags_lists['nav']);
        $market_images = $image->getImage($show_tags_lists['market']);

        $join_level_id = M('menuLevel')->where(['name' => $show_tags_lists['join_en'], 'status' => C('STATUS_VALID')])->getField('level_id');
        $image_obj = new Image($join_level_id);
        $join_images = $image_obj->getImage($show_tags_lists['join']);

        $mobile_head_images = $image->getMobileImage($tags);
        $mobile_nav_images = $image->getMobileImage($show_tags_lists['nav']);
        $mobile_market_images = $image->getMobileImage($show_tags_lists['market']);
        $mobile_join_images = $image_obj->getMobileImage($show_tags_lists['join']);
        //集团新闻
        $news_app = new \Homeen\Common\News\Service();
//        $data['web_stick'] = C('STATUS_VALID');
//        $sql_paramter['where'] = $data;
//        $sql_paramter['limit'] = 1;
//        list($total_count, $group_notices) = $news_app->group(null, $sql_paramter);

        $level_where['status'] = C('STATUS_VALID');
        $levels = M('menu_level')->where($level_where)->select();
        $list_levels = $this->getAllLevelByNews($levels);
        $list_levels_id = array_column($list_levels, 'level_id');

        // 获取头条
        $data['level_id'] = ['IN', $list_levels_id];
        $data['status'] = C('STATUS_VALID');
        $data['web_stick'] = C('STATUS_VALID');
        $data['begin_time'] = ['ELT', (new \DateTime())->format('Y-m-d')];
        $data['_string'] = "end_time is null or end_time >= '" . (new \DateTime())->format('Y-m-d') . "'";

        $news_notices = M('notice')->where($data)->order('weight desc,begin_time desc')->limit(1)->select();


//		dump($group_notices);
        // 楼盘速递
		$where['_string'] = "image_url1 is not null and image_url1 !='' ";
		$order = 'stick desc,weight desc,begin_time desc,update_time desc';
		$thismonth = (date('m') - 0) . "月";
//        $lastmonth = ($thismonth-1)."月";
		$year = date('Y');
		list($total_count, $thismonth_notices) = $news_app->building($thismonth, $year, $where, 2, $order);
	
		if (2 > count($thismonth_notices)) {
		
			list($thismonth, $year, $thismonth_notices) = $this->getMonth($news_app, $thismonth, $year, $where, $order);
		
		}
//        $lastmonth=($thismonth-1)."月";
		if ($thismonth > 1) {
			$lastmonth = ($thismonth - 1) . "月";
			$last_year = $year;
		} else {
			$lastmonth = ($thismonth + 12 - 1) . "月";
			$last_year = $year - 1;
		}
	
		list($total_count, $lastmonth_notices) = $news_app->building($lastmonth, $last_year, $where, 2, $order);
	
		if (2 > count($lastmonth_notices)) {
		
			list($lastmonth, $last_year, $lastmonth_notices) = $this->getMonth($news_app, $lastmonth, $last_year, $where, $order);
		}
        $first_search = cookie('new_first_search');
        if (!$first_search) {
            cookie('new_first_search', 'yes', 3600 * 15);
            $this->assign('new_first_search', 1);
        }
        $thismonth_en=$this->getEnglishMonth($thismonth);
        $lastmonth_en=$this->getEnglishMonth($lastmonth);
        //集团新闻
        $this->assign('head_images', $head_images);
        $this->assign('nav_images', $nav_images);
        $this->assign('market_images', $market_images);
        $this->assign('join_images', $join_images);
        $this->assign('group_notices', $news_notices);
        $this->assign('mobile_head_images', $mobile_head_images);
        $this->assign('mobile_nav_images', $mobile_nav_images);
        $this->assign('mobile_market_images', $mobile_market_images);
        $this->assign('mobile_join_images', $mobile_join_images);

        // 楼盘速递
        $this->assign('thismonth', $thismonth_en);
        $this->assign('thismonth_notices', $thismonth_notices);
        $this->assign('lastmonth', $lastmonth_en);
        $this->assign('lastmonth_notices', $lastmonth_notices);
        // 集团二维码
        $this->assign('two_bar_codes', \Homeen\Common\Service::getTwoBarCodes());

        $this->display();
    }


    /**
     * 入参检查
     * @return  get参数数组
     */

    private function parameterCheck()
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('get.'), [
                'level_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {
            $this->error("参数错误，请检查！", __ACTION__ . '');
            exit;
        }

        return I('get.');
    }
	
	private function getMonth($news_app, $month, $year, $where, $order)
	{
		
		if ($month > 1) {
			$month = ($month - 1) . "月";
		} else {
			$month = ($month + 12 - 1) . "月";
			$year = $year - 1;
		}
		list($total_count, $notices) = $news_app->building($month, $year, $where, 2, $order);
		
		if (2 > count($notices)) {
			list($month, $year, $notices) = $this->getMonth($news_app, $month, $year, $where, $order);
			
		}
		return [$month, $year, $notices];
	}
	
	
	private function getAllLevelByNews($levels)
    {
        foreach ($levels as $level) {
            if ($level['name'] == \Homeen\Common\News\Service::SHOW_TAGS_LISTS['news']) {
                $news_level = $level;
                break;
            }
        }

        $level_app = new \Homeen\Common\Level();
        $level_app->getLevelById($levels, $news_level);

        return $level_app->list_levels;
    }
    //月份转换为英文
    private function getEnglishMonth($val)
    {
        switch ($val){
            case '1月':
                $res='Jan';
                break;
            case '2月':
                $res = 'Feb';
                break;
            case '3月':
                $res = 'Mar';
                break;
            case '4月':
                $res = 'Apr';
                break;
            case '5月':
                $res = 'May';
                break;
            case '6月':
                $res = 'June';
                break;
            case '7月':
                $res = 'July';
                break;
            case '8月':
                $res = 'Aug';
                break;
            case '9月':
                $res = 'Sept';
                break;
            case '10月':
                $res = 'Oct';
                break;
            case '11月':
                $res = 'Nov';
                break;
            case '12月':
                $res = ' Dec';
                break;
        }
        return $res;
    }
}