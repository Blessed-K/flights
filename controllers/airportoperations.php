<?php
   require_once('../models/airport.php');

   $airport = new airport();

   if(isset($_POST['saveairport'] )){
    $airportid = $_POST['airportid'];
    $airportname = $_POST['airportname'];
    $airportcode = $_POST['airportcode'];
    $cityid = $_POST['cityid'];

    $response=$airport->saveairport($airportid, $airportname, $airportcode, $cityid);
    echo json_encode($response);
   }

   if(isset($_GET['getairport'])){
    $response = $airport->getairport();
    echo $response;
   }

   if(isset($_GET['getairportdetails'])){
    $airportid=$_GET['airportid'];
    echo $airport->getairportdetails($airportid);
   }

   if(isset($_POST['deleteairport'])){
    $airportid=$_POST['airportid'];
    $response = $airport->deleteairport($airportid);
    echo json_encode($response);
   }
   
?>
