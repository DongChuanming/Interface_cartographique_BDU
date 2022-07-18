// POUR LE CHARGEMENT DES OBJETS CONTENUS DANS LE FICHIER GEOJSON
//sélectionner les objets de la table
var loadedData = {}
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
        console.log(descriptions);

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
            const listRegion = [];
            const listdepartement = [];
            const listcommune = [];
            //
            const listpollution = [];
            const listentreprise = [];

            //selectionne les éléments du geojson
            element = data.features

            //récupére les regions/departement/commune et les ajoute dans des listes
            element.forEach(element => {
                listRegion.push(`<option>${element.properties.region}</option>`);
                listdepartement.push(`<option>${element.properties.dpt}</option>`);
                listcommune.push(`<option>${element.properties.commune}</option>`);

                //
                listpollution.push(`<option>${element.properties.nom_classe}</option>`);
                listentreprise.push(`<option>${element.properties.nom_site}</option>`);

                console.log(element.properties.descrip);
                element.properties.descrip = descriptions[element.properties.id]
                console.log(element.properties.id)
                console.log(element.properties.descrip);
            });

            // tri par ordre alphabétique et nombre
            listRegion.sort();
            listdepartement.sort();
            listcommune.sort();
            listpollution.sort();
            listentreprise.sort();

            //Rend les élément unique au sein des liste et les rajoute dans l'html, pour les régions
            const uniqueRegion = [...new Set(listRegion)];
            uniqueRegion.forEach(el => {
                outputregion += el;
            });
            // pour les départements
            const uniquedepartement = [...new Set(listdepartement)];
            uniquedepartement.forEach(el => {
                outputdepartement += el;
            });
            // pour les communes
            const uniquecommune = [...new Set(listcommune)];
            uniquecommune.forEach(el => {
                outputcommune += el;
            });
            // pour les types de pollutions
            const uniquepollution = [...new Set(listpollution)];
            uniquepollution.forEach(el => {
                outputpollution += el;
            });
            // pour le nom des entreprises
            const uniqueEntreprise = [...new Set(listentreprise)];
            uniqueEntreprise.forEach(el => {
                outputentreprise += el;
            });

            //element.forEach(element => element.push(element.properties.commune));
            //appel des objets dans la liste déroulante
            // on envoie dans l'html les listes de données distinctes dans les menus déroulants
            console.log(regions.innerHTML)
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