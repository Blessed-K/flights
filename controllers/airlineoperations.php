<?php
   require_once('../models/airline.php');

   $airline = new airline();

   if(isset($_POST['saveairline'] )){
    $airlineid = $_POST['airlineid'];
    $airlinename = $_POST['airlinename'];
    $airlinelogo = $_POST['airlinelogo'];

    $response=$airline->saveairline($airlineid, $airlinename, $airlinelogo);
    echo json_encode($response);
   }

   if(isset($_GET['getairline'])){
    $response = $airline->getairline();
    echo $response;
   }

   if(isset($_GET['getairlinedetails'])){
    $airlineid=$_GET['airlineid'];
    echo $airline->getairlinedetails($airlineid);
   }

   if(isset($_POST['deleteairline'])){
    $airlineid=$_POST['airlineid'];
    $response = $airline->deleteairline($airlineid);
    echo json_encode($response);
   }
?>
