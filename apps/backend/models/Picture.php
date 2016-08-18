<?php

namespace Multiple\Backend\Models;
use \Phalcon\Mvc\Model\Query\Builder as Builder;
use Multiple\Backend\Plugins\File as File;

class Picture extends ModelBase
{
    public static function getData()
    {
        $Builder = new Builder();
        $Builder->addFrom('Multiple\Backend\Models\Picture', 'p')
                ->innerJoin('Multiple\Backend\Models\Album', 'p.id_album = a.id', 'a')
                ->columns(array('p.id', 'a.name', 'a.alias', 'p.created', 'p.caption', 'p.image', 'p.link'))
                ->orderBy('p.id DESC');
        return $Builder->getQuery()->execute();
    }   

    public static function insert($params)
    {
        $obj = new self;
        foreach ($params as $key => $value){
            if($value !== '')
                $obj->$key = $value;
        }
        $obj->create();
    }

    public static function updated($id, $params)
    {
        $uploadPath = '../public/files/pictures/';
        $obj = self::findFirstById($id);
        if(!$obj) return false;
        foreach ($params as $key => $value){
            if($key === 'image' && $value === '')
                File::remove($uploadPath.$obj->image);
            $obj->$key = $value;
        }
        $obj->save();
    }
}