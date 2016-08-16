<?php

$router->add("/admin/album-list/?{page:[0-9]{0,}}", array(
    'module' => 'backend',
    'controller' => 'album',
    'action' => 'index',
));

$router->add('/admin/album-form/?{id:[0-9]{0,}}', array(
    'module' => 'backend',
    'controller' => 'album',
    'action' => 'form'
));

$router->add('/admin/album-insert', array(
    'module' => 'backend',
    'controller' => 'album',
    'action' => 'insert'
));

$router->add('/admin/album-update', array(
    'module' => 'backend',
    'controller' => 'album',
    'action' => 'update'
));

$router->add('/admin/album-delete', array(
    'module' => 'backend',
    'controller' => 'album',
    'action' => 'delete'
));