<?php
namespace Multiple\Frontend\Controllers;
use Multiple\Frontend\Models\Album;
use Multiple\Frontend\Models\Picture;

class AlbumController extends ControllerBase
{

    public function indexAction($page)
    {
        $id = $this->dispatcher->getParam('id');
        $alias = $this->dispatcher->getParam('alias');
        $data = Album::getData($id, $alias);
        if (!$data->toArray()) {
            $this->dispatcher->forward(array(
                'controller' => 'error',
                'action' => 'show404',
            ));
        }
        $this->view->data = $data;
        $this->view->infomation = Album::getAlbumName($id, $alias);
    }
}