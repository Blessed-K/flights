<?php
require_once 'db.php';

class airport extends db{

    
    
    function saveairport($airportid, $airportname, $airportcode, $cityid){
        if($this->checkairport($airportid, $airportname, $airportcode, $cityid) > 0){
            return [
                'status' => 'error',
                'message' => 'Airport already exists.'
            ];
        }
        $sql="CALL `sp_saveairport`({$airportid},'{$airportname}','{$airportcode}',{$cityid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Airport saved successfully.'
        ];
    }

    function getairport(){
        $sql="CALL `sp_getairports`()";
        return $this->getJSON($sql);
    }

    function getairportdetails($airportid){
        $sql="CALL `sp_getairportbyid`({$airportid})";
        return $this->getJSON($sql);
    }

    function deleteairport($airportid){
        $sql="CALL `sp_deleteairport`({$airportid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Airport is deleted successfully.'
        ];
    }
}
?>
