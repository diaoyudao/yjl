<?php
namespace Homeen\Controller;

use Home\Common\Page\Image;
use Think\Controller;

class EnterController extends Controller
{
    const POST_PAGE_LIST_COUNT = 6;
    const PAGE_LIST_COUNT = 12;
    const NOTICE_LIST_TOTAL = 25;

    public function index()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'history' => '发展历程',
            'honor' => '荣誉集锦',
            'publicity' => '企业宣传',
            'magazine' => '企业画册',
        ];
        $parameter = $this->parameterCheck();


        $history_level_id = M('menuLevel')->where(['name' => $show_tags_lists['history'], 'status' => C('STATUS_VALID')])->getField('level_id');

        //发展历程


        $where['level_id'] = $history_level_id;
        $where['status'] = C('STATUS_VALID');
        $model = M('notice');


        $tags = $model->where($where)
            ->order('tags desc')->distinct(true)->limit('0,5')->getField('tags', true);

        $result = [];
        foreach ($tags as $v) {
            $where['tags'] = $v;
            $notices = $model->where($where)
                ->order('weight desc,begin_time desc')->limit(3)->select();
            $result[] = $notices;
        }

        //头图
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);
        $mobile_head_images = $image->getMobileImage($tags);


        //集团画册
        $file_w['f.status'] = C('STATUS_VALID');
        $file_w['m.status'] = C('STATUS_VALID');
        $file_w['m.name'] = $show_tags_lists['publicity'];
        $file_w['f.tags'] = $show_tags_lists['magazine'];
        $file = M('file')->alias('f')->field('f.*')->join("menu_level m on m.level_id=f.level_id")
            ->where($file_w)->order("f.weight desc")->select();

//		dump($file);
	
		//荣耀图片 置顶的8张
		$honor_w['n.status'] = C('STATUS_VALID');
		$honor_w['n.stick'] = C('STATUS_VALID');
        $honor_w['m.status'] = C('STATUS_VALID');
        $honor_w['m.name'] = $show_tags_lists['honor'];

        $honor = M('notice')->alias('n')->field('n.*')->join("menu_level m on m.level_id=n.level_id")
            ->where($honor_w)->order("n.weight desc")->limit(8)->select();
        $this->assign('history', $result);
        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);
        $this->assign('file', $file);
        $this->assign('honor', $honor);
        $this->display();
    }

    public function group()
    {
        $show_tags_lists = [
            'head' => '头部图片',

        ];
        $parameter = $this->parameterCheck();
        //头图
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);
        $mobile_head_images = $image->getMobileImage($tags);
        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);

        $this->display();
    }


    public function history()
    {
        $index_count = 10;
        $show_tags_lists = [
            'head' => '头部图片',
        ];
        $parameter = $this->parameterCheck();

        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
//		$model = M('notice');
        $where['level_id'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');
//        $where['stick'] = C('STATUS_VALID');
        $model = M('notice');
        $lists = $model->where($where)
            ->order('tags desc')->distinct(true)->getField('tags', true);
        $counts = count($lists);
//        dump($counts);
        $page = new \Think\Page($counts, $index_count);
        $page->show();
//        $counts = $model->where($where)->count();
//        $page = new \Think\Page($counts, $index_count);
//        $page->show();

        $tags = $model->page($pg, $index_count)->where($where)
            ->order('tags desc')->distinct(true)->getField('tags', true);

//        $result = [];
        foreach ($tags as $v) {
            $where['tags'] = $v;
            $notices = $model->where($where)
                ->order('weight desc,begin_time desc')->limit(3)->select();
//            echo $v;
            $result[] = $notices;
        }
//        $tags=array_column($notices,)

        if (IS_POST) {

            $this->ajaxReturn([
                'status' => 'ok',
                'total_pages' => $page->totalPages,
                'notice' => $result
            ]);
        }
//        dump($result);
        //头图
        $level_id = $parameter['level_id'];
        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);

//		dump($notice);
        $this->assign('head_images', $head_images);
        $this->assign('notice', $result);
        $this->display();
    }

//    public function honor()
//    {
//        $index_count=3;
//        $parameter = $this->parameterCheck();
//        $tags = IS_POST ? I('post.tags', '', FILTER_SANITIZE_STRING) : '';
//        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
////		dump($tags);
////		dump($where);
//        $where['level_id'] = $parameter['level_id'];
//        $where['status'] = C('STATUS_VALID');
////        $where['stick'] = C('STATUS_VALID');
//        if ($tags) $where['tags'] = $tags;
//        $model = M('notice');
//
//        $lists = $model->where($where)
//                ->order('tags desc')->distinct(true)->getField('tags', true);
//        $counts=count($lists);
//        $page = new \Think\Page($counts, $index_count);
//        $page->show();
//
//        $tags = $model->page($pg, $index_count)->where($where)
//            ->order('tags desc')->distinct(true)->getField('tags', true);
//
////        $result = [];
//        foreach ($tags as $v) {
//            $where['tags'] = $v;
//            $notices = $model->field('name,tags,link_url1')->where($where)
//                ->order('weight desc,begin_time desc')->select();
////            echo $v;
//            $result[] = $notices;
//        }
////        $tags=array_column($notices,)
//
//        if (IS_POST) {
//
//            $this->ajaxReturn([
//                'status' => 'ok',
//                'total_pages' => $page->totalPages,
//                'item' => $result
//            ]);
//        }
//        $count = $page->totalPages;
//
//        $this->assign('lists', $lists);
//        $this->assign('notice', $result);
//        $this->assign('total', $count);
//        $this->display();
//    }
    public function honor()
    {
        $tags = IS_POST ? I('post.tags', '', FILTER_SANITIZE_STRING) : '';
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
//		dump($tags);

        if ($tags) $where['tags'] = $tags;
//		dump($where);
        $parameter = $this->parameterCheck();
        $where['level_id'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');
        $model = M('notice');
//        $notice = $model->where($where)->order("tags desc,weight desc,begin_time desc")->select();
        $count = $model->where($where)->order("tags desc,weight desc,begin_time desc")->count();
        $page = new \Think\Page($count, self::NOTICE_LIST_TOTAL);
        $page->show();
        $totalpages = $page->totalPages;
        $notice = $model->page($pg, self::NOTICE_LIST_TOTAL)->where($where)->order("tags desc,weight desc,begin_time desc")->select();
        $tags = array_merge([], array_unique(array_column($notice, 'tags')));

        $lists = $model->where($where)->order("tags desc,weight desc,begin_time desc")->distinct(true)->getField('tags', true);

        foreach ($tags as $key => $val) {
            foreach ($notice as $v) {
                if ($val == $v['tags']) $result[$key][] = $v;
            }
        }
        if (IS_POST) {
            if ($result) {
                $this->ajaxReturn([
                    'status' => 'ok',
                    'msg' => 'success',
                    'total' => $totalpages,
                    'item' => $result
                ]);
            }
        }

        $this->assign('lists', $lists);
        $this->assign('notice', $result);
        $this->assign('total', $totalpages);
        $this->display();
    }

    public function duty()
    {
        $index_count = 3;
        $show_tags_lists = [
            'head' => '头部图片',
            'education' => '教育事业',
            'environment' => '环境保护',
            'other' => '其他',

        ];
        $parameter = $this->parameterCheck();
//		$where['pid'] = $parameter['level_id'];
//		$where['status'] = C('STATUS_VALID');
//
//		$menu_name = M('menu_level')->where($where)->order("weight desc")->getField('name', true);

        //头图
        $level_id = $parameter['level_id'];
        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);
        $mobile_head_images = $image->getMobileImage($tags);


        $news_app = new \Homeen\Common\News\Service();
//        $data['stick'] = C('STATUS_VALID');
//        $where['stick'] = C('STATUS_INVALID');
        $where = [];

        $sql_parameter['where'] = $where;
        $sql_parameter['order'] = 'web_stick desc,stick desc,weight desc,begin_time desc';
        $sql_parameter['limit'] = $index_count;


//        list($total_count, $education_head_notices) = $news_app->dutyEducation(null, $data, 1);
//        list($total_count, $environment_head_notices) = $news_app->dutyEnvironment(null, $data, 1);
//        list($total_count, $other_head_notices) = $news_app->dutyOther(null, $data, 1);
        list($total_count, $education_notices) = $news_app->dutyEducation(null, $sql_parameter);
        list($total_count, $environment_notices) = $news_app->dutyEnvironment(null, $sql_parameter);
        list($total_count, $other_notices) = $news_app->dutyOther(null, $where, $sql_parameter);


//		dump($education_notices);
//		dump($environment_notices);
//		dump($other_notices);

        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);
////		$this->assign('menu_name', $menu_name);
//        $this->assign('education_head_notices', $education_head_notices);
//        $this->assign('environment_head_notices', $environment_head_notices);
//        $this->assign('other_head_notices', $other_head_notices);
        $this->assign('education_notices', $education_notices);
        $this->assign('environment_notices', $environment_notices);
        $this->assign('other_notices', $other_notices);


        $this->display();
    }

    /**
     * 主席
     */
    public function chair()
    {
        $this->display();
    }

    public function campaign()
    {
        $this->display();
    }

    //环境保护列表页
    public function environmentlists()
    {
//        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
//        $news_app = new \Homeen\Common\News\Service();
//
//        $where['stick'] = C('STATUS_VALID');
//        $data['stick'] = C('STATUS_INVALID');
//        //头条
//        list($total, $head_news) = $news_app->dutyEnvironment(null, $where, 1);
////		dump($head_news);
//        //头条以外的新闻
//        list($total_count, $notices) = $news_app->dutyEnvironment(null, $data, $this->getLimit($pg));
//        $total_pages = $this->getTotalPages($total_count);
//
//        if (IS_POST) {
//            list($total_count, $notices) = $news_app->dutyEnvironment(null, $data, $this->postLimit($pg));
////			dump($notices);
//
//            $this->ajaxReturn([
//                'status' => 'ok',
//                'total_pages' => $this->getTotalPages($total_count),
//                'notices' => $notices
//            ]);
//        }
//        $this->assign('head_news', $head_news);
//        $this->assign('total_pages', $total_pages);
//        $this->assign('notices', $notices);
//
//        $this->display();
        $this->getCommonDataList('dutyEnvironment');

    }

    //其他列表页
    public function otherlists()
    {

//        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
//        $news_app = new \Homeen\Common\News\Service();
//        $where['stick'] = C('STATUS_VALID');
//        $data['stick'] = C('STATUS_INVALID');
//        //头条
//        list($total, $head_news) = $news_app->dutyOther(null, $where, 1);
////		dump($head_news);
//        //头条以外的新闻
//        list($total_count, $notices) = $news_app->dutyOther(null, $data, $this->getLimit($pg));
//        $total_pages = $this->getTotalPages($total_count);
//
////		dump($notices);
//        if (IS_POST) {
//            list($total_count, $notices) = $news_app->dutyOther(null, $data, $this->postLimit($pg));
//            $this->ajaxReturn([
//                'status' => 'ok',
//                'total_pages' => $this->getTotalPages($total_count),
//                'notices' => $notices
//            ]);
//        }
//
//        $this->assign('head_news', $head_news);
//        $this->assign('total_pages', $total_pages);
//        $this->assign('notices', $notices);
//
//        $this->display();
        $this->getCommonDataList('dutyOther');

    }

    //教育事业列表页
    public function educationlists()
    {
//        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
//        $news_app = new \Homeen\Common\News\Service();
//        $where['stick'] = C('STATUS_VALID');
//        $data['stick'] = C('STATUS_INVALID');
//        //头条
//        list($total, $head_news) = $news_app->dutyEducation(null, $where, 1);
////		dump($head_news);
//        //头条以外的新闻
//        list($total_count, $notices) = $news_app->dutyEducation(null, $data, $this->getLimit($pg));
//        $total_pages = $this->getTotalPages($total_count);
//
////		dump($notices);
//        if (IS_POST) {
//            list($total_count, $notices) = $news_app->dutyEducation(null, $data, $this->postLimit($pg));
//            $this->ajaxReturn([
//                'status' => 'ok',
//                'total_pages' => $this->getTotalPages($total_count),
//                'notices' => $notices
//            ]);
//        }
//        $this->assign('head_news', $head_news);
//        $this->assign('total_pages', $total_pages);
//        $this->assign('notices', $notices);
//        $this->display();
        $this->getCommonDataList('dutyEducation');

    }

    public function publicity()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'media' => '视频中心',
            'magazine' => '企业画册',
        ];
        $parameter = $this->parameterCheck();
        $where['level_id'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');

        $file = M('file')->where($where)->order("weight desc,begin_time desc")->select();
        $where['stick'] = C('STATUS_VALID');

        $media = M('video')->where($where)->order("weight desc,begin_time desc")->limit(3)->select();


        $parameter = $this->parameterCheck();
        //头图
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);
        $mobile_head_images = $image->getMobileImage($tags);
        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);

        $this->assign('head_images', $head_images);
        $this->assign('media', $media);
        $this->assign('magazine', $file);

        $this->display();
    }

    public function publicityvedio()
    {
        $show_tags_lists = [
//            'head' => '头部图片',
            'media' => '企业宣传',
//            'magazine' => '企业画册',
        ];
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
        $where['status'] = C('STATUS_VALID');
        $level_id = M('menuLevel')->where(['name' => $show_tags_lists['media'], 'status' => C('STATUS_VALID')])->getField('level_id');
        $where['level_id'] = $level_id;
//        dump($where);
        $model = M('video');
        $counts = $model->where($where)->count();
        $page = new \Think\Page($counts, self::POST_PAGE_LIST_COUNT);
        $page->show();

        $media = $model->page($pg, self::POST_PAGE_LIST_COUNT)->where($where)->order("weight desc,begin_time desc")->select();
        if (IS_POST) {
            $this->ajaxReturn([
                'status' => 'ok',
                'total_pages' => $this->getTotalPages($counts),
                'media' => $media
            ]);
        }
//        dump($media);
        $this->assign('media', $media);
        $this->assign('total', $page->totalPages);

        $this->display();
    }

    public function publicityvediodetail()
    {
        $show_tags_lists = [
            'media' => '企业宣传',
        ];
        //视频详情
        $parameter = $this->parameterCheck();
        $video_id = $parameter['video_id'];

        $level_id = M('menuLevel')->where(['name' => $show_tags_lists['media'], 'status' => C('STATUS_VALID')])->getField('level_id');
//        dump($level_id);
        $media_app = new \Homeen\Common\Page\Video($level_id);
        $media = $media_app->getVideoById($video_id);

        $this->addViewCount(M('video'), $media);

        //相关视频
        $medias = $media_app->getVideo();
//        dump($medias);
        $count = count($medias) - 3;
        if ($count > 1) {
            $limit_first = mt_rand(0, $count);
            $limit = $limit_first . ',3';

        }
        $data['video_id']=['neq',$video_id];
        $result = $media_app->getVideo(null,$data, $limit);


        $this->assign('media', $media);
        $this->assign('medias', $result);
        $this->assign('two_bar_codes', \Homeen\Common\Service::getTwoBarCodes());

        $this->display();
    }

    public function historydetail()
    {
        $show_tags_lists = [
            'history' => '发展历程',
        ];
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);

        $parameter = $this->parameterCheck();
        $level_id = M('menuLevel')->where(['name' => $show_tags_lists['history'], 'status' => C('STATUS_VALID')])->getField('level_id');

        $where['level_id'] = $level_id;
        $where['tags'] = $parameter['year'];
        $where['status'] = C('STATUS_VALID');

        $model = M('notice');

        $count = $model->where($where)->order("weight desc,begin_time desc")->count();
        $page = new \Think\Page($count, self::NOTICE_LIST_TOTAL);
        $page->show();
        $totalpages = $page->totalPages;
        $result = $model->page($pg, self::NOTICE_LIST_TOTAL)->where($where)->order("weight desc,begin_time desc")->select();
        if (IS_POST) {
            if ($result) {
                $this->ajaxReturn([
                    'status' => 'ok',
                    'msg' => 'success',
                    'total' => $totalpages,
                    'item' => $result
                ]);
            }
        }

        $this->assign('notice', $result);
        $this->assign('total', $totalpages);
        $this->display();
    }

    private function addViewCount($model, $db_row)
    {
        $data['view_count'] = $db_row['view_count'] + 1;
        $model->where('video_id=%d', $db_row['video_id'])->save($data);
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
                'video_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'year' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {
            $this->error("参数错误，请检查！", __ACTION__ . '');
            exit;
        }

        return I('get.');
    }


    private function getTotalPages($total_count)
    {
        return ceil($total_count / self::POST_PAGE_LIST_COUNT);
    }


    private function getLimit($pg)
    {
        if (IS_GET) {
            $begin_row = ($pg - 1) * self::PAGE_LIST_COUNT;
            return (string)($begin_row . ', ' . self::PAGE_LIST_COUNT);
        }

        $begin_row = ($pg - 1) * self::POST_PAGE_LIST_COUNT;
        return (string)($begin_row . ', ' . self::POST_PAGE_LIST_COUNT);
    }

    private function getCommonDataList($type)
    {
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);

        $where = [];
//        $head_news = $this->getOneHeadNews($type);
//
//        if ($head_news) {
//            $where['notice_id'] = ['NEQ', $head_news['notice_id']];
//        }
        $sql_parameter['where'] = $where;
        $sql_parameter['order'] = 'web_stick desc,stick desc,weight desc,begin_time desc';
        $sql_parameter['limit'] = $this->getLimit($pg);

        $news_app = new \Homeen\Common\News\Service();
        list($total_count, $notices) = $news_app->$type(null,  $sql_parameter);
        $notices = \Adminen\Common\Base::removeColumn($notices, 'note');
        $total_pages = $this->getTotalPages($total_count);
        if (IS_POST) {
            $this->ajaxReturn([
                'status' => 'ok',
                'total_pages' => $total_pages,
                'notices' => $notices
            ]);
        }

        $this->assign('total_pages', $total_pages);
//        $this->assign('head_news', $head_news);
        $this->assign('notices', $notices);
        $this->display();
    }
}