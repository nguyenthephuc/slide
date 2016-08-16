<?php
namespace Multiple\Backend\Plugins;

class File
{

    public static function has($file)
    {
        if(empty($file)) return false;
        if($_FILES[$file]['tmp_name'])
            return true;
        return false;
    }

    public static function getFile($file)
    {
        if(empty($file)) return false;
        return $_FILES[$file]['tmp_name'];
    }

    public static function rename($file)
    {
        if(empty($file)) return false;
        $path_parts = pathinfo($_FILES[$file]['name']);
        $extension = isset($path_parts['extension']) ? $path_parts['extension'] : '';
        $name = isset($path_parts['filename']) ? $path_parts['filename'] : '';
        return uniqid().'_'.md5($name) . date('YmdHis').'.'.$extension;
    }

    public static function upload($file, $path)
    {
        if(empty($file) || empty($path)) return false;
        copy($_FILES[$file]['tmp_name'], $path);
    }

    public static function remove($file)
    {
        if(empty($file)) return false;
        if(file_exists($file)){
            unlink($file);
        }
    }

    public static function extension($file)
    {
        if(empty($file)) return false;
        $str = @mime_content_type($_FILES[$file]['tmp_name']);
        $array = array(
            "image/png"=>'image',
            "image/jpeg"=>'image',
            "image/gif"=>'image'
            );
        return (isset($array[strtolower(trim($str))])) ? $array[strtolower(trim($str))] : 'Unknown';
    }

    public static function resize_crop_image($max_width, $max_height, $source_file, $dst_dir, $quality = 80)
    {
        $imgsize = getimagesize($source_file);
        $width = $imgsize[0];
        $height = $imgsize[1];
        $mime = $imgsize['mime'];
        $ra = $width/$height;
        if($max_height === 'auto'){
            $max_height = $max_width/$ra;
        }

        if($max_width === 'auto'){
            $max_width = $max_height*$ra;
        }
        $dst_img = imagecreatetruecolor($max_width, $max_height);
        switch($mime){
            case 'image/gif':
                $image_create = "imagecreatefromgif";
                $image = "imagegif";
                $background = imagecolorallocate($dst_img, 0, 0, 0);
                imagecolortransparent($dst_img, $background);
                break;
            case 'image/png':
                $image_create = "imagecreatefrompng";
                $image = "imagepng";
                $quality = 7;
                $background = imagecolorallocate($dst_img, 0, 0, 0);
                imagecolortransparent($dst_img, $background);
                imagealphablending($dst_img, false);
                imagesavealpha($dst_img, true);
                break;
            case 'image/jpeg':
                $image_create = "imagecreatefromjpeg";
                $image = "imagejpeg";
                $quality = 100;
                break;
            default:
                return false;
                break;
        }
        $src_img = $image_create($source_file);
        $width_new = $height * $max_width / $max_height;
        $height_new = $width * $max_height / $max_width;
        if($width_new > $width){
            $h_point = (($height - $height_new) / 2);
            imagecopyresampled($dst_img, $src_img, 0, 0, 0, $h_point, $max_width, $max_height, $width, $height_new);
        }else{
            $w_point = (($width - $width_new) / 2);
            imagecopyresampled($dst_img, $src_img, 0, 0, $w_point, 0, $max_width, $max_height, $width_new, $height);
        }
        $image($dst_img, $dst_dir, $quality);
        if($dst_img)imagedestroy($dst_img);
        if($src_img)imagedestroy($src_img);
    }
}