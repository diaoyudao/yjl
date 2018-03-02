<?php
namespace Adminen\Controller\Statistics;

use Think\Controller;
use Adminen\Common\Record\StaffLog;

class WitnessesController extends Controller
{
    private $temp_log_string = '举报统计：';

    public function lists()
    {
        $paramter = $this->parameterCheck();
        $map = $this->searchSubmit($paramter);

        $model = M('witnesses');

        $count = $model->where($map)->count();
        $page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
        $page->show();

        $result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))->where($map)->order('create_time desc')->select();
        //获得menu_name
        $data = $this->getSelect();

        // $this->temp_log_string = rtrim($this->temp_log_string, ',');
        //(new StaffLog)->add($this->temp_log_string);  // 日志记录

        $this->assign('paramter', $paramter);
        $this->assign('menu_name', $data);
        $this->assign('counts', $count);
        $this->assign('pager', $page);
        $this->assign('statistics', $result);
        $this->display();
    }


    private function getSelect()
    {
        $data = C('HOME_MENU_LISTS');
        $data = array_unique($data);
        unset($data['/cok/cok']);
        $res = array_values($data);
        $res[] = "下载系统升级包";
        $res[] = "下载地图数据包";
        return $res;
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
                'defendant' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'plaintiff' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'tel' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
                'desc' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
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
            $this->temp_log_string .= $paramter['begin_date'] . ',';
        }
        if ($paramter['begin_date'] == null && $paramter['end_date']) {
            $map['create_time'] = array('elt', $paramter['end_date']);
            $this->temp_log_string .= $paramter['end_date'] . ',';
        }
        if ($paramter['begin_date'] && $paramter['end_date']) {
            $date = date_create($paramter['end_date']);
            date_modify($date, '+1 day');
            $end_date = date_format($date, 'Y-m-d');

            $map['create_time'] = array(array('egt', $paramter['begin_date']), array('lt', $end_date));
            $this->temp_log_string .= $paramter['begin_date'] . ',' . $paramter['end_date'] . ',';

        }

        if ($paramter['defendant']) {
            $map['defendant'] = ['like', '%' . $paramter['defendant'] . '%'];
            $this->temp_log_string .= $paramter['ip'] . ',';

        }
        if ($paramter['plaintiff']) {
            $map['plaintiff'] = ['like', '%' . $paramter['plaintiff'] . '%'];
            $this->temp_log_string .= $paramter['menu_name'] . ',';

        }
        if ($paramter['tel']) {
            $map['tel'] = ['like', '%' . $paramter['tel'] . '%'];
            $this->temp_log_string .= $paramter['controller'] . ',';

        }

        if ($paramter['desc']) {
            $map['desc'] = ['like', '%' . $paramter['desc'] . '%'];
            $this->temp_log_string .= ',' . $paramter['action'];

        }

        return $map;
    }


    //导出数据方法
    public function export()
    {
        $model = M('witnesses');
        $parameter = $this->parameterCheck();
        $map = $this->searchSubmit($parameter);
        $res = $model->where($map)->select();
        $data = array();
        foreach ($res as $k => $item) {
            $data[$k]['id'] = $k + 1;
            $data[$k]['defendant'] = $item['defendant'];
            $data[$k]['city'] = $item['city'];
            $data[$k]['company_type'] = $item['company_type'];
            $data[$k]['partiton'] = $item['partiton'];
            $data[$k]['desc'] = $item['desc'];
            $data[$k]['plaintiff'] = $item['plaintiff'];
            $data[$k]['mail'] = $item['mail'];
            $data[$k]['tel'] = $item['tel'];
            $data[$k]['qq'] = $item['qq'];
            $data[$k]['create_time'] = $item['create_time'];
            $data[$k]['ip'] = $item['ip'];
            $data[$k]['note'] = $item['note'];
            $data[$k]['address'] = $item['address'];
            $data[$k]['process'] = $item['process'];
            $data[$k]['evidence'] = $item['evidence'];

        }
//		dump($parameter);exit;
        foreach ($data as $field => $v) {
            if ($field == 'id') {
                $headArr[] = '序号';
            }

            if ($field == 'defendant') {
                $headArr[] = '被举报人';
            }

            if ($field == 'city') {
                $headArr[] = '城市';
            }

            if ($field == 'company_type') {
                $headArr[] = '公司类型';
            }

            if ($field == 'partiton') {
                $headArr[] = '部门';
            }

            if ($field == 'desc') {
                $headArr[] = '举报事项';
            }

            if ($field == 'plaintiff') {
                $headArr[] = '举报人';
            }
            if ($field == 'mail') {
                $headArr[] = '举报人邮箱';
            }

            if ($field == 'tel') {
                $headArr[] = '举报人电话';
            }
            if ($field == 'qq') {
                $headArr[] = '举报人qq';
            }
            if ($field == 'create_time') {
                $headArr[] = '举报时间';
            }
            if ($field == 'ip') {
                $headArr[] = '举报IP';
            }
            if ($field == 'note') {
                $headArr[] = '事项';
            }
            if ($field == 'address') {
                $headArr[] = '时间地点';
            }
            if ($field == 'process') {
                $headArr[] = '过程';
            }
            if ($field == 'evidence') {
                $headArr[] = '证据';
            }

        }

        $filename = "witnesses_download";
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
        //print_r($headArr);exit;
        foreach ($headArr as $v) {
            $colum = chr($key);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
            $key += 1;
        }

        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();

        //print_r($res);exit;
        foreach ($data as $key => $rows) { //行写入
            $span = ord("A");
            foreach ($rows as $keyName => $value) {// 列写入
                $j = chr($span);
                $objActSheet->setCellValue($j . $column, $value);
                $span++;
            }
            $column++;
        }

        $fileName = iconv("utf-8", "gb2312", $fileName);

        //重命名表
        //$objPHPExcel->getActiveSheet()->setTitle('test');
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
        ob_end_clean();//清除缓冲区,避免乱码
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }


}
