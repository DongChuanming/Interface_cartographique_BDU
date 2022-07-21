<?php
include "connect.php";
// Autorisation de récupérer les donnée de l'API dans un fichier au format JSON.
header("Access-Control-Allow-Origin: *");
header('content-type:application/json');

// Création d'un tableau pour les résultats
// Glossaire PHP insertInto
$tosql="INSERT INTO site_pollué (id, nom_site, region, commune, dpt, adresse, activite, descrip, nom_classe, type_pollu, origine_pollution) VALUE(:id, :nom_site, :region, :dpt, :adresse, :activite, :descrip, :nom_classe, :type_pollu, :origine_pollution)";
$req = $link -> prepare($tosql);
$req -> execute(array(":id" => $_GET["id"], ":nom_site" => $_GET["nom_site"], ":region" => $_GET["region"], ":commune" => $_GET["commune"], ":dpt" => $_GET["dpt"], ":adresse" => $_GET["adresse"], ":activite" => $_GET["activite"], ":descrip" => $_GET["descrip"], ":nom_classe" => $_GET["nom_classe"], ":type_pollu" => $_GET["type_pollu"], ":origine_pollution" => $_GET["origine_pollution"]));


// Commande permettant l'écriture en json dans un fichier
echo("{result:true}");

?>
