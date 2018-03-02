<?php
namespace Admin\Controller\System;

use Think\Controller;
use Admin\Common\Record\StaffLog;

class LogController extends Controller
{
	private $temp_log_string = '后台日志：';

	public function lists()
	{

		$paramter = $this->parameterCheck();
		$map = $this->searchSubmit($paramter);
		$model = M('staff_log');

		$count = $model->where($map)->count();
		$page = new \Think\Page($count, C('ONE_PAGE_SIZE'));
		$page->show();

		$result = $model->page(I('get.pg', 1, FILTER_VALIDATE_INT), C('ONE_PAGE_SIZE'))->where($map)->order('create_time desc')->select();
		$this->temp_log_string = rtrim($this->temp_log_string, ',');

		(new StaffLog)->add($this->temp_log_string);  // 日志记录

		$this->assign('paramter', $paramter);
		$this->assign('counts', $count);
		$this->assign('pager', $page);
		$this->assign('logs', $result);
		$this->display();
	}

	//导出数据方法
	public function export()
	{
		$model = M('staff_log');
		$parameter = $this->parameterCheck();
		$map = $this->searchSubmit($parameter);
		$res = $model->where($map)->select();
		$data = array();
		foreach ($res as $k => $item) {
			$data[$k]['id'] = $k + 1;
			$data[$k]['name'] = $item['name'];
			$data[$k]['staff_code'] = $item['staff_code'];
			$data[$k]['create_time'] = $item['create_time'];
			$data[$k]['ip'] = $item['ip'];
			$data[$k]['controller'] = $item['controller'];
			$data[$k]['action'] = $item['action'];
			$data[$k]['event'] = $item['event'];
			$data[$k]['zh_en'] = $item['zh_en'];
		}
		//print_r($data);exit;
		foreach ($data as $field => $v) {
			if ($field == 'id') {
				$headArr[] = '序号';
			}

			if ($field == 'name') {
				$headArr[] = '姓名';
			}

			if ($field == 'staff_code') {
				$headArr[] = '工号';
			}

			if ($field == 'create_time') {
				$headArr[] = '操作时间';
			}

			if ($field == 'ip') {
				$headArr[] = 'IP地址';
			}			
			if($field == 'controller'){
				$headArr[]='控制器';
			}

			if($field == 'action'){
				$headArr[]='活动';
			}
			if ($field == 'event') {
				$headArr[] = '操作内容';
			}
			if ($field == 'zh_en') {
				$headArr[] = '中文版/英文版';
			}
		}

		$filename = "log_download";
		$this->getExcel($filename, $headArr, $data);
	}

	/**
	 * 入参检查
	 * @return  get参数数组
	 */

	private function parameterCheck()
	{

		try {
			(new \Admin\Common\Parameter\Validator())->execute(I('get.'), [
				'begin_date' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'end_date' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'name' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'staff_code' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'ip' => ['type' => 'ipv4', 'required' => false, 'allow_empty' => true],
				'controller' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'action' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'event' => ['type' => 'string', 'required' => false, 'allow_empty' => true],
				'zh_en' => ['type' => 'string', 'required' => false, 'allow_empty' => true]
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
			$this->temp_log_string .= $paramter['begin_date'] . ',';
		}
		if ($paramter['begin_date'] && $paramter['end_date']) {
			$date = date_create($paramter['end_date']);
			date_modify($date, '+1 day');
			$end_date = date_format($date, 'Y-m-d');

			$map['create_time'] = array(array('egt', $paramter['begin_date']), array('lt', $end_date));
			$this->temp_log_string .= $paramter['begin_date'] . ',' . $paramter['end_date'] . ',';
		}
		if ($paramter['name']) {

			$map['name'] = $paramter['name'];
			$this->temp_log_string .= $paramter['name'] . ',';

		}
		if ($paramter['staff_code']) {
			$map['staff_code'] = $paramter['staff_code'];
			$this->temp_log_string .= $paramter['staff_code'] . ',';

		}
		if ($paramter['ip']) {
			$map['ip'] = $paramter['ip'];
			$this->temp_log_string .= $paramter['ip'] . ',';

		}

		if ($paramter['controller']) {
			$map['controller'] = $paramter['controller'];
			$this->temp_log_string .= $paramter['controller'] . ',';

		}
		if ($paramter['action']) {
			$map['action'] = $paramter['action'];
			$this->temp_log_string .= $paramter['action'] . ',';

		}
		if ($paramter['event'] != null) {
			$map['event'] = ["LIKE", "%" . $paramter['event'] . "%"];
			$this->temp_log_string .= $paramter['event'] . ',';
		}
		if ($paramter['zh_en']) {
			$map['zh_en'] = $paramter['zh_en'];
			$this->temp_log_string .= $paramter['zh_en'] . ',';

		}

		return $map;
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