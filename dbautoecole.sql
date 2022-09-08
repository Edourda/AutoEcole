create database dbautoecole charset=utf8 collate=utf8_general_ci;
use dbautoecole;

create table Vehicule(
    idVehicule int unsigned auto_increment primary key not null,
    immatriculation varchar(100) unique not null,
    marque varchar(100),
    couleur varchar(150),
    photo varchar(100),
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;

create table Permis(
    Id int unsigned auto_increment primary key not null,
    type varchar(200) unique not null,
    description varchar(1000),
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;

create table Lecon(
    Id int unsigned auto_increment primary key not null,
    titre varchar(200) unique not null,
    contenu varchar(1000),
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;

create table Moniteur(
    Id int unsigned auto_increment primary key not null,
    matricule varchar(200) unique not null,
    nom varchar(100) not null,
    tel varchar(100) not null,
    photo varchar(100) not null,
    adresse varchar(100) not null,
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;



create table Eleve(
    Id int unsigned auto_increment primary key not null,
    matricule varchar(200) unique not null,
    nom varchar(100) not null,
    adresse varchar(100) not null,
    dateN date not null,
    tel varchar(100) not null,
    photo varchar(100) not null,
    dateI date not null,
    created timestamp not null,
    vehicule int unsigned not null,
    permis int unsigned not null,
    constraint fk_vehicule foreign key(vehicule) references Vehicule(IdVehicule) on delete cascade on update cascade,
    constraint fk_permis foreign key(permis) references Permis(Id) on delete cascade on update cascade
)engine=innodb charset=utf8 collate=utf8_general_ci;

create table PaiementEleve(
    Id int unsigned auto_increment primary key not null,
    motif varchar(200) not null,
    montant float not null,
    dateP date not null,
    eleve int unsigned not null,
    constraint fk_eleve foreign key(eleve) references Eleve(Id) on delete cascade on update cascade,
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;


create table PaiementMoniteur(
    Id int unsigned auto_increment primary key not null,
    motif varchar(200) not null,
    montant float not null,
    dateP date not null,
    moniteur int unsigned not null,
    constraint fk_moniteur foreign key(moniteur) references Moniteur(Id) on delete cascade on update cascade,
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;

create table Cours(
    Id int unsigned auto_increment primary key not null,
    dateCours date not null,
    heureDepart time not null,
    heureFin time not null,
    eleve int unsigned not null,
    lecon int unsigned not null,
    moniteur int unsigned not null,
    constraint fk_moniteur_cours foreign key(moniteur) references Moniteur(Id) on delete cascade on update cascade,
    constraint fk_lecon_cours foreign key(lecon) references Lecon(Id) on delete cascade on update cascade,
    constraint fk_eleve_cours foreign key(eleve) references Eleve(Id) on delete cascade on update cascade,
    created timestamp not null
)engine=innodb charset=utf8 collate=utf8_general_ci;
