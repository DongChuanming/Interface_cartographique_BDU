<?php
include "connect.php";
// Autorisation de récupérer les donnée de l'API dans un fichier au format JSON.
header("Access-Control-Allow-Origin: *");
header('content-type:application/json');

// Création d'un tableau pour les résultats
// Glossaire PHP insertInto
$result = array("id" => $id, "urlAffiche" => $urlAffiche);

//Récupération de toutes les données dans une variable alldata
$alldata = $req->fetchall(PDO::FETCH_GROUP);

// Commande permettant l'écriture en json dans un fichier
echo(json_encode($alldata));

?>
