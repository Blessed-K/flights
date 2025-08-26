<?php
require_once 'db.php';

class airline extends db{

    
    
    function saveairline($airlineid, $airlinename, $airlinelogo){
        if($this->checkairline($airlineid, $airlinename, $airlinelogo) > 0){
            return [
                'status' => 'error',
                'message' => 'Airline already exists.'
            ];
        }
        $sql="CALL `sp_saveairline`({$airlineid},'{$airlinename}','{$airlinelogo}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Airline saved successfully.'
        ];
    }

    function getairline(){
        $sql="CALL `sp_getairlines`()";
        return $this->getJSON($sql);
    }

    function getairlinedetails($airlineid){
        $sql="CALL `sp_getairlinebyid`({$airlineid})";
        return $this->getJSON($sql);
    }

    function deleteairline($airlineid){
        $sql="CALL `sp_deleteairline`({$airlineid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Airline is deleted successfully.'
        ];
    }
}
?>
