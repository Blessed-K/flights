<?php
   require_once('../models/flightclass.php');

   $flightclass = new flightclass();

   if(isset($_POST['saveflightclass'] )){
    $classid = $_POST['classid'];
    $classname = $_POST['classname'];
    $bookingclassid = $_POST['bookingclassid'];
    $flightid = $_POST['flightid'];
    $seatsavailable = $_POST['seatsavailable'];
    $unitprice = $_POST['unitprice'];
    $currencyid = $_POST['currencyid'];

    $response=$flightclass->saveflightclass($classid, $classname, $bookingclassid, $flightid, $seatsavailable, $unitprice, $currencyid);
    echo json_encode($response);
   }

   if(isset($_GET['getflightclass'])){
    $response = $flightclass->getflightclass();
    echo $response;
   }

   if(isset($_GET['getflightclassdetails'])){
    $classid=$_GET['classid'];
    echo $flightclass->getflightclassdetails($classid);
   }

   if(isset($_POST['deleteflightclass'])){
    $classid=$_POST['classid'];
    $response = $flightclass->deleteflightclass($classid);
    echo json_encode($response);
   }
?>
