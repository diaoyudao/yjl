<?php
namespace Home\Controller;

use Home\Common\Page\Image;
use Think\Controller;
use Think\Page;

class BusinessController extends Controller
{
    const PAGE_LIST_COUNT = 6;
    const PAGE_LIST_TOTAL = 12;

    public function index()
    {
        $show_tags_lists = [
            'land' => 'land',
            'is_sales' => '1',
            'head'=>'头部图片',
            'life'=>'雅生活',
            'education'=>'教育',
            'environment'=>'环保',
            'hotel'=>'酒店',
            'build'=>'建设',
        ];

        // $data['status'] = C('STATUS_VALID');
        // $data['tags'] = $show_tags_lists['land'];
        // $data['is_sales'] = $show_tags_lists['is_sales'];

        // $model = M('land');
        // $counts = $model->where($data)->order("weight desc,begin_time desc")->count();
        // 
        $parameter = $this->parameterCheck();
        //头图
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $head_images = $image->getImage($show_tags_lists['head']);
        $life_images = $image->getImage($show_tags_lists['life']);
        $education_images = $image->getImage($show_tags_lists['education']);
        $build_images = $image->getImage($show_tags_lists['build']);
        $environment_images = $image->getImage($show_tags_lists['environment']);
        $hotel_images = $image->getImage($show_tags_lists['hotel']);

        $mobile_head_images = $image->getMobileImage($show_tags_lists['head']);
        $mobile_life_images = $image->getMobileImage($show_tags_lists['life']);
        $mobile_education_images = $image->getMobileImage($show_tags_lists['education']);
        $mobile_build_images = $image->getMobileImage($show_tags_lists['build']);
        $mobile_environment_images = $image->getMobileImage($show_tags_lists['environment']);
        $mobile_hotel_images = $image->getMobileImage($show_tags_lists['hotel']);

        $this->assign('head_images', $head_images);
        $this->assign('life_images', $life_images);
        $this->assign('education_images', $education_images);
        $this->assign('build_images', $build_images);
        $this->assign('environment_images', $environment_images);
        $this->assign('hotel_images', $hotel_images);

        $this->assign('mobile_head_images', $mobile_head_images);
        $this->assign('mobile_life_images', $mobile_life_images);
        $this->assign('mobile_education_images', $mobile_education_images);
        $this->assign('mobile_build_images', $mobile_build_images);
        $this->assign('mobile_environment_images', $mobile_environment_images);
        $this->assign('mobile_hotel_images', $mobile_hotel_images);

//        $this->assign('counts', $counts);
        $this->display();
    }

    public function estate()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'map' => '地图找楼盘',
            "group" => "楼盘速递",
            'land' => 'land',
            'is_hot' => '1',
            'is_sales' => '1',
            'estate' => ['地产-城市', '地产-业态'],
            'cover' => '封面图片',
        ];

        $parameter = $this->parameterCheck();
        $data['level_id'] = $parameter['level_id'];
        $data['status'] = C('STATUS_VALID');

        $type = M('type')->where($data)->order("weight desc")->select();

        foreach ($type as $v) {
            if ($v['tags'] == $show_tags_lists['estate'][0]) {
                $city_type[] = $v;
            }
            if ($v['tags'] == $show_tags_lists['estate'][1]) {
                $format_type[] = $v;
            }


        }


        $data['tags'] = $show_tags_lists['head'];


        // 楼盘速递
        $level_where['status'] = C('STATUS_VALID');
        $level_where['name'] = $show_tags_lists['group'];
        $pid = M('menu_level')->where($level_where)->getField('level_id');
//        dump($pid);
        $where['m.status'] = C('STATUS_VALID');
        $where['n.status'] = C('STATUS_VALID');
//        $where['n.stick'] = C('STATUS_VALID');
        $where['m.pid'] = $pid;
//
//        $head_notices = M('notice')->alias('n')->field('n.*')->join("menu_level m on m.level_id=n.level_id")
//            ->where($where)->order("n.begin_time desc")->limit(1)->select();
//        $head_notices[0]['pid'] = $pid;
//        if ($head_notices) {
//            $where['n.notice_id'] = ['NEQ', $head_notices[0]['notice_id']];
//            unset($where['n.stick']);
//        }
        $notices = M('notice')->alias('n')->field('n.*')->join("menu_level m on m.level_id=n.level_id")
            ->where($where)->order("n.stick desc,n.begin_time desc")->limit('0,7')->select();


//		dump($web_group_notices);


        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $tags = $show_tags_lists['head'];
        $head_images = $image->getImage($tags);
        $mobile_head_images = $image->getMobileImage($tags);


        //热销楼盘
        $sale_w['l.status'] = C('STATUS_VALID');
        $sale_w['l.tags'] = $show_tags_lists['land'];
        $sale_w['l.is_hot'] = $show_tags_lists['is_hot'];
        $sale_w['l.is_sales'] = $show_tags_lists['is_sales'];
        $sale_w['i.tags'] = $show_tags_lists['cover'];
        $model = M('land');
        $result = $model->alias('l')->field('l.*,i.image_url1')
            ->join(' land_image i on i.land_id = l.land_id')
            ->where($sale_w)->order("l.weight desc, l.begin_time desc")->select();

        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);

        $this->assign('city_type', $city_type);
        $this->assign('format_type', $format_type);
        //楼盘速递
//        $this->assign('head_notices', $head_notices);
        $this->assign('notices', $notices);
        $this->assign('sales', $result);

        $this->display();
    }

    public function estatedetail()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'note' => '正文图片',
            'cover' => '封面图片',
            'logo' => 'logo',
            'code' => '二维码',
            'room' => '户型图',
            'plan' => '规划图',
            'real' => '实景图',
            'land' => 'land',
            'is_hot' => '1',
            'is_sales' => '1',
        ];
        $parameter = $this->ParameterCheck();
        $data['land_id'] = $parameter['land_id'];

        $model = M('land_image');
        $images = $model->where($data)->order("weight desc")->select();
        $mobile_images = M('mobile_land_image')->where($data)->order("weight desc")->select();

        $where['land_id'] = $parameter['land_id'];
        $where['status'] = C('STATUS_VALID');
        $estate = M('land')->field('*')
            ->where($where)->order("weight desc,begin_time desc")->select();

        foreach ($images as $v) {
            if ($v['tags'] == $show_tags_lists['head']) $head_images[] = $v;
            if ($v['tags'] == $show_tags_lists['note']) $note_images[] = $v;
            if ($v['tags'] == $show_tags_lists['cover']) $cover_images[] = $v;
            if ($v['tags'] == $show_tags_lists['code']) $code_images[] = $v;
            if ($v['tags'] == $show_tags_lists['room']) $room_images[] = $v;
            if ($v['tags'] == $show_tags_lists['plan']) $plan_images[] = $v;
            if ($v['tags'] == $show_tags_lists['real']) $real_images[] = $v;
        }

        foreach ($mobile_images as $v) {
            if ($v['tags'] == $show_tags_lists['head']) $mobile_head_images[] = $v;

        }


        $sale_w['l.status'] = C('STATUS_VALID');
        $sale_w['l.tags'] = $show_tags_lists['land'];
        $sale_w['l.is_hot'] = $show_tags_lists['is_hot'];
        $sale_w['l.is_sales'] = $show_tags_lists['is_sales'];
        $sale_w['i.tags'] = $show_tags_lists['cover'];
        $model = M('land');
        $result = $model->alias('l')->field('l.land_id,i.image_url1')
            ->join(' land_image i on i.land_id = l.land_id')
            ->where($sale_w)->order("l.weight desc, l.begin_time desc")->select();
//		dump($result);
        
        // 楼盘地图周边


        $this->assign('estate', $estate);
        $this->assign('head_images', $head_images);
        $this->assign('note_images', $note_images);
        $this->assign('cover_images', $cover_images);
        $this->assign('code_images', $code_images);
        //户型图
        $this->assign('room_images', $room_images);
        //规划图
        $this->assign('plan_images', $plan_images);
        //实景图
        $this->assign('real_images', $real_images);
        
        $this->assign('mobile_head_images', $mobile_head_images);

        //热销楼盘
        $this->assign('sales', $result);
        $this->display();
    }

    public function estatelists()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'land' => 'land',
            'estate_city' => '地产-城市',
            'format' => '地产-业态',
            'cover' => '封面图片',
        ];
        $head_image_id = 1000000165;  // 取地产首页的图片

        $parameter = $this->parameterCheck();
        $where['level_id'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');

        $types = M('type')->where($where)->order("weight desc")->select();
        foreach ($types as $v) {
            if ($v['tags'] == $show_tags_lists['estate_city']) $estate_city[] = $v;
            if ($v['tags'] == $show_tags_lists['format']) $format[] = $v;
        }
//		dump($estate_city);
//		dump($format);

        $where['tags'] = $show_tags_lists['head'];
        $where['level_id'] = $head_image_id;
        $model = M('image');
        $head_images = $model->where($where)->order("weight desc,begin_time desc")->select();


        $data['l.status'] = C('STATUS_VALID');
        $data['l.tags'] = $show_tags_lists['land'];
        $data['i.tags'] = $show_tags_lists['cover'];
        if (IS_POST) {
            $this->postLand($data);
            return;
        } else {
            $result = $this->getLand($data);
            list($land, $total, $parameter) = $result;

        }


        $this->assign('head_images', $head_images);
        $this->assign('total', $total);
        $this->assign('parameter', $parameter);

        $this->assign('estates', $land);
        //城市分类
        $this->assign('estate_city', $estate_city);
        //业态分类
        $this->assign('format', $format);
        $this->display();
    }

    public function estateExpressLists()
    {
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
        $id = IS_POST ? I('post.id', 0, FILTER_VALIDATE_INT) : I('get.id', 0, FILTER_VALIDATE_INT);
        $parameter = $this->parameterCheck();

//        dump($pid);
        $where['pid'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');
        $level_id=M('menuLevel')->where($where)->order('level_id desc')->getField('level_id',true);
        $months=M('menuLevel')->where($where)->order('level_id desc')->getField('level_id,name',true);
//        rsort($level_id);
        $data['_string']="tags is not null or tags != '' ";

        $model = M('notice');
        $years=$model->field('tags')->where(['level_id'=>['IN',$level_id]])->order("tags desc")->distinct(true)->getField('tags',true);
        if($id){
            $data['level_id']=$id;
        }else{
            $data['level_id']=['IN',$level_id];
        }
        unset($data['_string']);
        if (empty($data['begin_time'])) {
            $data['begin_time'] = ['ELT', (new \DateTime())->format('Y-m-d')];
        }
        if (empty($data['end_time'])) {
            $data['_string'] = "end_time is null or end_time >= '" . (new \DateTime())->format('Y-m-d') . "'";
        }
        $year = IS_POST ? I('post.year', 0, FILTER_VALIDATE_INT) : I('get.year', 0, FILTER_VALIDATE_INT);
        if($year)$data['tags'] = $year;
//        $head_news = $model
//            ->where($data)->order("stick desc,tags desc,weight desc,begin_time desc")->limit(1)->select();
//        if ($head_news) {
//            $data['notice_id'] = ['NEQ', $head_news[0]['notice_id']];
////            unset($where['n.stick']);
//        }
        $counts = $model->where($data)->count();
        $page = new \Think\Page($counts, self::PAGE_LIST_COUNT);
        $page->show();
        if($pg==1){
            $notices = $model
                ->page($pg, self::PAGE_LIST_TOTAL)
                ->where($data)->order("stick desc,tags desc,tags desc,weight desc,begin_time desc")->select();
        }else{
            $notices = $model->page($pg, self::PAGE_LIST_COUNT)
                ->where($data)->order("stick desc,tags desc,tags desc,weight desc,begin_time desc")->select();
        }

//        dump($counts);
//        dump($notices);
        if (IS_POST) {

            $this->ajaxReturn([
                'status' => 'ok',
                'total_pages' => $page->totalPages,
//                'pg' => $pg,
                'notices' => $notices
            ]);
        }

//        $this->assign('head_news', $head_news);
        $this->assign('years', $years);
        $this->assign('months', $months);
        $this->assign('notices', $notices);
        $this->assign('total_pages', $page->totalPages);
        $this->display();
    }

    public function estatemonthlists()
    {
        $pg = IS_POST ? I('post.pg', 1, FILTER_VALIDATE_INT) : I('get.pg', 1, FILTER_VALIDATE_INT);
        $parameter = $this->parameterCheck();
//        dump($parameter);
        $where['status'] = C('STATUS_VALID');
//        $where['stick'] = C('STATUS_VALID');
        $where['level_id'] = $parameter['level_id'];
        $where['_string']="tags is not null or tags != '' ";
        $model = M('notice');
        $lists=$model->where($where)->order("tags desc,weight desc,begin_time desc")->distinct(true)->getField('tags',true);

//        dump($lists);
        $year = IS_POST ? I('post.year', 0, FILTER_VALIDATE_INT) : I('get.year', 0, FILTER_VALIDATE_INT);
        if($year)$where['tags'] = $year;
        $head_news = M('notice')
            ->where($where)->order("stick desc,tags desc,weight desc,begin_time desc")->limit(1)->select();
        $level_name = M('menuLevel')->find($where['level_id']);
        if ($head_news) {
            $where['notice_id'] = ['NEQ', $head_news[0]['notice_id']];
//            unset($where['stick']);
        }
        $counts = $model->where($where)->count();
        $page = new \Think\Page($counts, self::PAGE_LIST_COUNT);
        $page->show();
        if($pg==1){
            $notices = $model
                ->page($pg, self::PAGE_LIST_TOTAL)
                ->where($where)->order("tags desc,weight desc,begin_time desc")->select();
        }else{
            $notices = $model->page($pg, self::PAGE_LIST_COUNT)
                ->where($where)->order("weight desc,begin_time desc")->select();
        }

        if (IS_POST) {


            $this->ajaxReturn([
                'status' => 'ok',
                'total_pages' => $page->totalPages,
                'head_news' => $head_news,
                'notices' => $notices
            ]);
        }
        $this->assign('level_name', $level_name);
        $this->assign('years', $lists);
        $this->assign('head_news', $head_news);
        $this->assign('notices', $notices);
        $this->assign('total_pages', $page->totalPages);
        $this->display();
    }

    public function life()
    {

        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();
        

        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->display();
    }

    public function property()
    {
        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();

        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->display();
    }

    public function net()
    {
        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();
        
        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->display();
    }
    public function decorate()
    {
        $head_images = $this->getHeadImages();
        $middle_images = $this->getMiddleImages();

        $this->assign('middle_images',$middle_images);
        $this->assign('head_images',$head_images);
        $this->display();
    }
    public function park()
    {
        $head_images = $this->getHeadImages();
        $middle_images = $this->getMiddleImages();

        $this->assign('middle_images',$middle_images);
        $this->assign('head_images',$head_images);
        $this->display();
    }
    public function tour()
    {
        $head_images = $this->getHeadImages();
        $middle_images = $this->getMiddleImages();
        $mobile_head_images = $this->getMobileHeadImages();
        $mobile_middle_images = $this->getMobileMiddleImages();

        $this->assign('middle_images',$middle_images);
        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->assign('mobile_middle_images',$mobile_middle_images);
        $this->display();
    }
    public function design()
    {
        $head_images = $this->getHeadImages();
        $middle_images = $this->getMiddleImages();

        $this->assign('middle_images',$middle_images);
        $this->assign('head_images',$head_images);
        $this->display();
    }

    public function education()
    {
        $head_image_tags = [
            'pre' => '1000000184',
            'base' => '1000000185',
            'international' => '1000000195',
            'community' => '1000000196',
        ];
        $show_tags_lists = [                
            'head'=>'头部图片',                
        ];

        $parameter = $this->parameterCheck();
        $data['pid'] = $parameter['level_id'];
        $data['status'] = C('STATUS_VALID');

        $level_id = M('menuLevel')->where($data)->getField('level_id', true);
        $id = ['IN', $level_id];
        $notice_app = new \Home\Common\Page\Notice($id);
        $where['stick'] = C('STATUS_VALID');
        list($total, $notice) = $notice_app->getNotice('', $where, $limit = null, $order = null);

        // 教育页面头图取子页面头图
        $head_images = [];
//        foreach ($head_image_tags as $key => $value) {
//            $image = new Image($value);
//            $result = $image->getImage($show_tags_lists['head']);
//            $head_images[] = $result[0] ?? [];
//        }

        $image = new Image($head_image_tags['base']);
        $result = $image->getImage($show_tags_lists['head'])[0];
        $mobile_head_images = $image->getMobileImage($show_tags_lists['head']);
        $this->assign('head_image',$result);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->assign('notice', $notice);
        $this->display();
        
    }

    public function environment()
    {
        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();
        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->display();
    }

    public function educationbase()
    {

        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $notice_app = new \Home\Common\Page\Notice($level_id);
        list($total, $notice) = $notice_app->getNotice(null, [], null, null);
//		dump($notice);
        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();
        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);

        $this->assign('notice', $notice);
        $this->display();
    }

    public function educationpre()
    {
        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $notice_app = new \Home\Common\Page\Notice($level_id);
        list($total, $notice) = $notice_app->getNotice(null, [], null, null);
        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();
        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->assign('notice',$notice);
        $this->display();
    }

    public function educationcommunity()
    {

        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $notice_app = new \Home\Common\Page\Notice($level_id);
        list($total, $notice) = $notice_app->getNotice(null, [], null, null);
        $head_images = $this->getHeadImages();
        $mobile_head_images = $this->getMobileHeadImages();

        $this->assign('head_images',$head_images);
        $this->assign('mobile_head_images',$mobile_head_images);
        $this->assign('notice',$notice);
        $this->display();
    }

    public function educationinternational()
    {
        
        $head_images = $this->getHeadImages();
        $this->assign('head_images',$head_images);
        $this->display();
    }

    public function hotel()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'property' => '酒店-属性',
            'land' => 'hotel',
            'cover' => '封面图片',

        ];
        $parameter = $this->ParameterCheck();
        $data['level_id'] = $parameter['level_id'];
        $data['status'] = C('STATUS_VALID');
        $data['tags'] = $show_tags_lists['head'];
//

        //头图
        $model = M('image');
        $head_images = $model->where($data)->order("weight desc,begin_time desc")->limit("0,5")->select();
//
        $mobile_head_images = $this->getMobileHeadImages();
        //酒店类型
        $property = M('type')->where(['tags' => $show_tags_lists['property'], 'status' => 1])->order("weight desc")->select();
//		dump($property);


        //酒店查询

        $where['l.tags'] = $show_tags_lists['land'];
        $where['l.status'] = C('STATUS_VALID');
//

        $where['i.tags'] = $show_tags_lists['cover'];
        if (IS_POST) {
            $this->postLand($where);
            return;
        }

        $this->assign('head_images', $head_images);
        $this->assign('mobile_head_images', $mobile_head_images);
        $this->assign('lists', $property);
        $this->display();

    }

    public function hotellists()
    {

        $show_tags_lists = [
            'head' => '头部图片',
            'land' => 'hotel',
            'hotel_city' => '酒店-城市',
            'cover' => '封面图片',
        ];
        $parameter = $this->parameterCheck();
        $where['level_id'] = $parameter['level_id'];
        $where['status'] = C('STATUS_VALID');

        $types = M('type')->where($where)->order("weight desc")->select();
        foreach ($types as $v) {
            if ($v['tags'] == $show_tags_lists['hotel_city']) $hotel_city[] = $v;
        }

        $where['tags'] = $show_tags_lists['head'];
        $model = M('image');
        $head_images = $model->where($where)->order("weight desc,begin_time desc")->select();
//		dump($head_images);
//		dump($hotel_city);
        $data['l.tags'] = $show_tags_lists['land'];
        $data['i.tags'] = $show_tags_lists['cover'];
        $data['l.status'] = C('STATUS_VALID');
        if (IS_POST) {
            $this->postLand($data);
            return;
        } else {
            $result = $this->getLand($data);
            list($land, $total,$parameter) = $result;

        }

//		dump($land);
        /*head_images [   数组
        *		image_url,  图片地址
         * ]
        */
        $this->assign('head_images', $head_images);

//		//page 对象
//		$this->assign('page', $page);
//
//		// total 总页数
        $this->assign('total', $total);
        $this->assign('parameter', $parameter);
        //城市分类
        $this->assign('hotel_city', $hotel_city);
//
//		/*hotels 酒店数据[   数组
//		*		image_url,  图片地址
//		 * ]
//		*/
        $this->assign('hotels', $land);
        $this->display();
    }

    public function hoteldetail()
    {
        $show_tags_lists = [
            'head' => '头部图片',
            'note' => '正文图片',
            'cover' => '封面图片',
            'code' => '二维码',
            'room' => '房间图',
            'location' => '外景图',
            'interior' => '内景图',

        ];
        $parameter = $this->ParameterCheck();
        $data['land_id'] = $parameter['land_id'];
        $model = M("land_image");
        $images = $model->where($data)->order("weight desc")->select();
        $mobile_images = M("mobile_land_image")->where($data)->order("weight desc")->select();
//		$data['status'] = C('STATUS_VALID');

        $where['l.land_id'] = $parameter['land_id'];
        $where['l.status'] = C('STATUS_VALID');
        $where['t.status'] = C('STATUS_VALID');
        $hotel = M('land')->alias('l')->field('l.*,t.name as city_name')->join('type t on t.type_id=l.city_id')
            ->where($where)->order("l.weight desc,l.begin_time desc")->select();
        $property = M('land')->alias('l')->field('t.name as property_name')->join('type t on t.type_id=l.type_id')
            ->where($where)->order("l.weight desc,l.begin_time desc")->select();


        foreach ($images as $item) {
            if ($item['tags'] == $show_tags_lists['head']) $head_images[] = $item;
            if ($item['tags'] == $show_tags_lists['note']) $note_images[] = $item;
            if ($item['tags'] == $show_tags_lists['cover']) $cover_images[] = $item;
            if ($item['tags'] == $show_tags_lists['code']) $code_images[] = $item;
            if ($item['tags'] == $show_tags_lists['room']) $room_images[] = $item;
            if ($item['tags'] == $show_tags_lists['location']) $location_images[] = $item;
            if ($item['tags'] == $show_tags_lists['interior']) $interior_images[] = $item;

        }


        foreach ($mobile_images as $item) {
            if ($item['tags'] == $show_tags_lists['head']) $mobile_head_images[] = $item;

        }
       


        $this->assign('hotel', $hotel);
        $this->assign('property', $property);
        $this->assign('head_images', $head_images);
        $this->assign('note_images', $note_images);
        $this->assign('logo_images', $cover_images);
        $this->assign('code_images', $code_images);
        //房间图
        $this->assign('room_images', $room_images);
        //外景图
        $this->assign('location_images', $location_images);
        //内景图
        $this->assign('interior_images', $interior_images);

        $this->assign('mobile_head_images', $mobile_head_images);
        $this->display();

    }

    /**
     * 入参检查
     * @return  get参数数组
     */

    private function parameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('get.'), [
                'level_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'type' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'land_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'keyword' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'city_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'is_sales' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {
            $this->error("参数错误，请检查！", __ACTION__ . '');
            exit;
        }

        return I('get.');
    }

    /**
     * 入参检查
     * @return  get参数数组
     */

    private function landParameterCheck()
    {
        try {
            (new \Admin\Common\Parameter\Validator())->execute(I('post.'), [
                'land_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'type' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'type_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'keyword' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'city_id' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
                'is_sales' => ['type' => 'integer', 'required' => false, 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {
            $this->error("参数错误，请检查！", __ACTION__ . '');
            exit;
        }

        return I('post.');
    }


    private function composeArray($parameter)
    {
        $result = [];
        if ($parameter['city_id']) $result['l.city_id'] = $parameter['city_id'];
        if ($parameter['type_id']) $result['l.type_id'] = $parameter['type_id'];
        if ($parameter['type']) $result['l.type'] = ['like', '%' . $parameter['type'] . '%'];
        if ($parameter['keyword']) $result['l.name'] = ['like', '%' . $parameter['keyword'] . '%'];
        if ('' != $parameter['is_sales']) $result['l.is_sales'] = $parameter['is_sales'];
//		dump($result);
        return $result;
    }

	private function getHeadImages()
	{
		$show_tags_lists = [
                
                'head'=>'头部图片',
                
            ];
        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $result = $image->getImage($show_tags_lists['head']);

		return $result;
	}

    private function getMobileHeadImages()
    {
        $show_tags_lists = [

            'head' => '头部图片',

        ];
        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $result = $image->getMobileImage($show_tags_lists['head']);

        return $result;
    }

    private function getMiddleImages()
	{
		$show_tags_lists = [

                'middle'=>'中间图片',

            ];
        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $result = $image->getImage($show_tags_lists['middle']);

		return $result;
	}
    private function getMobileMiddleImages()
	{
		$show_tags_lists = [

                'middle'=>'中间图片',

            ];
        $parameter = $this->parameterCheck();
        $level_id = $parameter['level_id'];

        $image = new Image($level_id);
        $result = $image->getMobileImage($show_tags_lists['middle']);

		return $result;
	}
//
//	private function composeArray2($parameter)
//	{
//		if ($parameter['keyword']) $result['l.name'] = ['like', '%' . $parameter['keyword'] . '%'];
//		return $result;
//	}

    // 酒店，地产 get请求
    private function getLand($data)
    {
        $parameter = $this->ParameterCheck();
        $where = $this->composeArray($parameter);
//		if(false == $where) $where=[];
        $map = array_merge($where, $data);
//		dump($map);
        $model = M('land');
        $count = $model->alias('l')->field('l.*,i.image_url1,i.image_url2')
            ->join('land_image i on i.land_id = l.land_id')
            ->where($map)->order("l.weight desc, l.begin_time desc")->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();
        $totalpages = $page->totalPages;

        $result = $model->alias('l')->field('l.*,i.image_url1,i.image_url2')
            ->join('land_image i on i.land_id = l.land_id')
//            ->join('type t on t.type_id=l.type_id')
            ->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($map)->order("l.weight desc, l.begin_time desc")->select();
//		dump($result);
        return [$result,$totalpages, $parameter];
    }

    //酒店 地产 post请求
    private function postLand($data)
    {
        $parameter = $this->landParameterCheck();
        $where = $this->composeArray($parameter);
        $map = array_merge($data, $where);


//		dump($parameter);
//		dump($where);
//		dump($data);
//		dump($map);

        $model = M('land');
        $count = $model->alias('l')->field('l.*,i.image_url1,i.image_url2')
            ->join('land_image i on i.land_id = l.land_id')
//            ->join('type t on t.type_id=l.type_id')
            ->where($map)->order("l.weight desc, l.begin_time desc")->count();

        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();
        $totalpages = $page->totalPages;

        $result = $model->alias('l')->field('l.*,i.image_url1,i.image_url2')
            ->join('land_image i on i.land_id = l.land_id')
//            ->join('type t on t.type_id=l.type_id')
            ->page(I('post.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))
            ->where($map)->order("l.weight desc, l.begin_time desc")->select();

//		dump($result);
//        if (false == $result) {
//            $this->ajaxReturn([
//                'status' => 'ok',
//                'msg' => 'false',
//                'item' => null,
//                'total' => 0
//            ]);
//        }
//        if (false == $result_mob) {
//            $this->ajaxReturn([
//                'status' => 'ok',
//                'msg' => 'false',
//                'notices' => null,
//                'total' => 0
//            ]);
//        }
        $this->ajaxReturn([
            'status' => 'ok',
            'msg' => 'success',
            'item' => $result,
            'total' => $totalpages,
        ]);
    }

}
