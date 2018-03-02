<?php
namespace Adminen\Common;

class Image
{
    /**
     * 生成缩略图
     * @param $source_img  // 原始大图地址
     * @param $width    // 缩略图宽度
     * @param $height   // 高度
     * @param $preview_img  // 缩略图地址
     */
    public static function  createPreviewImage($source_img, $width, $height, $preview_img) {
        $imgage = getimagesize($source_img); //得到原始大图片
        switch ($imgage[2]) { // 图像类型判断
            case 1:
                $im = imagecreatefromgif($source_img);
                break;
            case 2:
                $im = imagecreatefromjpeg($source_img);
                break;
            case 3:
                $im = imagecreatefrompng($source_img);
                break;
        }
        $src_W = $imgage[0]; //获取大图片宽度
        $src_H = $imgage[1]; //获取大图片高度
        $tn = imagecreatetruecolor($width, $height); //创建缩略图
        imagecopyresampled($tn, $im, 0, 0, 0, 0, $width, $height, $src_W, $src_H); //复制图像并改变大小
        imagejpeg($tn, $preview_img); //输出图像
        imagedestroy($im);
        imagedestroy($tn);  // 销毁
    }
}