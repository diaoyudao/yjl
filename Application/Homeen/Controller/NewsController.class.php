<?php
namespace Homeen\Controller;

use Think\Controller;

class NewsController extends Controller
{
    const PAGE_LIST_COUNT = 12;
    const POST_PAGE_LIST_COUNT = 6;

    public function index()
    {
        $index_count = 7;

        $level_where['status'] = C('STATUS_VALID');
        $levels = M('menu_level')->where($level_where)->select();

        $list_levels = $this->getAllLevelByNews($levels);
        $list_levels_id = array_column($list_levels, 'level_id');

        // 获取头条
        $where['level_id'] = ['IN', $list_levels_id];
        $where['status'] = C('STATUS_VALID');
        $where['web_stick'] = C('STATUS_VALID');
        $where['begin_time'] = ['ELT', (new \DateTime())->format('Y-m-d')];
        $where['_string'] = "end_time is null or end_time >= '" . (new \DateTime())->format('Y-m-d') . "'";

        $head_news = M('notice')->where($where)->order('weight desc,begin_time desc,update_time desc')->limit(1)->select();

        $list_levels = $this->getAllLevelByMedia($levels);
        $list_levels_id = array_column($list_levels, 'level_id');
        // 媒体排序
        $media_where['level_id'] = ['IN', $list_levels_id];
        $media_where['status'] = C('STATUS_VALID');
        if ($head_news) {
            $media_where['notice_id'] = ['NEQ', $head_news[0]['notice_id']];
        }
        $media_where['begin_time'] = ['ELT', (new \DateTime())->format('Y-m-d')];
        $media_where['_string'] = "end_time is null or end_time >= '" . (new \DateTime())->format('Y-m-d') . "'";

        $order = 'web_stick desc,stick desc,weight desc,begin_time desc,update_time desc';

        $media_notices = M('notice')->where($media_where)->order($order)->limit($index_count)->select();

        // 分类新闻
        $news_app = new \Homeen\Common\News\Service();
           if ($head_news) {
            $common_where['notice_id'] = ['NEQ', $head_news[0]['notice_id']];
        }
       
        list($one_group_notices,$group_notices)=$this->getIndexNotice($news_app,'group',$order,$head_news,$common_where);
        list($one_estate_notices,$estate_notices)=$this->getIndexNotice($news_app,'estate',$order,$head_news,$common_where);
        list($one_life_notices,$life_notices)=$this->getIndexNotice($news_app,'life',$order,$head_news,$common_where);
        list($one_education_notices,$education_notices)=$this->getIndexNotice($news_app,'education',$order,$head_news,$common_where);
        list($one_environment_notices,$environment_notices)=$this->getIndexNotice($news_app,'environment',$order,$head_news,$common_where);
       
        $this->assign('one_group_notices', $one_group_notices);
        $this->assign('one_estate_notices', $one_estate_notices);
        $this->assign('one_life_notices', $one_life_notices);
        $this->assign('one_education_notices', $one_education_notices);
        $this->assign('one_environment_notices', $one_environment_notices);
        $this->assign('group_notices', $group_notices);
        $this->assign('head_notice', $head_news[0]);
        $this->assign('media_notices', $media_notices);
        $this->assign('estate_notices', $estate_notices);
        $this->assign('life_notices', $life_notices);
        $this->assign('education_notices', $education_notices);
        $this->assign('environment_notices', $environment_notices);
        $this->display();
    }

    public function getOneHeadNews($type)
    {
        $news_app = new \Homeen\Common\News\Service();
        $stick['stick'] = 1;
        $stick['status'] = 1;
        $sql_paramter['where'] = $stick;
        $sql_paramter['limit'] = '0,1';
        $sql_paramter['order'] = 'stick desc,weight desc,begin_time desc,update_time desc';

        list($total_count, $notices) = $news_app->$type(null, $sql_paramter);
        if (!$notices) {
            return [];
        }

        unset($notices[0]['note']);
        return $notices[0];
    }

    public function removeColumn($array, $column)
    {
        foreach ($array as $key => $item) {
            unset($array[$key][$column]);
        }

        return $array;
    }

    public function media()
    {
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
        $id = IS_POST ? I('post.id', 0, FILTER_VALIDATE_INT) : I('get.id', 0, FILTER_VALIDATE_INT);


        $parameter = $this->parameterCheck();
        $where['pid'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');
        $level_id = M('menuLevel')->where($where)->getField('level_id', true);
        $lists = M('menuLevel')->where($where)->order('level_id')->getField('level_id,name', true);
//        dump($levels);
//        dump($lists);
        if ($id) {
            $data['level_id'] = $id;
        } else {
            $data['level_id'] = ['IN', $level_id];
        }
        $model = M('notice');
//        $head_news = $model
//            ->where($data)->order("stick desc,tags desc,weight desc,begin_time desc")->limit(1)->select();
//        if ($head_news) {
//            $data['notice_id'] = ['NEQ', $head_news[0]['notice_id']];
////            unset($where['n.stick']);
//        }
        if (empty($data['begin_time'])) {
            $data['begin_time'] = ['ELT', (new \DateTime())->format('Y-m-d')];
        }
        if (empty($data['end_time'])) {
            $data['_string'] = "end_time is null or end_time >= '" . (new \DateTime())->format('Y-m-d') . "'";
        }
        $counts = $model->where($data)->count();
        $page = new \Think\Page($counts, self::POST_PAGE_LIST_COUNT);
        $page->show();
        if ($pg == 1) {
            $notices = $model
                ->page($pg, self::PAGE_LIST_COUNT)
                ->where($data)->order("web_stick desc,stick desc,tags desc,weight desc,begin_time desc,update_time desc")->select();
        } else {
            $notices = $model->page($pg, self::POST_PAGE_LIST_COUNT)
                ->where($data)->order("web_stick desc,stick desc, tags desc,weight desc,begin_time desc,update_time desc")->select();
        }

        if (IS_POST) {

            $this->ajaxReturn([
                'status' => 'ok',
                'total_pages' => $page->totalPages,
//                'head_news' => $head_news,
                'notices' => $notices
            ]);
        }

//        $this->assign('head_news', $head_news[0]);
        $this->assign('lists', $lists);
        $this->assign('notices', $notices);
        $this->assign('total_pages', $page->totalPages);
        $this->display();
    }

    public function estate()
    {
        $this->getCommonDataList('estate');
    }

    public function life()
    {
        $this->getCommonDataList('life');
    }

    public function education()
    {
        $this->getCommonDataList('education');
    }

    public function environment()
    {
        $this->getCommonDataList('environment');
    }


    public function group()
    {
        $this->getCommonDataList('group');
    }

    public function detail()
    {
        $notice_id = I('get.id', '-1', FILTER_VALIDATE_INT);
        if (0 >= $notice_id) {
            echo '参数错误！';
        }

        $model = M('notice');
        $news = $model->find($notice_id);
        $this->addViewCount($model, $news);

        // 获取路径
        $model = M('menu_level');
        $level = $model->find($news['level_id']);
        $parent_level = $model->find($level['pid']);
        $level3 = $model->find($parent_level['pid']);

        if ('10000' != $level3['level_id']) {
            $level4 = $model->find($level3['pid']);
            if ('10000' != $level4['level_id']) {
                $this->assign('four_path', $level4);
            }

            $this->assign('three_path', $level3);
        }
        $news['begin_time']=$this->changeTime($news['begin_time']);
        $this->assign('one_path', $level);
        $this->assign('two_path', $parent_level);
        $this->assign('two_bar_codes', \Homeen\Common\Service::getTwoBarCodes());
        $this->assign('news', $news);
        $this->display();
    }

    private function addViewCount($model, $news)
    {
        $data['view_count'] = $news['view_count'] + 1;
        $model->where('notice_id=%d', $news['notice_id'])->save($data);
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
        $sql_parameter['order'] = 'web_stick desc,stick desc,weight desc,begin_time desc,update_time desc';
        $sql_parameter['limit'] = $this->getLimit($pg);

        $news_app = new \Homeen\Common\News\Service();
        list($total_count, $notices) = $news_app->$type(null, $sql_parameter);
        $notices = $this->removeColumn($notices, 'note');
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

    private function getAllLevelByMedia($levels)
    {
        foreach ($levels as $level) {
            if ($level['name'] == \Homeen\Common\News\Service::SHOW_TAGS_LISTS['media']) {
                $news_level = $level;
                break;
            }
        }

        $level_app = new \Homeen\Common\Level();
        $level_app->getLevelById($levels, $news_level);

        return $level_app->list_levels;
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

    /**
     * 入参检查
     * @return  get参数数组
     */
 private function getIndexNotice($news_app,$type,$order,$head_news,$common_where)
    {

        $one_sql['where'] = $common_where;
        $one_sql['limit'] = 1;
        $one_sql['order'] = $order;
        $one_sql['where']['_string'] = "image_url1 is not null and image_url1 !='' ";
        list($total_count, $one_notice) = $news_app->$type(null, $one_sql);
        $sql_paramter['limit'] = 6;
        $sql_paramter['order'] = $order;
        $where['notice_id']=[['NEQ',$one_notice[0]['notice_id']],['NEQ',$head_news[0]['notice_id']]];
        $sql_paramter['where'] = $where;

        list($total_count2, $notices) = $news_app->$type(null, $sql_paramter);
       
        return [$one_notice,$notices];
    }
    private function parameterCheck()
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('get.'), [
                'level_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'type_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
//				'tags' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {
            $this->error("参数错误，请检查！", __ACTION__ . '');
            exit;
        }

        return I('get.');
    }

    private function changeTime($time){
        $timeArr=explode('-',$time);
        $newTime=$timeArr[1].'/'.$timeArr[2].'/'.$timeArr[0].' '.$timeArr[3];
        return $newTime;
    }
}