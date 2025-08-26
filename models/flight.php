<?php
require_once 'db.php';

class flight extends db{

    
    
    function saveflight($flightid, $flightnumber, $airlineid, $departureairportid, $arrivalairportid, $departuretime, $arrivaltime){
        if($this->checkflight($flightid, $flightnumber, $airlineid, $departureairportid, $arrivalairportid, $departuretime, $arrivaltime) > 0){
            return [
                'status' => 'error',
                'message' => 'Flight already exists.'
            ];
        }
        $sql="CALL `sp_saveflight`({$flightid},'{$flightnumber}',{$airlineid},{$departureairportid},{$arrivalairportid},'{$departuretime}','{$arrivaltime}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight saved successfully.'
        ];
    }

    function getflight(){
        $sql="CALL `sp_getflights`()";
        return $this->getJSON($sql);
    }

    function getflightdetails($flightid){
        $sql="CALL `sp_getflightbyid`({$flightid})";
        return $this->getJSON($sql);
    }

    function deleteflight($flightid){
        $sql="CALL `sp_deleteflight`({$flightid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight is deleted successfully.'
        ];
    }
}
?>
