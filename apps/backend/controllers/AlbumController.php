<?php
namespace Multiple\Backend\Controllers;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Multiple\Backend\Models\Album;
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
        $title = empty($id) ? 'Thêm tài khoản mới' : 'Cập nhật thông tin tài khoản';
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
            if( User::findFirst( array('conditions'=>'id <> ?1 and username = ?2', 'bind'=>array(1=>$params['id'], 2=>$params['username'])) ) )
                $err['username'] = 'Tài khoản đã tồn tại\n';
            Validator::errorback($err);
            if($params['pass'] !== '')
                $params['pass'] = $this->security->hash($params['pass']);
            else
                unset($params['pass']);
            User::updated($params['id'], $params);
            return $this->response->redirect('/admin/user-list/');
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
            $user = User::findFirstById($id);
            if($user)
                $user->delete();
            return $this->response->redirect('/admin/user-list/');
        }
    }
}