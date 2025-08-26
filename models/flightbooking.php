<?php
require_once 'db.php';

class flightbooking extends db{
    
    
    function saveflightbooking($bookingid, $flightid, $bookingdate, $bookingtypeid, $paymentmethodid, $currencyid){
        if($this->checkflightbooking($bookingid, $flightid, $bookingdate, $bookingtypeid, $paymentmethodid, $currencyid) > 0){
            return [
                'status' => 'error',
                'message' => 'Flight booking already exists.'
            ];
        }
        $sql="CALL `sp_saveflightbooking`({$bookingid},{$flightid},'{$bookingdate}',{$bookingtypeid},{$paymentmethodid},{$currencyid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking saved successfully.'
        ];
    }

    function getflightbooking(){
        $sql="CALL `sp_getflightbookings`()";
        return $this->getJSON($sql);
    }

    function getflightbookingdetails($bookingid){
        $sql="CALL `sp_getflightbookingbyid`({$bookingid})";
        return $this->getJSON($sql);
    }

    function deleteflightbooking($bookingid){
        $sql="CALL `sp_deleteflightbooking`({$bookingid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking is deleted successfully.'
        ];
    }
}
?>
