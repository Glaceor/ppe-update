drop database if exists ppe ;
create database ppe ;
use ppe;

create table Unite(
idU int(3) not null,
adresseU varchar(20) not null,
primary key(idU)

);
create table client (
  idclient int(5)not null auto_increment,
  nom varchar(20) ,
  prenom varchar(20),
  tel int(10),
  mail varchar(20),
  adresse varchar(50),
  pseudo varchar(20)not null,
  mdp varchar(20)not null,
  primary key(idclient)
);
create table devis (
  iddevis int(5) not null,
  intitule varchar(20) not null,
  descriptif varchar(20) not null,
  Dated date,
  etat varchar(20)not null,
  idclient int(3)not null,
  primary key(iddevis),
  foreign key  (idclient) references client(idclient)
);
create table produit (
  idProduit int(3) not null auto_increment,
  nomP varchar(20) not null,
  PrixP int(5),
  dateMEV date,
  typeP varchar(20),
  couleur varchar(20),
  nbrP int(5),
  ref varchar(20),
  photo varchar(255),
  primary key(idProduit)
);
create table produit_normal (
  idProduit int(3) not null auto_increment,
  nomP varchar(20) not null,
  PrixP int(5),
  dateMEV date,
  typeP varchar(20),
  couleur varchar(20),
  nbrP int(5)not null,
  ref varchar(20),
  photo varchar(255),
  primary key(idProduit)
);
create table produit_sur_mesure (
  idProduit int(3) not null auto_increment,
  nomP varchar(20) not null,
  PrixP int(5),
  dateMEV date,
  typeP varchar(20),
  couleur varchar(20),
  nbrP int(5)not null,
  ref varchar(20),
  longueur float(5,2),
  largeur float(5,2),
  hauteur float (5,2),
  texture varchar(20),
  primary key(idProduit)
);
create table commande(
  numc int(3) not null,
  datecom date,
  datelivraison date,
  etatcom varchar(20),
  idProduit int(3),
  primary key(numc),
  foreign key (idProduit) references produit(idproduit)
);
create table intervention (
  numI int(5) not null  auto_increment,
  datei date,
  duree varchar(20),
  TH varchar(20),
  action enum ("validee", "en attente", "refusee"),
  primary key (numI)
);
create table factures(
  numF int(5) not null auto_increment,
  dattef date ,
  dater date,
  EtatF varchar(20),
  montantHT float (5,2),
  TVA float (3,2),
  TTC float (3,2),
  idclient int(5),
  numI int(5),
  Numc int(5),
  primary key(numF),
  foreign key (idclient) references client(idclient),
  foreign key (numI) references intervention(numI),
  foreign key (Numc) references commande(Numc)
);
create table technicien (
  idt int(5)not null auto_increment,
  nomT varchar(20) ,
  prenomT varchar(20),
  tel int(12),
  adresse varchar(50),
  qualification varchar(100),
  pseudo varchar(20)not null,
  mdp varchar(20)not null,
  primary key(idt)
);
create table realiser (
  idProduit int(3) not null,
  idU int(3) not null,
  primary key(idU,idProduit)
);
create table contact (
  idcontact int(5) not null auto_increment,
  nom varchar(30) not null,
  mail varchar(255) not null,
  objet varchar(25) not null,
  message varchar(255) not null,
  primary key (idcontact)
);


insert into technicien values(null,"thierry","patry","0699887744","7 allée de la colline","technicien admin","titi","azerty");
  insert into client values(null,"rezzoug","yanis","661648090","yrezzzoug@gmail.com","61 Avenue de Verdun","killua","aze");

insert into produit values(null,"Porte Bois marron","120","2019/10/01","bois","marron","50","A1","p1.png");
    insert into produit values(null,"Porte marron clair","115","2019/11/01","bois","marron chene","50","A2","p2.png");
        insert into produit values(null,"Fenetre brico","130","2019/12/15","sapin","marron","100","B1","p3.png");
          insert into produit values(null,"Fenetre ODE","250","2020/01/05","PVC","blanc","100","B2","p4.png");
