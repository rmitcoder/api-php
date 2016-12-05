<?php
require_once "../include.php";
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


    function getAllDocs(){
        $sql = "select docName from documents";
        $db = getConnection();
        try{
            $result = findAll($db,$sql);
            $db = null;
        }catch(PDOException $e){
            error_log($e->getMessage(),3,'../api/php.log');
            echo '{"error":{"text":' . $e->getMessage() . '}}';
        }
        return json_encode($result);
    }


    function getAllLanguages(){
        $sql = "select language from language";
        $db = getConnection();
        try{
            $result = findAll($db,$sql);
            $db = null;

        }catch(PDOException $e){
            error_log($e->getMessage(),3,'../api/php.log');
            echo '{"error":{"text":' . $e->getMessage() . '}}';
        }
        return json_encode($result);
    }



    function getPrice(Request $request,Response $response,$args){
        $db = getConnection();
        $document_name = $args['document'];
        $language_name = $args['language'];
        $document_name = escape($document_name);
        $category_sql = '';
        $doc_sql = "select docType from documents where docName='{$document_name}'";
        $lan_sql = "select class from language where language='{$language_name}'";
        try{
            $doc_result = findOne($db,$doc_sql);
            $lan_result = findOne($db,$lan_sql);
            $type = $doc_result['docType'];
            $class = $lan_result['class'];
            if($type == 'japOnly'){
                $category_sql = "select price from price where type='{$type}'";
            }else{
                $category_sql = "select price from price where type='{$type}'and class='{$class}'";
            }
            $result = findOne($db,$category_sql);
            $price = array();
            $price['std'] = intval($result['price']);
            $price['exp'] = intval($result['price'])+100;
            $price['urg'] = intval($result['price'])+200;
            $db = null;
        }catch(PDOException $e){
            echo '{"error":{"text":' . $e->getMessage() . '}}';
        }

        return json_encode($price);

    }
    function handleUpload(Request $request,Response $response,$args){
        $db = getConnection();
        $order_number = date('YmdHi').rand(1000,9999);
        $order_time = time();

        $input = $request->getUploadedFiles();
        foreach ($input['docs[]'] as $doc) {
            echo "<pre>";
            echo $doc->getClientFilename();
            echo "</br>";
            echo $doc->getClientMediaType();
            echo "</br>";
            echo "Size of File is :".$doc->getSize()." bytes";
            echo "</pre>";
            return $doc->getClientFilename();
        }
        return json_encode($input);


    }

     function escape($value) {
        $search = array("\\", "\0", "\n", "\r", "\x1a", "'", '"');
        $replace = array("\\\\", "\\0", "\\n", "\\r", "\Z", "\'", '\"');
        return str_replace($search, $replace, $value);
    }