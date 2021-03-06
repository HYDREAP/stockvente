-- -----------------------------------------------------------------------------
--             G�n�ration d'une base de donn�es pour
--                           PostgreSQL
--                        (6/5/2013 20:34:31)
-- -----------------------------------------------------------------------------
--      Nom de la base : stockvente
--      Projet : 
--      Auteur : IQ
--      Date de derni�re modification : 6/5/2013 20:31:28
-- -----------------------------------------------------------------------------

drop database stockvente;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE stockvente;

-- -----------------------------------------------------------------------------
--       TABLE : FACTURE
-- -----------------------------------------------------------------------------

CREATE TABLE FACTURE
   (
    ID_FACTURE char(32) NOT NULL  ,
    ID_USER char(32) NOT NULL  ,
    ID_CLIENT char(32) NOT NULL  ,
    DATE_FACTURE date NULL  ,
    MONTANT_FACTURE money NULL  ,
    MODE_PAIEMENT_FACTURE varchar(128) NULL  
,   CONSTRAINT PK_FACTURE PRIMARY KEY (ID_FACTURE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE FACTURE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_FACTURE_UTILISATEUR
     ON FACTURE (ID_USER)
    ;

CREATE  INDEX I_FK_FACTURE_CLIENT
     ON FACTURE (ID_CLIENT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : FOURNISSEUR
-- -----------------------------------------------------------------------------

CREATE TABLE FOURNISSEUR
   (
    ID_FOURNISSEUR char(32) NOT NULL  ,
    NOM_FOURNISSEUR varchar(128) NULL  ,
    COORDONNEES varchar(128) NULL  
,   CONSTRAINT PK_FOURNISSEUR PRIMARY KEY (ID_FOURNISSEUR)
   );

-- -----------------------------------------------------------------------------
--       TABLE : UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE TABLE UTILISATEUR
   (
    ID_USER char(32) NOT NULL  ,
    NOM_USER varchar(128) NULL  ,
    PRENOM_USER varchar(128) NULL  ,
    FONCTION_USER varchar(128) NULL  ,
    LOGIN_USER varchar(128) NULL  ,
    MDP_USER varchar(128) NULL  
,   CONSTRAINT PK_UTILISATEUR PRIMARY KEY (ID_USER)
   );

-- -----------------------------------------------------------------------------
--       TABLE : PRIXPRODUIT
-- -----------------------------------------------------------------------------

CREATE TABLE PRIXPRODUIT
   (
    ID_PRIX char(32) NOT NULL  ,
    ID_PRODUIT char(32) NOT NULL  ,
    DEBUT_VALIDITE_PRIX date NULL  ,
    FIN_VALIDITE_PRIX date NULL  ,
    VALEUR_PRIX money NULL  
,   CONSTRAINT PK_PRIXPRODUIT PRIMARY KEY (ID_PRIX)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PRIXPRODUIT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PRIXPRODUIT_PRODUIT
     ON PRIXPRODUIT (ID_PRODUIT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE CLIENT
   (
    ID_CLIENT char(32) NOT NULL  ,
    NOM_CLIENT varchar(128) NULL  ,
    PRENOM_CLIENT varchar(128) NULL  ,
    ADRESSE_CLIENT varchar(128) NULL  ,
    CP_CLIENT int8 NULL  ,
    VILLE_CLIENT varchar(128) NULL  ,
    TEL_CLIENT varchar(128) NULL  ,
    EMAIL_CLIENT varchar(128) NULL  
,   CONSTRAINT PK_CLIENT PRIMARY KEY (ID_CLIENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : PRODUIT
-- -----------------------------------------------------------------------------

CREATE TABLE PRODUIT
   (
    ID_PRODUIT char(32) NOT NULL  ,
    NOM_PRODUIT varchar(128) NULL  ,
    GARANTIE_PRODUIT char(32) NULL  
,   CONSTRAINT PK_PRODUIT PRIMARY KEY (ID_PRODUIT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : STOCKPRODUIT
-- -----------------------------------------------------------------------------

CREATE TABLE STOCKPRODUIT
   (
    ID_STOCK_PRODUIT char(32) NOT NULL  ,
    ID_FOURNISSEUR char(32) NOT NULL  ,
    ID_USER char(32) NOT NULL  ,
    ID_PRODUIT char(32) NOT NULL  ,
    QTE_PRODUIT_STOCKE char(32) NULL  
,   CONSTRAINT PK_STOCKPRODUIT PRIMARY KEY (ID_STOCK_PRODUIT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE STOCKPRODUIT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_STOCKPRODUIT_FOURNISSEUR
     ON STOCKPRODUIT (ID_FOURNISSEUR)
    ;

CREATE  INDEX I_FK_STOCKPRODUIT_UTILISATEUR
     ON STOCKPRODUIT (ID_USER)
    ;

CREATE  INDEX I_FK_STOCKPRODUIT_PRODUIT
     ON STOCKPRODUIT (ID_PRODUIT)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CONTIENT
-- -----------------------------------------------------------------------------

CREATE TABLE CONTIENT
   (
    ID_FACTURE char(32) NOT NULL  ,
    ID_PRODUIT char(32) NOT NULL  ,
    QTE_PRODUIT_FACTUREE char(32) NULL  
,   CONSTRAINT PK_CONTIENT PRIMARY KEY (ID_FACTURE, ID_PRODUIT)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CONTIENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONTIENT_FACTURE
     ON CONTIENT (ID_FACTURE)
    ;

CREATE  INDEX I_FK_CONTIENT_PRODUIT
     ON CONTIENT (ID_PRODUIT)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE FACTURE ADD 
     CONSTRAINT FK_FACTURE_UTILISATEUR
          FOREIGN KEY (ID_USER)
               REFERENCES UTILISATEUR (ID_USER);

ALTER TABLE FACTURE ADD 
     CONSTRAINT FK_FACTURE_CLIENT
          FOREIGN KEY (ID_CLIENT)
               REFERENCES CLIENT (ID_CLIENT);

ALTER TABLE PRIXPRODUIT ADD 
     CONSTRAINT FK_PRIXPRODUIT_PRODUIT
          FOREIGN KEY (ID_PRODUIT)
               REFERENCES PRODUIT (ID_PRODUIT);

ALTER TABLE STOCKPRODUIT ADD 
     CONSTRAINT FK_STOCKPRODUIT_FOURNISSEUR
          FOREIGN KEY (ID_FOURNISSEUR)
               REFERENCES FOURNISSEUR (ID_FOURNISSEUR);

ALTER TABLE STOCKPRODUIT ADD 
     CONSTRAINT FK_STOCKPRODUIT_UTILISATEUR
          FOREIGN KEY (ID_USER)
               REFERENCES UTILISATEUR (ID_USER);

ALTER TABLE STOCKPRODUIT ADD 
     CONSTRAINT FK_STOCKPRODUIT_PRODUIT
          FOREIGN KEY (ID_PRODUIT)
               REFERENCES PRODUIT (ID_PRODUIT);

ALTER TABLE CONTIENT ADD 
     CONSTRAINT FK_CONTIENT_FACTURE
          FOREIGN KEY (ID_FACTURE)
               REFERENCES FACTURE (ID_FACTURE);

ALTER TABLE CONTIENT ADD 
     CONSTRAINT FK_CONTIENT_PRODUIT
          FOREIGN KEY (ID_PRODUIT)
               REFERENCES PRODUIT (ID_PRODUIT);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------