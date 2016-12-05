<?php
/**
 * Created by PhpStorm.
 * User: rick
 * Date: 19/10/2016
 * Time: 14:55
 */
require_once "../vendor/autoload.php";
require_once "../include.php";
	use \Psr\Http\Message\ServerRequestInterface as Request;
	use \Psr\Http\Message\ResponseInterface as Response;
$conf = [
    'settings' => [
        'displayErrorDetails' => true,
    ],
];
    $config = new \Slim\Container($conf);
	$api = new \Slim\App($config);

    $api->get('/get/allDocs','getAllDocs');
    $api->get('/get/allLanguages','getAllLanguages');
  //  $api->get('/get/doc/{docName}','getDocType');
   // $api->get('/get/language/{language}','getLangClass');
    $api->get('/get/price/{document}/{language}','getPrice');
    $api->post('/post/upload','handleUpload');

$api->run();

