<?php
   require_once('../models/flightbooking.php');

   $flightbooking = new flightbooking();

   if(isset($_POST['saveflightbooking'] )){
    $bookingid = $_POST['bookingid'];
    $flightid = $_POST['flightid'];
    $bookingdate = $_POST['bookingdate'];
    $bookingtypeid = $_POST['bookingtypeid'];
    $paymentmethodid = $_POST['paymentmethodid'];
    $currencyid = $_POST['currencyid'];

    $response=$flightbooking->saveflightbooking($bookingid, $flightid, $bookingdate, $bookingtypeid, $paymentmethodid, $currencyid);
    echo json_encode($response);
   }

   if(isset($_GET['getflightbooking'])){
    $response = $flightbooking->getflightbooking();
    echo $response;
   }

   if(isset($_GET['getflightbookingdetails'])){
    $bookingid=$_GET['bookingid'];
    echo $flightbooking->getflightbookingdetails($bookingid);
   }

   if(isset($_POST['deleteflightbooking'])){
    $bookingid=$_POST['bookingid'];
    $response = $flightbooking->deleteflightbooking($bookingid);
    echo json_encode($response);
   }
?>
