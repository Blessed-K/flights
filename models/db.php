<?php
     session_start();
     $sql="";

     class db{
       private $servername;
       private$databasename;
       private $username;
       private$password;
       private $charset;
       //PDO - PHP Data Objects

       //connects to the database
       function connect(){
        $this->servername="localhost";
        $this->databasename="flightbooking";
        $this->username="root";
        $this->password="";
        $this->charset="utf8mb4";
        try{
        $dsn="mysql:host=$this->servername;dbname=$this->databasename;charset=$this->charset";
        $pdo=new PDO($dsn,$this->username,$this->password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
        }catch(PDOException $e){
          echo "Connection failed: " . $e->getMessage();
            
        }
       }

       function getData($sql){
        return $this->connect()->query($sql);
       }


       function getJSON($sql){
        $rst=$this->getData($sql);
        return json_encode($rst->fetchAll(PDO::FETCH_ASSOC));
       }

     }
       
//generates a random string of specified length
function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!$&#?%(){}[]:*_';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

?>