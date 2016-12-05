<?php
require_once "../include.php";

/*
    This class generate a pdo connection instance;
*/
class MyPDO{
    public $pdo = null;
    public function __construct($dsn,$username, $password, $charset){
        try{
            $this->pdo = new PDO($dsn,$username,$password,array(PDO::ATTR_PERSISTENT => true));
        }catch (PDOException $e){
            die('Error: Could not make a database link ( ' . $e->getMessage() . '). Error Code : ' . $e->getCode().' <br />');
        }
        $this->pdo->exec("SET NAMES'".$charset."'");
        $this->pdo->exec("SET CHARACTERSET".$charset);
        $this->pdo->exec("SET_CHARACTER_SET_CONNECTION=".$charset);
        $this->pdo->exec("SET SQL_MODE=''");
    }//end of construct
}// end of class

    function findAll($conn,$sql){

        $statement = $conn->prepare($sql);
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        return $statement->fetchAll();
    }
    function findOne($conn,$sql){
        $statement = $conn->prepare($sql);
        $statement->setFetchMode(PDO::FETCH_ASSOC);
        $statement->execute();
        return $statement->fetch();
    }

    function insert($conn,$table,$data){
        if(!is_array($data) || empty($data)){
            return 0;
        }
        $keys = join(",",array_keys($data));
        $vals = " ' ".join("','",array_values($data))."'";
        $sql = "insert into {$table}({$keys}) values({$vals})";
        echo $sql;
        $conn->query($sql);
        return $conn->lastInsertId();
    }
    function delete($conn,$table,$where = ""){
        if(empty($where)){
            return 0;
        }
        $sql = "delete from ".$table." where ".$where;
        return $conn->exec($sql);//row affected

    }
    function update($conn,$table,$data,$where = ""){
        if(empty($where)){
            return 0;
        }
        if(!is_array($data) || count($data)==0){
            return 0;
        }
        $up_field = array();
        foreach($data as $key => $val){
            $up_field[] = "'$key'='$val'";
        }
        $sql = "update ".$table." set ".implode(",",$up_field)." where ".$where;
        return $conn->exec($sql);
    }


    function getConnection(){
        try{
            $db = new MyPDO(dsn,username,password,charset);
            $conn = $db->pdo;
            return $conn;
        }catch(PDOException $e){
            die('Connection Error!:' . $e->getMessage());
        }
    }
