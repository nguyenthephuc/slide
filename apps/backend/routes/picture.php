<?php

$router->add("/admin/picture-list/?{page:[0-9]{0,}}", array(
    'module' => 'backend',
    'controller' => 'picture',
    'action' => 'index',
));

$router->add('/admin/picture-form/?{id:[0-9]{0,}}', array(
    'module' => 'backend',
    'controller' => 'picture',
    'action' => 'form'
));

$router->add('/admin/picture-insert', array(
    'module' => 'backend',
    'controller' => 'picture',
    'action' => 'insert'
));

$router->add('/admin/picture-update', array(
    'module' => 'backend',
    'controller' => 'picture',
    'action' => 'update'
));

$router->add('/admin/picture-delete', array(
    'module' => 'backend',
    'controller' => 'picture',
    'action' => 'delete'
));