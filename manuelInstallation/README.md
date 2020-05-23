# Guide d'installation

##### Nom : Management de Session Windows

##### Contexte : Cours de PRO - HEIG-VD 2020

##### Professeur responsable : Jean-Marc Bost

##### Équipe de développement :

| Nom                               | E-mail                                                       | Github       |
| --------------------------------- | ------------------------------------------------------------ | ------------ |
| Cassandre Wojciechowski           | [cassandre.wojciechowski@heig-vd.ch](mailto:cassandre.wojciechowski@heig-vd.ch) | CassandreWoj |
| Gabriel Roch (Project lead)       | [gabriel.roch@heig-vd.ch](mailto:gabriel.roch@heig-vd.ch)    | g-roch       |
| Gwendoline Dossegger              | [gwendoline.dossegger@heig-vd.ch](mailto:gwendoline.dossegger@heig-vd.ch) | Dosseggegw1  |
| Laurent Scherer                   | [laurent.scherer@heig-vd.ch](mailto:laurent.scherer@heig-vd.ch) | 0x47726579   |
| Laurent Thoeny                    | [laurent.thoeny@heig-vd.ch](mailto:laurent.thoeny@heig-vd.ch) | Sicriss      |
| Nenad Rajic (deputy project lead) | [nenad.rajic@heig-vd.ch](mailto:nenad.rajic@heig-vd.ch)      | NR09         |

## 

### Dépendances

//configuration VM + les services nécessaires...

Avant de procéder à l'installation, il est nécessaire de s'assurer que les dépendances ci-dessous sont respectées.

* AD
* 



### Prérequis

Pare-feu

- Il faut autoriser les paquets entrants sur le port 7777 des machines

  

Active Directory

nécessite avoir une infrastructure Active Directory qui contient les groupes ci-dessous. Ils sont remplis selon leur nom. (script dispo en annexe)

- Groupe **professeur** (nom exacte : )
- Groupe **élève** (nom exacte : )



### Installation

//DL fichier + placer bon endroit

//configuration



Le lancement de l'application se fait à l'aide de la commande suivante et à l'emplacement ou se situe exécutable :

``.\PRO.ex [server|professeur|eleve] <ipServer> <Port>``





//Serveur

Lancement : ``.\PRO.exe server 7777``



//Client - élève

faire que le programme se lance automatiquement au démarrage

//script ? GPO? Service ? qui lance dès l'ouverture de la session élève l'application. 

``.\PRO.exe eleve 192.168.0.1 7777``



//Client - professeur 

Raccourci sur le bureau du prof

``.\PRO.exe professeur 192.168.0.1 7777``



### Annexes

- Script de génération d'utilisateurs/groupes pour l'AD  [accès au script]( https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/blob/master/manuelInstallation/script_AD.ps) 

  Ce script est destiné à être lancé depuis le bureau. Il génère les utilisateurs présents dans le [fichier csv]()  



