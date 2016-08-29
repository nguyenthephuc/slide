<?php
namespace Multiple\Frontend\Models;
use \Phalcon\Mvc\Model\Query\Builder as Builder;

class Album extends ModelBase
{
    public static function getData($id, $alias)
    {
        $Builder = new Builder();
        $Builder->addFrom('Multiple\Frontend\Models\Picture', 'p')
                ->innerJoin('Multiple\Frontend\Models\Album', 'p.id_album = a.id', 'a')
                ->andWhere('a.id = :id: AND a.alias = :alias:', array('id'=>$id, 'alias'=>$alias))
                ->columns(array('p.id', 'a.name', 'a.created', 'p.caption', 'p.image', 'p.link'))
                ->orderBy('p.id DESC');
        return $Builder->getQuery()->execute();
    }

    public static function getAlbumName($id, $alias)
    {
        return Album::findFirst(
            array(
                'conditions' => 'id = ?1 AND alias = ?2',
                'bind' => array(1 => $id, 2 => $alias)
            )
        );
    }
}