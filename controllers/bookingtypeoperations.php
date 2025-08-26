<?php
   require_once('../models/bookingtype.php');

   $bookingtype = new bookingtype();

   if(isset($_POST['savebookingtype'])){
    $typeid = $_POST['typeid'];
    $typename = $_POST['typename'];

    $response = $bookingtype->savebookingtype($typeid, $typename);
    echo json_encode($response);
   }

   if(isset($_GET['getbookingtype'])){
    $response = $bookingtype->getbookingtype();
    echo $response;
   }

   if(isset($_GET['getbookingtypedetails'])){
    $typeid = $_GET['typeid'];
    echo $bookingtype->getbookingtypedetails($typeid);
   }

   if(isset($_POST['deletebookingtype'])){
    $typeid = $_POST['typeid'];
    $response = $bookingtype->deletebookingtype($typeid);
    echo json_encode($response);
   }
?>
