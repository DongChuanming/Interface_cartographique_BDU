/* Création des champs des tables de la base de données unique */

/* Table principale */
CREATE TABLE Basip.table_principale (
    id integer NOT NULL,
	id_basol varchar(500),
	id_basias varchar(500),
	id_bic varchar(500),
    code_reg varchar(500),
    code_dep varchar(500),
    id_localisation varchar(500) NOT NULL,
    id_entreprise integer,
    code_activite varchar(500),
    polluant_sol varchar(500),
	polluant_nappe varchar(500),
	polluant_lieu_indetermine varchar(500),
    periode varchar(500)
);

/* Table département */
CREATE TABLE Basip.departement (
    code_dep varchar(500) NOT NULL,
    nom_dep varchar(500)
);

/* Table entreprise */
CREATE TABLE Basip.entreprises (
    id_entreprise integer NOT NULL,
	siret varchar(500),
    nom varchar(500)
);

/* Table région */
CREATE TABLE Basip.region (
    code_reg varchar(500) NOT NULL,
    nom_reg varchar(500)
);

/* Table activités industrielles */
CREATE TABLE Basip.activites_industrielles (
	code_activite varchar(500) NOT NULL,
	code_naf varchar(500),
	code_icpe varchar(500),
	type_activite varchar(500)
);

/* Table acte administratif */
CREATE TABLE Basip.acte_administratif (
	code_activite varchar(500) NOT NULL,
	type_acte varchar(500)
);

/* Table type accident */
CREATE TABLE Basip.type_accident (
	code_activite varchar(500) NOT NULL,
	type_accident varchar(500)
);

/* Création des champs de la table sandre_etendu */
CREATE TABLE Basip.sandre_etendu (
    code_sandre varchar(500) NOT NULL,
    libelle varchar(500)
);


/* Ajout de clés primaires sur les champs servant d'identifiant dans les différentes tables */
ALTER TABLE ONLY Basip.table_principale
ADD CONSTRAINT table_principale_pkey PRIMARY KEY (id);

ALTER TABLE ONLY Basip.activites_industrielles
ADD CONSTRAINT code_activite_pkey PRIMARY KEY (code_activite);

ALTER TABLE ONLY Basip.acte_administratif
ADD CONSTRAINT acte_administratif_pkey PRIMARY KEY (code_activite);

ALTER TABLE ONLY Basip.type_accident
ADD CONSTRAINT type_accident_pkey PRIMARY KEY (code_activite);

ALTER TABLE ONLY Basip.departement
ADD CONSTRAINT departement_pkey PRIMARY KEY (code_dep);

ALTER TABLE ONLY Basip.entreprises
ADD CONSTRAINT entreprises_pkey PRIMARY KEY (id_entreprise);

ALTER TABLE ONLY Basip.region
ADD CONSTRAINT region_pkey PRIMARY KEY (code_reg);

/* Création de séquences permettant d'incrémenter automatiquement les identifiants des tables */
CREATE SEQUENCE Basip.table_principale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE Basip.entreprises_id_entreprise_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
/* Création des champs pour l'import de Basol */
CREATE TABLE basol (
	id varchar(500),
	region varchar(500),
	departement varchar(500),
	nom_du_site varchar(500),
	commune varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	adresse varchar(500),
	lieudit varchar(500),
	lambert93 varchar(500),
	parcelles varchar(500),
	description varchar(500),
	origine_de_la_decouverte varchar(500),
	type_pollution varchar(500),
	origine_de_la_pollution_ou_des_dechets_ou_des_produits varchar(500),
	activite varchar(500),
	code_activite_icpe varchar(500),
	evenements varchar(500),
	dechet_identifie varchar(500),
	produit_identifie varchar(500),
	polluants_sols varchar(500),
	polluants_nappes varchar(500),
	polluants_sols_ou_nappes varchar(500),
	risques_immediats varchar(500),
	depot_de_la_zone_polluee varchar(500),
	zone_d_implantation varchar(500),
	hydrogeologie_du_site varchar(500),
	utilisation_actuelle_du_site varchar(500),
	impacts_constates varchar(500),
	milieu_surveille varchar(500),
	etat_de_la_surveillance varchar(500),
	info_supplementaire varchar(500),
	restriction_d_usage varchar(500),
	mesures_d_urbanisme_realisees varchar(500),
	mise_en_securite_du_site varchar(500),
	traitement_des_dechets_ou_des_produits varchar(500),
	traitement_des_terres_polluees varchar(500),
	traitement_des_eaux varchar(500)
);

/* Création des champs pour l'import de Basias */
CREATE TABLE basias (
	indice_departemental varchar(500),
	raison_sociale varchar(500),
	nom_usuel varchar(500),
	numeros_autres_identifiants varchar(500),
	organismes_autres_identifiants varchar(500),
	adresse_ancien_format varchar(500),
	numero varchar(500),
	bis_ter varchar(500),
	type_voie varchar(500),
	nom_voie varchar(500),
	commune varchar(500),
	numero_insee varchar(500),
	localisation varchar(500),
	commentaire_localisation varchar(500),
	debut_dactivite varchar(500),
	fin_dactivite varchar(500),
	origine_info_date_activite varchar(500),
	commentaire varchar(500),
	x_wgs84_centroide varchar(500),
	y_wgs84_centroide varchar(500),
	precision_centroide_wgs84 varchar(500),
	x_l2e_adresse varchar(500),
	y_l2e_adresse varchar(500),
	precision_adresse_l2e varchar(500),
	etat_d_occupation_du_site varchar(500),
	codes_naf varchar(500),
	reference_dossier varchar(500),
	debut_de_chaque_code_naf varchar(500),
	fin_de_chaque_code_naf varchar(500),
	origine_date_historique varchar(500),
	regime_ic_pour_chaque_code_naf varchar(500),
	autres_infos_historique_activites varchar(500),
	nom_exploitant varchar(500),
	date_debut_pour_chaque_exploitant varchar(500),
	date_fin_pour_chaque_exploitant varchar(500),
	date_accidents varchar(500),
	type_accidents varchar(500),
	type_pollution varchar(500),
	milieu_touche varchar(500),
	impact_cible varchar(500),
	reference_accidents varchar(500),
	milieu_implantation varchar(500),
	site_reamenage varchar(500),
	type_de_reamenagement varchar(500),
	site_en_friche varchar(500),
	projet_de_reamenagement varchar(500),
	commentaire_utilisation_projet varchar(500)
);

/* Création des champs pour l'import de Bic */
CREATE TABLE bic (
	siret varchar(500),
	nom varchar(500),
	adresse varchar(500),
	coordonnees varchar(500),
	x varchar(500),
	y varchar(500),
	departement varchar(500),
	region varchar(500),
	activite_principale varchar(500),
	service_inspection varchar(500),
	etat_d_activite varchar(500),
	numero_de_service_d_inspection varchar(500),
	date_d_inspection varchar(500),
	regime_en_vigueur_de_letablissement varchar(500),
	priorite_nationale varchar(500),
	statut_seveso varchar(500),
	ied_mtd varchar(500),
	rubrique_ic varchar(500),
	alinea varchar(500),
	date_autorisation varchar(500),
	etat_d_activite_successifs varchar(500),
	regime_autorise varchar(500),
	activite varchar(500),
	volume varchar(500),
	unite varchar(500)
);

/* Création des champs pour l'import de Ban */
CREATE TABLE ban_01 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_03 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_07 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_15 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_26 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_38 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_42 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_43 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_63 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_69 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_73 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

CREATE TABLE ban_74 (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);


/* Import des tables Basol, Basias, Bic et Ban pour les départements de la région Auvergne-Rhone-Alpes */
-- COPY basol FROM 'D:\PIR\basol_ra.csv' HEADER CSV DELIMITER ';';
-- COPY basias FROM 'D:\PIR\Basias_RHA.csv' HEADER CSV DELIMITER ';';
-- COPY bic FROM 'D:\PIR\bic.csv' HEADER CSV DELIMITER ';';
-- COPY ban_01 FROM 'D:\PIR\adresses-01.csv' HEADER CSV DELIMITER ';';
-- COPY ban_03 FROM 'D:\PIR\adresses-03.csv' HEADER CSV DELIMITER ';';
-- COPY ban_07 FROM 'D:\PIR\adresses-07.csv' HEADER CSV DELIMITER ';';
-- COPY ban_15 FROM 'D:\PIR\adresses-15.csv' HEADER CSV DELIMITER ';';
-- COPY ban_26 FROM 'D:\PIR\adresses-26.csv' HEADER CSV DELIMITER ';';
-- COPY ban_38 FROM 'D:\PIR\adresses-38.csv' HEADER CSV DELIMITER ';';
-- COPY ban_42 FROM 'D:\PIR\adresses-42.csv' HEADER CSV DELIMITER ';';
-- COPY ban_43 FROM 'D:\PIR\adresses-43.csv' HEADER CSV DELIMITER ';';
-- COPY ban_63 FROM 'D:\PIR\adresses-63.csv' HEADER CSV DELIMITER ';';
-- COPY ban_69 FROM 'D:\PIR\adresses-69.csv' HEADER CSV DELIMITER ';';
-- COPY ban_73 FROM 'D:\PIR\adresses-73.csv' HEADER CSV DELIMITER ';';
-- COPY ban_74 FROM 'D:\PIR\adresses-74.csv' HEADER CSV DELIMITER ';';

/* Création des champs d'une table unique */
CREATE TABLE ban (
	id varchar(500),
	id_fantoir varchar(500),
	numero varchar(500),
	rep varchar(500),
	nom_voie varchar(500),
	code_postal varchar(500),
	code_insee varchar(500),
	nom_commune varchar(500),
	code_insee_ancienne_commune varchar(500),
	nom_ancienne_commune varchar(500),
	x varchar(500),
	y varchar(500),
	lon varchar(500),
	lat varchar(500),
	type_position varchar(500),
	alias varchar(500),
	nom_ld varchar(500),
	libelle_acheminement varchar(500),
	nom_afnor varchar(500),
	source_position varchar(500),
	source_nom_voie varchar(500),
	certification_commune varchar(500)
);

/* Insertion des valeurs par départements dans une seule table */
INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_01;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_03;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_07;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_15;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_26;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_38;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_42;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_43;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_63;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_69;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_73;

INSERT INTO ban(id, id_fantoir, numero, rep, nom_voie, code_postal, code_insee, nom_commune, code_insee_ancienne_commune, nom_ancienne_commune, x, y, lon, lat, type_position, alias, nom_ld, libelle_acheminement, nom_afnor, source_position, source_nom_voie, certification_commune)
SELECT * FROM ban_74;

/* Insertion des valeurs de la table région */
INSERT INTO region(code_reg, nom_reg)
VALUES 	('FR_ARA', 'Auvergne-Rhône-Alpes'),
		('FR_BFC', 'Bourgogne-Franche-Comté'),
		('FR_BRE', 'Bretagne'),
		('FR_CVL', 'Centre-Val de Loire'),
		('FR_COR', 'Corse'),
		('FR_GES', 'Grand Est'),
		('FR_HDF', 'Hauts-de-France'),
		('FR_IDF', 'Ile-de-France'),
		('FR_NOR', 'Normandie'),
		('FR_NAQ', 'Nouvelle-Aquitaine'),
		('FR_OCC', 'Occitanie'),
		('FR_PDL', 'Pays de la Loire'),
		('FR_PAC', 'Provence-Alpes-Côte d''Azur'),
		('FR_GUA', 'Guadeloupe'),
		('FR_GUF', 'Guyane'),
		('FR_MTQ', 'Martinique'),
		('FR_LRE', 'La Réunion'),
		('FR_MAY', 'Mayotte');

/* Insertion de valeurs de la table département */
INSERT INTO departement(code_dep, nom_dep)
VALUES 	('01', 'Ain'),
		('03', 'Allier'),
		('07', 'Ardèche'),
		('15', 'Cantal'),
		('26', 'Drôme'),
		('38', 'Isère'),
		('42', 'Loire'),
		('43', 'Haute-Loire'),
		('63', 'Puy-de-Dôme'),
		('69', 'Rhône'),
		('73', 'Savoie'),
		('74', 'Haute-Savoie');
 
/* Insertion de valeurs de la table principale */
INSERT INTO table_principale(id, id_basol, id_basias, id_bic, code_reg, code_dep, id_localisation, id_entreprise, code_activite, polluant_sol, polluant_nappe,	polluant_lieu_indetermine, periode)
VALUES 	('1', '69.0044', 'RHA6900462', '', 'FR_ARA', '69', '69387_7035_00016', '1', 'ACTI_C25.61Z', '{1370, 1382, 1084, 7007, 67}', '{1286}', '{}', '{24/05/1963, 31/08/1994}'),
		('2', '38.0036', 'RHA3802003', '9', 'FR_ARA', '38', '38200_ai46ni_00227', '2', 'ACTI_C20.1', '{1387}', '{1387}', '{1387, 1382, 6276, 67}', '{01/01/1965, ?}'),
		('3', '38.0036', 'RHA3802003', '9', 'FR_ARA', '38', '38200_ai46ni_00227', '2', 'ACTI_C24.47Z', '{1387}', '{1387}', '{1387, 1382, 6276, 67}', '{01/01/1968, ?}'),
		('4', '38.0036', 'RHA3802003', '9', 'FR_ARA', '38', '38200_ai46ni_00227', '2', 'ACTI_D35.30Z', '{1387}', '{1387}', '{1387, 1382, 6276, 67}', '{01/01/1970, ?}'),
		('5', '38.0036', 'RHA3802003', '9', 'FR_ARA', '38', '38200_ai46ni_00227', '3', 'ACTI_D35.44Z', '{1387}', '{1387}', '{1387, 1382, 6276, 67}', '{01/01/1979, ?}'),
		('6', '69.0077', 'RHA6900645', '','FR_ARA', '69', '69259_0840_00010', '5', 'TA_1', '{}', '{}', '{}', '{12/03/1947}');

/* Insertion de valeurs de la table activités industrielles */
INSERT INTO activites_industrielles(code_activite, code_naf, code_icpe, type_activite)
VALUES	('ACTI_C25.61Z', 'C25.61Z', '{H, H1, H13, H14}', 'Traitement et revêtement des métaux (traitement de surface, sablage et métallisation, traitement
électrolytique, application de vernis et peintures)'),
		('ACTI_C20.1', 'C20.1', '{D34}', 'Fabrication de produits chimiques de base, de produits azotés et d''engrais, de matières plastiques de base
et de caoutchouc synthétique'),
		('ACTI_C24.47Z', 'C24.47Z', '{}', 'Utilisation de sources radioactives et stockage de substances radioactives (solides, liquides ou gazeuses)'),
		('ACTI_D35.30Z', 'D35.30Z', '{}', 'Production et distribution de vapeur (chaleur) et d''air conditionné'),
		('ACTI_D35.44Z', 'D35.44Z', '{}', 'Transformateur (PCB, pyralène, ...)'),
		('ACTI_V89.03Z', 'V89.03Z', '{D13}', 'Dépôt de liquides inflammables (D.L.I.)');
		
/* Insertion de valeurs de la table acte administratif */
INSERT INTO acte_administratif(code_activite, type_acte)
VALUES	('', ''),
		('', ''),
		('', '');
		
/* Insertion de valeurs de la table type accident */
INSERT INTO type_accident(code_activite, type_accident)
VALUES	('TA_1', 'Incendie');
		
/* Insertion de valeurs de la table entreprise */
INSERT INTO entreprises(id_entreprise, siret, nom)
VALUES	('1', '', 'CHIMICOLOR'),
		('2', '', 'UGINE KUHLMANN'),
		('3', '', 'CEZUS (Cie Européenne du Zirconium UGINE SANDVIK)'),
		('4', '31963279000188', 'ARKEMA');

/* Insertion de valeurs de la table sandre étendu */
INSERT INTO sandre_etendu(code_sandre, libelle)
VALUES	('1387', 'Mercure'),
		('1382', 'Plomb'),
		('1370', 'Aluminium'),
		('1084', 'Cyanure'),
		('7007', 'Hydrocarbures'),
		('1385', 'Sélénium'),
		('62', 'HAP'),
		('1395', 'Molybdène'),
		('1369', 'Arsenic'),
		('1286', 'TCE'),
		('67', 'PCB-PCT'),
		('6276', 'Pesticides');
