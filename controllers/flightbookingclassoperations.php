<?php
   require_once('../models/flightbookingclass.php');

   $flightbookingclass = new flightbookingclass();

   if(isset($_POST['saveflightbookingclass'] )){
    $bookingclassid = $_POST['bookingclassid'];
    $bookingid = $_POST['bookingid'];
    $classid = $_POST['classid'];
    $seatcount = $_POST['seatcount'];
    $unitprice = $_POST['unitprice'];
    $currencyid = $_POST['currencyid'];

    $response=$flightbookingclass->saveflightbookingclass($bookingclassid, $bookingid, $classid, $seatcount, $unitprice, $currencyid);
    echo json_encode($response);
   }

   if(isset($_GET['getflightbookingclass'])){
    $response = $flightbookingclass->getflightbookingclass();
    echo $response;
   }

   if(isset($_GET['getflightbookingclassdetails'])){
    $bookingclassid=$_GET['bookingclassid'];
    echo $flightbookingclass->getflightbookingclassdetails($bookingclassid);
   }

   if(isset($_POST['deleteflightbookingclass'])){
    $bookingclassid=$_POST['bookingclassid'];
    $response = $flightbookingclass->deleteflightbookingclass($bookingclassid);
    echo json_encode($response);
   }
?>
