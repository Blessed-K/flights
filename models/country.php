<?php
require_once 'db.php';

class country extends db{
    function checkcountry($countryid, $countryname){       
         $sql="CALL `sp_checkcountry`({$countryid},'{$countryname}')";
         return $this->getData($sql)->rowCount();
    }
    function savecountry($countryid, $countryname){
        if($this->checkcountry($countryid, $countryname) > 0){
            return [
                'status' => 'error',
                'message' => 'Country already exists.'
            ];
        }
        $sql="CALL `sp_savecountry`({$countryid},'{$countryname}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Country saved successfully.'
        ];
    }
    function getcountry(){
        $sql="CALL `sp_getcountries`()";
        return $this->getJSON($sql);

    }
    function getcountrydetails($countryid){
        $sql="CALL `sp_getcountrybyid`({$countryid})";
        return $this->getJSON($sql);

    }
    function deletecountry($countryid){
        $sql="CALL `sp_deletecountry`({$countryid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Country is deleted successfully.'
        ];

    }
}
?>