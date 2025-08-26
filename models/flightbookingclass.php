<?php
require_once 'db.php';

class flightbookingclass extends db{

    
    
    function saveflightbookingclass($bookingclassid, $bookingid, $classid, $seatcount, $unitprice, $currencyid){
        if($this->checkflightbookingclass($bookingclassid, $bookingid, $classid, $seatcount, $unitprice, $currencyid) > 0){
            return [
                'status' => 'error',
                'message' => 'Flight booking class already exists.'
            ];
        }
        $sql="CALL `sp_saveflightbookingclass`({$bookingclassid},{$bookingid},{$classid},{$seatcount},{$unitprice},{$currencyid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking class saved successfully.'
        ];
    }

    function getflightbookingclass(){
        $sql="CALL `sp_getflightbookingclasses`()";
        return $this->getJSON($sql);
    }

    function getflightbookingclassdetails($bookingclassid){
        $sql="CALL `sp_getflightbookingclassbyid`({$bookingclassid})";
        return $this->getJSON($sql);
    }

    function deleteflightbookingclass($bookingclassid){
        $sql="CALL `sp_deleteflightbookingclass`({$bookingclassid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking class is deleted successfully.'
        ];
    }
}
?>
