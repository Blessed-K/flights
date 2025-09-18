<?php
require_once 'db.php';

class city extends db{

    function checkcity($cityid, $cityname, $countryid){       
         $sql="CALL `sp_checkcity`({$cityid},'{$cityname}',{$countryid})";
         return $this->getData($sql)->rowCount();
    }
    
    function savecity($cityid, $cityname, $countryid){
        if($this->checkcity($cityid, $cityname, $countryid) > 0){
            return [
                'status' => 'error',
                'message' => 'City already exists.'
            ];
        }
        $sql="CALL `sp_savecity`({$cityid},'{$cityname}',{$countryid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'City saved successfully.'
        ];
    }
    function getcity(){
        $sql="CALL `sp_getcity`()";
        return $this->getJSON($sql);

    }
    function getcitydetails($cityid){
        $sql="CALL `sp_getcitybyid`({$cityid})";
        return $this->getJSON($sql);

    }
    function deletecity($cityid){
        $sql="CALL `sp_deletecity`({$cityid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'City is deleted successfully.'
        ];

    }
}
?>