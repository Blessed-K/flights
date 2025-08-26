<?php
require_once 'db.php';

class paymentmethod extends db {

    

    function savePaymentMethod($paymentmethodid, $methodname){
        if($this->checkPaymentMethod($paymentmethodid, $methodname) > 0){
            return [
                'status' => 'error',
                'message' => 'Payment method already exists.'
            ];
        }
        $sql = "CALL `sp_savepaymentmethod`({$paymentmethodid},'{$methodname}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Payment method saved successfully.'
        ];
    }

    function getPaymentMethods(){
        $sql = "CALL `sp_getpaymentmethods`()";
        return $this->getJSON($sql);
    }

    function getPaymentMethodDetails($paymentmethodid){
        $sql = "CALL `sp_getpaymentmethodbyid`({$paymentmethodid})";
        return $this->getJSON($sql);
    }

    function deletePaymentMethod($paymentmethodid){
        $sql = "CALL `sp_deletepaymentmethod`({$paymentmethodid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Payment method deleted successfully.'
        ];
    }
}
?>
