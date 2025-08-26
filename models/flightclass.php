<?php
require_once 'db.php';

class flightclass extends db{

    
    
    function saveflightclass($classid, $classname, $bookingclassid, $flightid, $seatsavailable, $unitprice, $currencyid){
        if($this->checkflightclass($classid, $classname, $bookingclassid, $flightid, $seatsavailable, $unitprice, $currencyid) > 0){
            return [
                'status' => 'error',
                'message' => 'Flight class already exists.'
            ];
        }
        $sql="CALL `sp_saveflightclass`({$classid},'{$classname}',{$bookingclassid},{$flightid},{$seatsavailable},{$unitprice},{$currencyid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight class saved successfully.'
        ];
    }

    function getflightclass(){
        $sql="CALL `sp_getflightclasses`()";
        return $this->getJSON($sql);
    }

    function getflightclassdetails($classid){
        $sql="CALL `sp_getflightclassbyid`({$classid})";
        return $this->getJSON($sql);
    }

    function deleteflightclass($classid){
        $sql="CALL `sp_deleteflightclass`({$classid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight class is deleted successfully.'
        ];
    }
}
?>
