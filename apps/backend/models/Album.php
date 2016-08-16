<?php
namespace Multiple\Backend\Models;
use \Phalcon\Mvc\Model\Query\Builder as Builder;
class Album extends ModelBase
{
    public static function getData()
    {
        $Builder = new Builder();
        $Builder->addFrom('Multiple\Backend\Models\Album', 'a')
                ->innerJoin('Multiple\Backend\Models\User', 'a.author = u.id', 'u')
                ->columns(array('a.id', 'a.name', 'a.alias', 'a.created', 'author'=>'u.username'))
                ->orderBy('a.id DESC');
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
        $obj = self::findFirstById($id);
        if(!$obj) return false;
        foreach ($params as $key => $value){
            if($value !== '')
                $obj->$key = $value;
        }
        $obj->save();
    }
}