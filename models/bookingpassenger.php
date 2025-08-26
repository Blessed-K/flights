<?php
require_once 'db.php';

class bookingpassenger extends db{

    
    
    function savebookingpassenger($bookingpassengerid, $bookingclassid, $iddocument, $iddocumentno, $firstname, $middlename, $lastname, $gender, $dateofbirth){
        if($this->checkbookingpassenger($bookingpassengerid, $bookingclassid, $iddocument, $iddocumentno, $firstname, $middlename, $lastname, $gender, $dateofbirth) > 0){
            return [
                'status' => 'error',
                'message' => 'Booking passenger already exists.'
            ];
        }
        $sql="CALL `sp_savebookingpassenger`({$bookingpassengerid},{$bookingclassid},'{$iddocument}','{$iddocumentno}','{$firstname}','{$middlename}','{$lastname}','{$gender}','{$dateofbirth}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking passenger saved successfully.'
        ];
    }

    function getbookingpassenger(){
        $sql="CALL `sp_getbookingpassengers`()";
        return $this->getJSON($sql);
    }

    function getbookingpassengerdetails($bookingpassengerid){
        $sql="CALL `sp_getbookingpassengerbyid`({$bookingpassengerid})";
        return $this->getJSON($sql);
    }

    function deletebookingpassenger($bookingpassengerid){
        $sql="CALL `sp_deletebookingpassenger`({$bookingpassengerid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking passenger is deleted successfully.'
        ];
    }
}
?>
