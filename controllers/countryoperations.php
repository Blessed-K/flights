<?php


header('Content-Type: application/json');

require_once('../models/country.php');
$country = new country();

if(isset($_POST['savecountry'])){
    $countryid = $_POST['countryid'];
    $countryname = $_POST['countryname'];
    $response = $country->savecountry($countryid, $countryname);
    echo json_encode($response);
    exit;
}

if(isset($_GET['getcountries'])){ // <-- Make sure this matches your JS
    $response = $country->getcountry();
    echo $response;
    exit;
}

if(isset($_GET['getcountrydetails'])){
    $countryid = $_GET['countryid'];
    echo $country->getcountrydetails($countryid);
    exit;
}

if(isset($_POST['deletecountry'])){
    $countryid = $_POST['countryid'];
    $response = $country->deletecountry($countryid);
    echo json_encode($response);
    exit;
}
?>