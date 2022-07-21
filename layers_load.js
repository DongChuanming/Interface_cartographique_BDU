// POUR LE CHARGEMENT DES OBJETS CONTENUS DANS LE FICHIER GEOJSON
//sélectionner les objets de la table
var loadedData = {}
var dptParRegion = { "": {} }
var communeParRegion = { "": {} }
var communeParDpt = { "": {} }

document.addEventListener('DOMContentLoaded', () => {
    const regions = document.querySelector('#filtre-region');
    const departements = document.getElementById('filtre-dpt');
    const communes = document.getElementById('filtreCommune');
    //
    const pollution = document.getElementById('filtrePollution');
    const entreprise = document.getElementById('filtreEntreprise');
    // console.log(communes);
    var descriptions = {}
    fetch('./data/BASOL.json').then(Response => {
        return Response.json();
    }).then(data => {
        data.sites.forEach(function(e) {
            descriptions[e.num_basol] = e.caracterisation.description;
        });
        // console.log(descriptions);

        // on appelle le fichier geojson contenant les données
        fetch('./data/basol_pollution.geojson').then(Response => {
            return Response.json();
        }).then(data => {


            // variables de sortie
            let outputregion = "";
            let outputdepartement = "";
            let outputcommune = "";
            //
            let outputpollution = "";
            let outputentreprise = "";

            // on initiale des listes vides
            var ensRegion = {};
            var ensDepartement = {};
            var ensCommune = {};
            //
            var ensPollution = {};
            var ensEntreprise = {};

            //selectionne les éléments du geojson
            element = data.features

            //récupére les regions/departement/commune et les ajoute dans des listes
            element.forEach(element => {
                ensRegion[element.properties.region] = 0
                ensDepartement[element.properties.dpt] = 0
                ensCommune[element.properties.commune] = 0

                //
                // ensPollution[element.properties.nom_classe] = 0
                //console.log(element.properties.nom_classe);
                if (element.properties.nom_classe != "Non renseigné") {
                    element.properties.nom_classe.forEach(function(e) {
                        ensPollution[e] = 0
                    })
                }
                ensEntreprise[element.properties.nom_site] = 0
                    //Chargement du département dans la bonne région
                    //Ajout de la région si elle n'est pas dans dptParRegion
                if (!(element.properties.region in dptParRegion)) {
                    dptParRegion[element.properties.region] = {}
                }
                //Mise à jour de la liste de départements 
                dptParRegion[element.properties.region][element.properties.dpt] = 0
                dptParRegion[""][element.properties.dpt] = 0

                if (!(element.properties.dpt in communeParDpt)) {
                    communeParDpt[element.properties.dpt] = {}
                }
                //Mise à jour de la liste de départements 
                communeParDpt[element.properties.dpt][element.properties.commune] = 0
                communeParDpt[""][element.properties.commune] = 0

                //Chargement de la description complète au lieu de l'abrégée
                element.properties.descrip = descriptions[element.properties.id]
                    // console.log(element.properties.id)
                    // console.log(element.properties.descrip);
            });

            // tri par ordre alphabétique et nombre
            var listRegion = Object.keys(ensRegion).sort();
            var listDepartement = Object.keys(ensDepartement).sort();
            var listCommune = Object.keys(ensCommune).sort();
            var listPollution = Object.keys(ensPollution);
            var listentreprise = Object.keys(ensEntreprise).sort();

            //Rend les élément unique au sein des liste et les rajoute dans l'html, pour les régions
            listRegion.forEach(el => {
                outputregion += "<option>" + el + "</option>";
            });
            // pour les départements
            listDepartement.forEach(el => {
                outputdepartement += "<option>" + el + "</option>";
            });
            // pour les communes
            listCommune.forEach(el => {
                outputcommune += "<option>" + el + "</option>";
            });
            // pour les types de pollutions
            listPollution.forEach(el => {
                outputpollution += "<option>" + el + "</option>";
            });
            // pour le nom des entreprises
            listentreprise.forEach(el => {
                outputentreprise += "<option>" + el + "</option>";
            });

            //element.forEach(element => element.push(element.properties.commune));
            //appel des objets dans la liste déroulante
            // on envoie dans l'html les listes de données distinctes dans les menus déroulants
            // console.log(regions.innerHTML)
            regions.innerHTML += outputregion;
            departements.innerHTML += outputdepartement;
            communes.innerHTML += outputcommune;
            //
            pollution.innerHTML += outputpollution;
            entreprise.innerHTML += outputentreprise;

            loadedData = { features: element }

        }).catch(err => {
            console.log(err);
        })
    })
});