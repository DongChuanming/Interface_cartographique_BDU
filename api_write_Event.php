<?php
include "connect.php";
// Autorisation de récupérer les donnée de l'API dans un fichier au format JSON.
header("Access-Control-Allow-Origin: *");
header('content-type:application/json');


$_POST=(json_decode(file_get_contents("php://input"),true));
var_dump($_POST);
var_dump($_POST["id"]);
// Création d'un tableau pour les résultats
// Glossaire PHP insertInto
$tosqlEvent="INSERT INTO Event (Year, Month, Day, Time, End Year, End Month, End Day, End Time, Agent, Event, Target, Complement, Agent2 ,Status, Target2, Complement2, Agent3, Event3, Target3) VALUE(:Year, :Month, :Day, :Time, :End Year, :End Month, :End Day, :End Time, :Agent, :Event, :Target, :Complement, :Agent2, :Status, :Target2, :Complement2, :Agent3, :Event3, :Target3)";
$reqEvent = $link -> prepare($tosqlEvent);
$reqEvent -> execute(array(":Year" => $_POST["Year"], ":Month" => $_POST["Month"], ":Day" => $_POST["Day"], ":Time" => $_POST["Time"], ":End Year" => $_POST["End Year"], ":End Month" => $_POST["End Month"], ":End Day" => $_POST["End Day"], "End Time" => $_POST["End Time"], ":Agent" => $_POST["Agent"], ":Status" => $_POST["Status"], ":Target2" => $_POST["Target2"], ":Complement2" => $_POST["Complement2"], ":Agent3" => $_POST["Agent3"], ":Event3" => $_POST["Event3"], ":Target3" => $_POST["Target3"]));


// Commande permettant l'écriture en json dans un fichier
echo("{result:true}");


?>
