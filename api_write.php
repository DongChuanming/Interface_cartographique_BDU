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
$tosql="INSERT INTO site_pollué (id, nom_site, region, commune, dpt, adresse, activite, descrip, nom_classe, type_pollu, origine_pollution) VALUE(:id, :nom_site, :region, :commune, :dpt, :adresse, :activite, :descrip, :nom_classe, :type_pollu, :origine_pollution)";
$req = $link -> prepare($tosql);
$req -> execute(array(":id" => $_POST["id"], ":nom_site" => $_POST["nom_site"], ":region" => $_POST["region"], ":commune" => $_POST["commune"], ":dpt" => $_POST["dpt"], ":adresse" => $_POST["adresse"], ":activite" => $_POST["activite"], ":descrip" => $_POST["descrip"], ":nom_classe" => $_POST["nom_classe"], ":type_pollu" => $_POST["type_pollu"], ":origine_pollution" => $_POST["origine_pollution"]));


// Commande permettant l'écriture en json dans un fichier
echo("{result:true}");
?>
