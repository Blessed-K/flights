<?php
   require_once('../models/flight.php');

   $flight = new flight();

   if(isset($_POST['saveflight'] )){
    $flightid = $_POST['flightid'];
    $flightnumber = $_POST['flightnumber'];
    $airlineid = $_POST['airlineid'];
    $departureairportid = $_POST['departureairportid'];
    $arrivalairportid = $_POST['arrivalairportid'];
    $departuretime = $_POST['departuretime'];
    $arrivaltime = $_POST['arrivaltime'];

    $response=$flight->saveflight($flightid, $flightnumber, $airlineid, $departureairportid, $arrivalairportid, $departuretime, $arrivaltime);
    echo json_encode($response);
   }

   if(isset($_GET['getflight'])){
    $response = $flight->getflight();
    echo $response;
   }

   if(isset($_GET['getflightdetails'])){
    $flightid=$_GET['flightid'];
    echo $flight->getflightdetails($flightid);
   }

   if(isset($_POST['deleteflight'])){
    $flightid=$_POST['flightid'];
    $response = $flight->deleteflight($flightid);
    echo json_encode($response);
   }
?>
