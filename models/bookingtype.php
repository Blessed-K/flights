<?php
require_once 'db.php';

class bookingtype extends db{

    
   
    function savebookingtype($typeid, $typename){
        if($this->checkbookingtype($typeid, $typename) > 0){
            return [
                'status' => 'error',
                'message' => 'Booking type already exists.'
            ];
        }
        $sql="CALL `sp_savebookingtype`({$typeid},'{$typename}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking type saved successfully.'
        ];
    }

    function getbookingtype(){
        $sql="CALL `sp_getbookingtypes`()";
        return $this->getJSON($sql);
    }

    function getbookingtypedetails($typeid){
        $sql="CALL `sp_getbookingtypebyid`({$typeid})";
        return $this->getJSON($sql);
    }

    function deletebookingtype($typeid){
        $sql="CALL `sp_deletebookingtype`({$typeid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking type deleted successfully.'
        ];
    }
}
?>
