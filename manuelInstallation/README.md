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

----

### Dépendances

//configuration des machines + les services nécessaires...

Avant de procéder à l'installation, il est nécessaire de s'assurer que les dépendances ci-dessous sont respectées.

* Active Directory
* Les machines doivent être dans le même sous-réseau
* ....



### Prérequis 

##### Pare-feu

- Il faut autoriser les paquets entrants sur le port 7777 des machines

  

##### Active Directory

nécessite avoir une infrastructure Active Directory qui contient les groupes ci-dessous. Ils sont remplis selon leur nom. (un script est disponible en annexe)

- Groupe **professeurs** (nom exacte à mettre )
- Groupe **élèves** (nom exacte à mettre )



### Installation

##### Téléchargement

L'exécutable est disponible à l'adresse suivante : [télécharger ici](lien_bla_bla) **TODO adresse correcte**

Pour vérifier la version de l'exécutable, voici le hash sha256 de celui-ci : **TODO hash last version**

1) récupéré hash : ``Get-FileHash .\PRO.exe -Algorithm SHA256 | Format-List``

2) comparer le hash : ``"HASH1" -eq "HASH2"``



##### Configuration les SID des groupes (élèves/prof) :

**TODO explication :**  il faut que dans un infra existante (où le SID du groupe qui regroupes les prof n'est pas égale au notre) indiqué comment modifier/configurer le programme pour qu'il reconnaisse correctement les profs. [idem pour les élèves]



##### Configuration des lancements de l'application selon le type de poste [serveur|client élève-professeur] : 

Le lancement de l'application se fait à l'aide de la commande suivante et à l'emplacement ou se situe exécutable :

pour les clients

``.\PRO.exe [professeur|eleve] <ipServer> <Port>``

pour le serveur

``.\PRO.exe serveur <Port>``



###### Serveur

**TODO explication : **Lancement dès démarrage de la machine avec la commande : ``.\PRO.exe server 7777``



###### Client - élève

**TODO explication :** faire que le programme se lance automatiquement au démarrage

//script ? GPO? Service ? qui lance dès l'ouverture de la session élève l'application. 

``.\PRO.exe eleve 192.168.0.1 7777``



###### Client - professeur 

**TODO explication :** Avoir un raccourci sur le bureau du prof et lancement avec la commande  ``.\PRO.exe professeur 192.168.0.1 7777``



### Annexes

- Script de génération d'utilisateurs/groupes pour l'AD  [accès au script]( https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/blob/master/manuelInstallation/script_AD.ps) 

  Ce script est destiné à être lancé depuis le bureau. Il génère les utilisateurs présents dans le [fichier csv]()  



