<?php

$router->add("/albums/:int/([a-zA-Z0-9\_\-]+).html/?{page:[0-9]{0,}}", array(
    'module' => 'frontend',
    'controller' => 'album',
    'action' => 'index',
    'id' => 1,
    'alias' => 2,
));