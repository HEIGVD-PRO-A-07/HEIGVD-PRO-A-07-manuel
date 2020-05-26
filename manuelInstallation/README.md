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

### Support technique

En cas de problème rencontré lors de l'installation, l'équipe peut être contactée par plusieurs moyens :

- par email (cités ci-dessus)
- sur le canal A-07 de l'équipe PRO sur Microsoft Teams

Le délai de réponse sera plus rapide via le canal Teams.

----

### Dépendances

//configuration des machines + les services nécessaires...

Avant de procéder à l'installation, il est nécessaire de s'assurer que les dépendances ci-dessous sont respectées.

* Active Directory
* ....



### Prérequis 

##### Infrastructure

- les machines utilisant cette applications doivent être dans le même sous-réseau (serveur compris)

- Le port 7777 doit être libre afin d'être utilisé pour l'application de surveillance

  

##### Pare-feu

- Il faut autoriser les paquets entrants sur le port 7777 des machines



##### Active Directory

Pour l'utilisation de cette application, l'infrastructure nécessite d'avoir le service Active Directory de Windows qui contient les groupes ci-dessous avec leurs utilisateurs.

- Groupe **professeurs** **(nom exacte à mettre )**
- Groupe **élèves** **(nom exacte à mettre )**



### Installation

##### Téléchargement

L'exécutable est disponible à l'adresse suivante :

​			client : [télécharger ici](lien_bla_bla) **TODO adresse correcte**

​			serveur : [télécharger ici](lien_bla_bla) **TODO adresse correcte**

Pour vérifier la version de l'exécutable, voici le hash sha256 de celui-ci : 

​			Hash client : **TODO hash last version**

​			Hash serveur : **TODO hash last version**

1) Pour récupérer le hash : ``Get-FileHash .\PRO.exe -Algorithm SHA256 | Format-List``

2) Pour comparer le hash : ``"HASH1" -eq "HASH2"``



##### Configuration les SID des groupes (élèves/prof) :

**TODO explication :**  il faut que dans un infra existante (où le SID du groupe qui regroupes les prof n'est pas égale au notre) indiqué comment modifier/configurer le programme pour qu'il reconnaisse correctement les profs. [idem pour les élèves]



##### Configuration des lancements de l'application selon le type de poste [serveur|client élève-professeur] : 

Le lancement de l'application se fait à l'aide de la commande suivante et à l'emplacement où se situe l'exécutable. Le port utilisé dans notre cas est le ``7777``.

pour les clients : ``.\PRO.exe [professeur|eleve] <ipServer> <Port>``

pour le serveur : ``.\PRO.exe serveur <Port>``



###### Serveur

**TODO explication : **Lancement dès démarrage de la machine avec la commande : 

``.\PRO.exe server 7777``



###### Client - élève

**TODO explication :** faire que le programme se lance automatiquement au démarrage

//script ? GPO? Service ? qui lance dès l'ouverture de la session élève l'application. 

``.\PRO.exe eleve 192.168.0.1 7777``



###### Client - professeur 

**TODO explication :** Avoir un raccourci sur le bureau du prof et lancement avec la commande 

 ``.\PRO.exe professeur 192.168.0.1 7777``



-----

### Tester l'application

Trois machines virtuelles composées d'un Serveur Windows et de deux clients Windows sont disponibles à l'adresse suivante : [lien pour télécharger]() **A_METTRE_LE_BON_LIEN**. L'ensemble de l'infrastructure est fonctionnelle pour réaliser l'installation cité ci-dessus. 



Pour lancer l'application, veuillez suivre les étapes qui suivent :

1. Démarrer le serveur
2. Générer les utilisateurs dans l'Active Directory depuis le script fourni en annexe
3. Démarrer un client et y connecter un professeur
4. Démarrer un client et y connecter un élève
5. Exécuter l'application sur la machine du professeur depuis le raccourci bureau



Pour tester l'application, il faudra suivre les points suivants : 

1. Depuis le GUI de l'application (machine professeur), choisir un groupe d'élèves à surveiller
2. Depuis la machine élève, effectuer des actions diverses (cela permet de visualiser des changements au niveau de la surveillance dans le GUI)
3. Essayer les différentes fonctionnalités proposées par l'application (boutons du GUI) 



Pour des tests plus complets, nous avons établi une liste de contrôles (grille des tests disponible en annexe). En cas d'hésitation sur l'utilisation du GUI, veuillez-vous référer au manuel d'utilisation [ici]( https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/tree/master/manuelUtilisation ).



-----

### Annexes

- Script de génération d'utilisateurs/groupes pour l'AD  [accès au script]( https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/blob/master/manuelInstallation/script_AD.ps) 

  Ce script est destiné à être lancé depuis le bureau. Il génère les utilisateurs présents dans le [fichier csv]()  
  
- Grille des tests des fonctionnalités et leurs critères de validation [télécharger ici]( https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/tree/master/rapport/RapportDeControle ) **METTRE_A_JOUR_LIEN**

