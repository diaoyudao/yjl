<?php
namespace Homeen\Controller;

use Think\Controller;

class JoinController extends Controller
{
    const PAGE_LIST_COUNT = 12;
    const POST_PAGE_LIST_COUNT = 6;
    const SHOW_TAGS_LISTS = [
        'head_image' => '头部图片',
		'menu_name' => 'Corporate Cultural Activities',
		'join_image' => '加入雅居乐',
		'development_image' => '员工发展',
    ];
    
	public function index()
	{
		$parameter = $this->parameterCheck();

		$image_app = new \Homeen\Common\Page\Image($parameter['level_id']);
		$head_images = $image_app->getImage(self::SHOW_TAGS_LISTS['head_image']);
		$join_images = $image_app->getImage(self::SHOW_TAGS_LISTS['join_image']);
		$development_images = $image_app->getImage(self::SHOW_TAGS_LISTS['development_image']);
		$mobile_head_images= $image_app->getMobileImage(self::SHOW_TAGS_LISTS['head_image']);
		$mobile_join_images = $image_app->getMobileImage(self::SHOW_TAGS_LISTS['join_image']);
		$mobile_development_images = $image_app->getMobileImage(self::SHOW_TAGS_LISTS['development_image']);

		$where['status'] = C('STATUS_VALID');
		$where['name'] = self::SHOW_TAGS_LISTS['menu_name'];
		$two_level_id = M('menu_level')->where($where)->getField('level_id');

		//获取前10条
		$model = M('notice');

		$where_notice['level_id'] = $two_level_id;
		$where_notice['status'] = C('STATUS_VALID');

		$notices = $model->field('notice_id,name,desc,thumbnail_url1,thumbnail_url2,image_url1,image_url2')->where($where_notice)->order("stick desc,weight desc,begin_time desc")->limit(10)->select();

		$this->assign('notices', $notices);
		$this->assign('head_images', $head_images);
		$this->assign('join_images', $join_images);
		$this->assign('development_images', $development_images);
		$this->assign('mobile_head_images', $mobile_head_images);
		$this->assign('mobile_join_images', $mobile_join_images);
		$this->assign('mobile_development_images', $mobile_development_images);
		$this->display();
	}

	/**
	 * 文化
	 */
	public function culture()
	{
		$this->display();
	}

	/**
	 * 员工发展
	 */
	public function staff()
	{
        $parameter = $this->parameterCheck();

		$where['status'] = C('STATUS_VALID');
		$where['name'] = self::SHOW_TAGS_LISTS['menu_name'];
		$level_id = M('menu_level')->where($where)->getField('level_id');
        $model = M('notice');

		$where_notice['level_id'] = $level_id;
		$where_notice['status'] = C('STATUS_VALID');

		$notices = $model->field('notice_id,name,desc,thumbnail_url1,thumbnail_url2,image_url1,image_url2')->where($where_notice)->order("stick desc,weight desc,begin_time desc")->limit(7)->select();

		$image_app = new \Homeen\Common\Page\Image($parameter['level_id']);
		$head_images = $image_app->getImage(self::SHOW_TAGS_LISTS['head_image']);
		$mobile_head_images = $image_app->getMobileImage(self::SHOW_TAGS_LISTS['head_image']);


        $this->assign('notices', $notices);
        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);
		$this->display();
	}
    
    public function development()
	{
        $parameter = $this->parameterCheck();
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : 1;
        
        $model = M('notice');
        
		$where_notice['level_id'] = $parameter['level_id'];
		$where_notice['status'] = C('STATUS_VALID');
        $page_count = IS_POST ? self::POST_PAGE_LIST_COUNT : self::PAGE_LIST_COUNT;
        
        $counts = $model->where($where_notice)->count();
        $page = new \Think\Page($counts, $page_count);
        $page->show();

        $notices = $model->field('notice_id,name,desc,thumbnail_url1,thumbnail_url2,image_url1,image_url2')
            ->page($pg, $page_count)->where($where_notice)
            ->order("web_stick desc,stick desc,weight desc,begin_time desc")
            ->select();
        $notices = \Adminen\Common\Base::removeColumn($notices, 'note');       

        if (IS_POST) {
            $this->ajaxReturn(['status' => 'ok', 'total_pages' => $page->totalPages, 'notices' => $notices]);
        }
        
//        var_dump($page->totalPages);

        $this->assign('notices', $notices);
        $this->assign('total_pages', $page->totalPages);
		$this->display();
	}

	/*
	 * 人才招聘
	 */
	public function recruit()
	{
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
//				'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
			]);
		} catch (\Exception $ex) {
			$this->error("参数错误，请检查！", __ACTION__ . '');
			exit;
		}

		return I('get.');
	}
}