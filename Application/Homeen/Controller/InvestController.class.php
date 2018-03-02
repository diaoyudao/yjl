<?php
namespace Homeen\Controller;

use Home\Common\Page\Image;
use Think\Controller;

class InvestController extends Controller
{
    const PAGE_LISTS=15;

    public function index()
    {
        $show_tags_lists = [
            'notice' => '公告',
            'head' => '头部图片',
            'grade' => '机构评级',
        ];
        $where['name'] = $show_tags_lists['notice'];
        $where['status'] = C('STATUS_VALID');
        $level_id = M('menuLevel')->where($where)->getField('level_id');
        $news_app = new \Homeen\Common\Page\File($level_id);

        $parameter = $this->reportParameterCheck();
        //头图
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $head_images = $image->getImage($show_tags_lists['head']);
        $grade_images = $image->getImage($show_tags_lists['grade']);
        $mobile_head_images = $image->getMobileImage($show_tags_lists['head']);
        $mobile_grade_images = $image->getMobileImage($show_tags_lists['grade']);
        //企业公告
        $notices = $news_app->getFile(null, 2);
//		dump($notices);
        $this->assign('notices', $notices);
        $this->assign('head_images', $head_images);
        $this->assign('grade_images', $grade_images);
        $this->assign('mobile_head_images', $mobile_head_images);
        $this->assign('mobile_grade_images', $mobile_grade_images);

        $this->display();
    }

    public function report()
    {
        if (IS_POST) {
            $paramter = $this->reportPostParameterCheck();
            $where = $this->composeParam($paramter);

            $model = M('file');
            list($count, $result, $page) = $this->getReportDatas($model, $where, $paramter['pg']);

            $this->ajaxReturn(['status' => 'ok', 'total_page' => $page->totalPages, 'datas' => $result]);
        }

        $paramter = $this->reportParameterCheck();
        $where = $this->composeParam($paramter);

        $model = M('file');
        list($count, $result, $page) = $this->getReportDatas($model, $where);

        $years = $model->distinct(true)->field('tags')->where('level_id = %d', $paramter['level_id'])->order('tags')->select();

        $this->assign('years', $years);
        $this->assign('counts', $count);
        $this->assign('datas', $result);
        $this->assign('total_page', $page->totalPages);

        $this->display();
    }

    public function notice()
    {
        $tags = IS_POST ? I('post.tags', '', FILTER_SANITIZE_STRING) : '';
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
//		dump($tags);

        if ($tags) $where['tags'] = $tags;
//		dump($where);
        $parameter = $this->reportParameterCheck();
        $where['level_id'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');
        $model = M('file');
//        $notice = $model->where($where)->order("tags desc,weight desc,begin_time desc")->select();
        $count = $model->where($where)->order("tags desc,weight desc,begin_time desc")->count();
        $page = new \Think\Page($count, self::PAGE_LISTS);
        $page->show();
        $totalpages = $page->totalPages;
        $notice = $model->page($pg, self::PAGE_LISTS)->where($where)->order("tags desc,weight desc,begin_time desc,update_time desc")->select();
        $tags=array_merge([],array_unique(array_column($notice,'tags')));

        $lists = $model->where($where)->order("tags desc,weight desc,begin_time desc")->distinct(true)->getField('tags', true);

        foreach ($tags as $key => $val) {
            foreach ($notice as $v) {
                if ($val == $v['tags']) $result[$key][] = $v;
            }
        }
//		dump($result);
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

//        $count = count($result);

        $this->assign('lists', $lists);
        $this->assign('notice', $result);
        $this->assign('total', $totalpages);
        $this->display();
    }

    public function grade()
    {
        $model = M('share');
        $shares = $model->where('status =%d', C('STATUS_VALID'))
            ->order('type,weight desc,begin_time desc')->select();
//        $share_time = $model->where('status =%d', C('STATUS_VALID'))
//            ->order(' begin_time desc')->getField('begin_time');

        $model = M('credit');
        $credits = $model->where('status =%d', C('STATUS_VALID'))
            ->order('weight desc,begin_time desc')->select();
//        $credits_time = $model->where('status =%d', C('STATUS_VALID'))
//            ->order('begin_time desc')->getField('begin_time');
        $update_times=M('gradeUpdateTime')->getField('update_time',true);
        $this->splitShare($shares);

        $this->assign('credits_time', $update_times[0]);
        $this->assign('share_time', $update_times[1]);
        $this->assign('credits', $credits);
        $this->assign('shares', $shares);
        $this->display();
    }

    /**
     * 财务
     */
    public function contact()
    {
        if (IS_GET) {
            $this->display();
        }

        $parameter = $this->checkContactParameter();

        $this->contactDuplicateCheck($parameter);

        $model = M('invest_visit');
        $ret = $model->add($parameter);
        if (false === $ret) {
            $this->ajaxReturn(['status' => 'failed', 'message' => $model->getDbError()]);
        }

        $filename = '/home/www/yjl/Application/Home/View/default/Mail/investcontact.tpl';
        $to_mail = M('config')->where("name = 'invest_mail'")->field('value')->select();

        $mail_app = new \Adminen\Common\Mail($to_mail[0]['value'], $to_mail[0]['value']);
        $mail_app->setFileContext($filename, $parameter);
        list($status, $msg) = $mail_app->sendmail('雅居乐官网邮件-投资者访问');

        $this->ajaxReturn(['status' => 'ok']);
    }

    public function governance()
    {
        $show_tags_lists = [
            'head' => '头部图片',
        ];
        $parameter = $this->reportParameterCheck();
        //头图
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $head_images = $image->getImage($show_tags_lists['head']);
        $mobile_head_images = $image->getMobileImage($show_tags_lists['head']);

        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);

        $this->display();
    }

    public function performance()
    {
        $show_tags_lists = [
            'performance' => '材料',
        ];
        $parameter = $this->reportParameterCheck();
        //头图
        $level_id = $parameter['level_id'];
        $imageObj = new Image($level_id);
        $image = $imageObj->getImage($show_tags_lists['performance']);
        $mobile_image = $imageObj->getMobileImage($show_tags_lists['performance']);

        $this->assign('image', $image);
        $this->assign('mobile_image', $mobile_image);

        $this->display();
    }

    private function splitShare($shares)
    {
        $types = [
            'buy' => '买入',
            'sold' => '卖出',
            'neuter' => '中性',
        ];

        $buy = [];
        $sold = [];
        $neuter = [];
        $i = 1;
        foreach ($shares as &$share) {
            $share['key'] = $i++;
            if ($share['type'] == $types['buy']) {
                $buy[] = $share;
            }

            if ($share['type'] == $types['sold']) {
                $sold[] = $share;
            }

            if ($share['type'] == $types['neuter']) {
                $neuter[] = $share;
            }
        }

        $this->assign('buy', $buy);
        $this->assign('sold', $sold);
        $this->assign('neuter', $neuter);
    }

    private function reportPostParameterCheck()
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                'level_id' => ['type' => 'integer'],
                'year' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('post.');
    }

    private function reportParameterCheck()
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('get.'), [
                'level_id' => ['type' => 'integer'],
                'year' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'pg' => ['type' => 'integer', 'required' => false],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => 'parameter error.']);
        }

        return I('get.');
    }

    /*
     * param $paramter array
     * 参数组装a
     */
    private function composeParam($paramter)
    {
        if (!empty($paramter['year'])) {
            $where['tags'] = $paramter['year'];
        }

        if (!empty($paramter['level_id'])) {
            $where['level_id'] = $paramter['level_id'];
        }

        $where['status'] = C('STATUS_VALID');

        return $where;
    }


    private function getReportDatas($model, $where, $current_page = 1)
    {
        $one_page_size = 6;

        $count = $model->where($where)->count();

        $page = new \Think\Page($count, $one_page_size);
        $page->show();

        $result = $model->page($current_page, $one_page_size)
            ->where($where)->order('tags desc,weight desc')->select();

        return [$count, $result, $page];
    }

    private function contactDuplicateCheck($parameter)
    {
        $model = M('invest_visit');
        $where['organize'] = $parameter['organize'];
        $where['name'] = $parameter['name'];
        $where['mail'] = $parameter['mail'];
        $where['tel'] = $parameter['tel'];
        $where['project'] = $parameter['project'];
        $where['city'] = $parameter['city'];
        $where['times'] = $parameter['times'];

        $result = $model->where($where)->select();

        if ($result) {
            $this->ajaxReturn(['status' => 'failed', 'message' => '该来访信息已经存在，请勿重复提交！']);
        }
    }

    private function checkContactParameter()
    {
        try {
            (new \Adminen\Common\Parameter\Validator())->execute(I('post.'), [
                'organize' => ['type' => 'string'],
                'name' => ['type' => 'string'],
                'mail' => ['type' => 'string'],
                'tel' => ['type' => 'string'],
                'project' => ['type' => 'string'],
                'city' => ['type' => 'string'],
                'times' => ['type' => 'string'],
                'verify' => ['type' => 'string'],
            ]);

        } catch (\Exception $ex) {

            $this->ajaxReturn(['status' => 'failed', 'message' => $ex->getMessage()]);
        }

        // 检查验证码
        session_start();
        $ret = (new \Adminen\Common\Verify())->check_verify(I('post.verify'));
        if (!$ret) {

            $this->ajaxReturn(['status' => 'failed', 'message' => '验证码无效，请刷新后重试！']);
        }

        return I('post.');
    }


}