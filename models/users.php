<?php
 require_once('db.php');

 class user extends db{
    function checkuser($userid,$username){
         $sql=" CALL `sp_checkuser`({$userid}, '{$username}')";
         //echo $sql.PHP_EOL;
         return $this->getdata($sql)->rowcount();
    }
    function saveuser($userid, $username, $firstname, $lastname, $userpassword ,
    $salt , $mobile, $email, $systemadmin){
        //check if user exists
        if($this->checkuser($userid,$username)){
            return ["status"=>"exists","message"=>"User already exists"];
        }else{
                //remove this after user login
                $addedby=1;
                $sql="CALL`sp_saveuser`({$userid}, '{$username}', '{$firstname}', '{$lastname}', '{$userpassword}' ,
                '{$salt}' , '{$mobile}', '{$email}', {$systemadmin}, {$addedby})";
                //echo $sql.PHP_EOL;
                $this ->getData($sql);
                return ["status"=>"success","message"=>"User saved successfully"];
    }
}
    function getusers(){
      $sql="call `sp_getusers`()";
      return $this->getJSON($sql);
    }
    function getuserdetails(){
     $sql="CALL `sp_getuserdetails`({$userid})";
     return $this->getJSON($sql);

    }

    function getobjects(){
        $sql="call `sp_getobjects`()";
        return $this->getJSON($sql);
    }

 }
?>