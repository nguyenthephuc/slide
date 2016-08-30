<?php
namespace Multiple\Backend\Controllers;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Multiple\Backend\Models\Album;
use Multiple\Backend\Models\Picture;
use Multiple\Backend\Plugins\Validator;
use Multiple\Backend\Plugins\File as File;

class PictureController extends ControllerBase
{
    private $uploadPath = '../public/files/pictures/';

    public function onConstruct()
    {
        parent::authentical();
        $this->view->setTemplateAfter('backend');
        $this->view->uploadPath = $this->uploadPath;
    }

    public function indexAction($page)
    {
        $currentPage = ($page > 0) ? $page : 1;
        $data = Picture::getData();
        $paginator = new PaginatorModel(
            array(
                "data"  => $data,
                "limit" => 8,
                "page"  => $currentPage
                )
            );
        $data = $paginator->getPaginate();
        $this->view->data = $data;
        $this->view->title = 'Quản lý hình ảnh';
        if($this->request->isAjax()) $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
    }

    public function formAction($id)
    {
        $listAlbum = Album::find();
        $dataAlbum = array();
        foreach ($listAlbum as $key => $value)
            $dataAlbum[$value->id] = $value->name;
        $title = empty($id) ? 'Thêm hình ảnh mới' : 'Cập nhật thông tin hình ảnh';
        $action = empty($id) ? '/admin/picture-insert' : '/admin/picture-update';
        $data = ($id !== '') ? Picture::findFirstById($id) : '';
        $this->view->data = $data;
        $this->view->title = $title;
        $this->view->action = $action;
        $this->view->dataAlbum = $dataAlbum;
        $this->view->userLogin = $this->session->get('user-login');
        if($this->request->isAjax()) $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
    }

    public function insertAction()
    {
        if(!$this->request->isPost()){
            $this->dispatcher->forward(array(
                'controller' => 'index',
                'action' => 'show404',
            ));
        } else {
            $params = [];
            $params['id_album'] = trim($this->request->getPost('id_album', 'int', ''));
            $params['caption']  = trim($this->request->getPost('caption', 'string', ''));
            $params['created']  = trim($this->request->getPost('created', 'string', ''));
            $imageType          = trim($this->request->getPost('imageType', 'int', ''));

            $myErr = array();
            if((int)$imageType === 1) {
                if(File::has('image')) {
                    $params['image'] = File::rename('image');
                    File::upload('image', $this->uploadPath.$params['image']);
                } else {
                    $myErr['image'] = 'Hình ảnh không được để trống';
                }
            } elseif((int)$imageType === 2) {
                $params['link'] = trim($this->request->getPost('link', 'string', ''));
                if($params['link'] === '') {
                    $myErr['link'] = 'Nguồn hình ảnh không được để trống';
                }
            }
            $err = Validator::validate(array(
                    array('Tên Album',        $params['id_album'],    'require'),
                    array('Ngày tạo album',   $params['created'], 'require')
                ));
            Validator::errorback(array_merge($err, $myErr));
            Picture::insert($params);
            return $this->response->redirect('/admin/picture-list/');
        }
    }

    public function updateAction()
    {
        if(!$this->request->isPost()){
            $this->dispatcher->forward(array(
                'controller' => 'index',
                'action' => 'show404',
            ));
        } else {
            $params = [];
            $params['id']       = trim($this->request->getPost('id', 'int', ''));
            $params['id_album'] = trim($this->request->getPost('id_album', 'int', ''));
            $params['caption']  = trim($this->request->getPost('caption', 'string', ''));
            $params['created']  = trim($this->request->getPost('created', 'string', ''));
            $imageType          = trim($this->request->getPost('imageType', 'int', ''));
            $myErr = array();
            if((int)$imageType === 1) {
                if(File::has('image')) {
                    $params['link'] = '';
                    $params['image'] = File::rename('image');
                    File::upload('image', $this->uploadPath.$params['image']);
                    $oldPicture = Picture::findFirstById($params['id']);
                    File::remove($this->uploadPath.$oldPicture->image);
                } else {
                    $myErr['image'] = 'Hình ảnh không được để trống';
                }
            } elseif((int)$imageType === 2) {
                $params['image'] = '';
                $params['link'] = trim($this->request->getPost('link', 'string', ''));
                if($params['link'] === '') {
                    $myErr['link'] = 'Nguồn hình ảnh không được để trống';
                }
            }
            $err = Validator::validate(array(
                    array('Tên Album',        $params['id_album'],    'require'),
                    array('Ngày tạo album',   $params['created'], 'require')
                ));
            Validator::errorback(array_merge($err, $myErr));
            Picture::updated($params['id'], $params);
            return $this->response->redirect('/admin/picture-list/');
        }
    }

    public function deleteAction()
    {
        if(!$this->request->isPost()){
            $this->dispatcher->forward(array(
                'controller' => 'index',
                'action' => 'show404',
            ));
        } else {
            $id = $this->request->getPost('id', 'int', '');
            $pic = Picture::findFirstById($id);
            if($pic) {
                if($pic->image)
                    File::remove($this->uploadPath.$pic->image);
                $pic->delete();
            }
            return $this->response->redirect('/admin/picture-list/');
        }
    }
}