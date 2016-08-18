<?php
namespace Multiple\Backend\Controllers;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Multiple\Backend\Models\Album;
use Multiple\Backend\Models\Picture;
use Multiple\Backend\Plugins\Validator;

class AlbumController extends ControllerBase
{
    public function onConstruct()
    {
        parent::authentical();
        $this->view->setTemplateAfter('backend');
    }

    public function indexAction($page)
    {
        $currentPage = ($page > 0) ? $page : 1;
        $data = Album::getData();
        $paginator = new PaginatorModel(
            array(
                "data"  => $data,
                "limit" => 20,
                "page"  => $currentPage
                )
            );
        $data = $paginator->getPaginate();
        $this->view->data = $data;
        $this->view->title = 'Quản lý album';
        if($this->request->isAjax()) $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
    }

    public function formAction($id)
    {
        $title = empty($id) ? 'Thêm album' : 'Cập nhật thông tin album';
        $action = empty($id) ? '/admin/album-insert' : '/admin/album-update';
        $data = ($id !== '') ? Album::findFirstById($id) : '';
        $this->view->data = $data;
        $this->view->title = $title;
        $this->view->action = $action;
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
            $params['name']     = trim($this->request->getPost('name', 'string', ''));
            $params['alias']    = trim($this->request->getPost('alias', 'string', ''));
            $params['created']  = trim($this->request->getPost('created', 'string', ''));
            $params['author']   = trim($this->request->getPost('author', 'int', ''));
            $err = Validator::validate(array(
                    array('Tên Album', $params['name'],    'require'),
                    array('Alias',     $params['alias'], 'require'),
                    array('Ngày tạo album', $params['created'], 'require'),
                    array('Tác giả album', $params['author'], 'require'),
                ));
            Validator::errorback($err);
            Album::insert($params);
            return $this->response->redirect('/admin/album-list/');
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
            $params['name']     = trim($this->request->getPost('name', 'string', ''));
            $params['alias']    = trim($this->request->getPost('alias', 'string', ''));
            $params['created']  = trim($this->request->getPost('created', 'string', ''));
            $params['author']   = trim($this->request->getPost('author', 'int', ''));
            $err = Validator::validate(array(
                    array('ID Album',  $params['id'],    'require'),
                    array('Tên Album', $params['name'],    'require'),
                    array('Alias',     $params['alias'], 'require'),
                    array('Ngày tạo album', $params['created'], 'require'),
                    array('Tác giả album', $params['author'], 'require'),
                ));
            Validator::errorback($err);
            Album::updated($params['id'], $params);
            return $this->response->redirect('/admin/album-list/');
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
            $album = Album::findFirstById($id);
            if($album) {
                $picture = Picture::find(array("id_album = $id"))->toArray();
                if(count($picture) > 0) Validator::errorback(array("Album này đang chứa rất nhiều hình bạn không được phép xóa nó"));
                $album->delete();
            }
            return $this->response->redirect('/admin/album-list/');
        }
    }
}