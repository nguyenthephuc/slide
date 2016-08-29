<?php
namespace Multiple\Frontend\Controllers;

class IndexController extends ControllerBase
{

	public function indexAction()
	{
        return $this->response->redirect('/albums/1/fds-12-dsds');
	}
}