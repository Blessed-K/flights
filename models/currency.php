<?php
require_once 'db.php';

class currency extends db {

    
    function savecurrency($currencyid, $codes, $symbol){
        if($this->checkcurrency($currencyid, $codes, $symbol) > 0){
            return [
                'status' => 'error',
                'message' => 'Currency already exists.'
            ];
        }
        $sql="CALL `sp_savecurrency`({$currencyid},'{$codes}','{$symbol}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Currency saved successfully.'
        ];
    }

    function getcurrency(){
        $sql="CALL `sp_getcurrencies`()";
        return $this->getJSON($sql);
    }

    function getcurrencydetails($currencyid){
        $sql="CALL `sp_getcurrencybyid`({$currencyid})";
        return $this->getJSON($sql);
    }

    function deletecurrency($currencyid){
        $sql="CALL `sp_deletecurrency`({$currencyid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Currency deleted successfully.'
        ];
    }
}
?>
