<?php
require_once('../models/paymentmethod.php');

$payment = new paymentmethod();

if(isset($_POST['savePaymentMethod'])){
    $paymentmethodid = $_POST['paymentmethodid'];
    $methodname = $_POST['methodname'];

    $response = $payment->savePaymentMethod($paymentmethodid, $methodname);
    echo json_encode($response);
}

if(isset($_GET['getPaymentMethods'])){
    $response = $payment->getPaymentMethods();
    echo $response;
}

if(isset($_GET['getPaymentMethodDetails'])){
    $paymentmethodid = $_GET['paymentmethodid'];
    echo $payment->getPaymentMethodDetails($paymentmethodid);
}

if(isset($_POST['deletePaymentMethod'])){
    $paymentmethodid = $_POST['paymentmethodid'];
    $response = $payment->deletePaymentMethod($paymentmethodid);
    echo json_encode($response);
}
?>
