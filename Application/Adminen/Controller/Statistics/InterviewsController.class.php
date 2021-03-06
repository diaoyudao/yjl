<?php
namespace Adminen\Controller\Statistics;

use Think\Controller;
use Adminen\Common\Record\StaffLog;
use Think\Crypt\Driver\Think;

class InterviewsController extends Controller
{
    private $temp_log_string = '媒体采访统计：';

    public function lists()
    {

        $paramter = $this->parameterCheck();
        $where = $this->searchSubmit($paramter);

        $model = M('interviews');

        $count = $model->where($where)->count();
        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))->where($where)->order('create_time desc')->select();

        //$this->temp_log_string = rtrim($this->temp_log_string, ',');
        //(new StaffLog)->add($this->temp_log_string);  // 日志记录

        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('datas', $result);
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
                'begin_date' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'end_date' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'name' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'organize' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'tel' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
            ]);
        } catch (\Exception $ex) {
            $this->error("参数错误，请检查！", __ACTION__ . '');
            exit;
        }

        return I('get.');
    }

    /**
     * 数据提交
     */

    private function searchSubmit($paramter)
    {
        if ($paramter['end_date'] == null && $paramter['begin_date']) {
            $map['create_time'] = array('egt', $paramter['begin_date']);
        }
        if ($paramter['begin_date'] == null && $paramter['end_date']) {
            $map['create_time'] = array('elt', $paramter['end_date']);
        }
        if ($paramter['begin_date'] && $paramter['end_date']) {
            $date = date_create($paramter['end_date']);
            date_modify($date, '+1 day');
            $end_date = date_format($date, 'Y-m-d');

            $map['create_time'] = array(array('egt', $paramter['begin_date']), array('lt', $end_date));
        }

        if ($paramter['organize']) {
            $map['organize'] = ['like', '%'.$paramter['organize'].'%'];
        }

        if ($paramter['name']) {
            $map['name'] = ['like', '%'.$paramter['name'].'%'];
        }

        if ($paramter['tel']) {
            $map['tel'] = ['like', '%'.$paramter['tel'].'%'];
        }

        return $map;
    }


    //导出数据方法
    public function export()
    {
        $model = M('interviews');
        $parameter = $this->parameterCheck();
        $map = $this->searchSubmit($parameter);
        $res = $model->where($map)->select();
//        dump($res);exit;
        $data = array();
        foreach ($res as $k => $item) {
            $data[$k]['id'] = $k + 1;
            $data[$k]['organize'] = $item['organize'];
            $data[$k]['name'] = $item['name'];
            $data[$k]['tel'] = $item['tel'];
            $data[$k]['note'] = $item['note'];


        }
//		dump($data);exit;
        foreach ($data as $field => $v) {
            if ($field == 'id') {
                $headArr[] = '序号';
            }

            if ($field == 'organize') {
                $headArr[] = '机构名称';
            }

            if ($field == 'name') {
                $headArr[] = '采访者姓名';
            }

            if ($field == 'tel') {
                $headArr[] = '联系电话';
            }

            if ($field == 'note') {
                $headArr[] = '采访事项';
            }

        }
//        dump($headArr);exit;

        $filename = "interviews_download";
        $this->getExcel($filename, $headArr, $data);
    }

    private function getExcel($fileName, $headArr, $data)
    {
//		//导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入

        import("Vendor.PHPExcel.PHPExcel");
        import("Vendor.PHPExcel.PHPExcel.Writer.Excel5");
        import("Vendor.PHPExcel.PHPExcel.IOFactory.php");

        $date = date("Y_m_d", time());
        $fileName .= "_{$date}.csv";

        //创建PHPExcel对象，注意，不能少了\
        $objPHPExcel = new \PHPExcel();
        $objProps = $objPHPExcel->getProperties();

        //设置表头
        $key = ord("A");
//        print_r($headArr);exit;
        foreach ($headArr as $v) {
            $colum = chr($key);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
            $key += 1;
        }

        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();

//        print_r($res);exit;
        foreach ($data as $key => $rows) { //行写入
            $span = ord("A");
            foreach ($rows as $keyName => $value) {// 列写入
                $j = chr($span);
                $objActSheet->setCellValue($j . $column, $value);
                $span++;
            }
            $column++;
        }
//        print_r($objProps);exit;

        $fileName = iconv("utf-8", "gb2312", $fileName);

        //重命名表
        //$objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
//        dump($objPHPExcel->setActiveSheetIndex(0));exit;
        ob_end_clean();//清除缓冲区,避免乱码
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }


}
