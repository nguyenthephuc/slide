<?php

namespace Multiple\Backend\Models;

class Picture extends ModelBase
{
    public function initialize()
    {
        $this->hasMany("id", "Picture", "id_album");
    }

    public function getSource()
    {
        return 'picture';
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