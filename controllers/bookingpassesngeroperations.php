<?php
   require_once('../models/bookingpassenger.php');

   $bookingpassenger = new bookingpassenger();

   if(isset($_POST['savebookingpassenger'] )){
    $bookingpassengerid = $_POST['bookingpassengerid'];
    $bookingclassid = $_POST['bookingclassid'];
    $iddocument = $_POST['iddocument'];
    $iddocumentno = $_POST['iddocumentno'];
    $firstname = $_POST['firstname'];
    $middlename = $_POST['middlename'];
    $lastname = $_POST['lastname'];
    $gender = $_POST['gender'];
    $dateofbirth = $_POST['dateofbirth'];

    $response=$bookingpassenger->savebookingpassenger($bookingpassengerid, $bookingclassid, $iddocument, $iddocumentno, $firstname, $middlename, $lastname, $gender, $dateofbirth);
    echo json_encode($response);
   }

   if(isset($_GET['getbookingpassenger'])){
    $response = $bookingpassenger->getbookingpassenger();
    echo $response;
   }

   if(isset($_GET['getbookingpassengerdetails'])){
    $bookingpassengerid=$_GET['bookingpassengerid'];
    echo $bookingpassenger->getbookingpassengerdetails($bookingpassengerid);
   }

   if(isset($_POST['deletebookingpassenger'])){
    $bookingpassengerid=$_POST['bookingpassengerid'];
    $response = $bookingpassenger->deletebookingpassenger($bookingpassengerid);
    echo json_encode($response);
   }
?>
