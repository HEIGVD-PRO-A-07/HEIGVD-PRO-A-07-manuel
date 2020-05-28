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
* Deux groupes : Professeurs et Eleves, membres du domaine. 
![](./img/pro.Eleves.png)
![](./img/pro.Professeurs.png)

* Les ordinateurs sur lesquels l'application sera installée appartiennent au domaine (dans le cadre de PRO toutes les VMs sont déjà configurées pour).



### Prérequis 

##### Infrastructure

- les machines utilisant cette application doivent être dans le même sous-réseau (serveur compris)

- Le port 7777 doit être libre afin d'être utilisé pour l'application de surveillance

  

##### Pare-feu

- Il faut autoriser les paquets entrants sur le port 7777 des machines



##### Active Directory

Pour l'utilisation de cette application, l'infrastructure nécessite d'avoir le service Active Directory de Windows qui contient les groupes ci-dessous avec leurs utilisateurs:



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

**TODO explication :**  il faut que, dans une infrastructure existante (où le SID du groupe qui regroupe les prof n'est pas égal au nôtre), nous indiquions comment modifier/configurer le programme pour qu'il reconnaisse correctement les profs. [idem pour les élèves]


#### Utiliser Configuration Manager


L'optimal serait d'utiliser SCCM, maintenant le [gestionnaire de logiciels Windows](https://docs.microsoft.com/en-us/mem/configmgr/core/understand/what-happened-to-sccm), qui permet de créer des *packages* avec différentes options.

![Local Executable](./img/SCCM-Admin-1.png)

Les différentes options pour lancer les programmes sont décrites par la suite.

`configmgr` est la solution optimale du fait qu'il permet aux administrateurs de spécifier quel programme lancer, via le chemin vers l'exécutable sur une machine, ainsi que les arguments que l'on veut donner à cet exécutable (voir la suite de la documentation pour les arguments relatifs aux différentes machines).
Il permet aussi de gérer la condition de lancement d'une application (typiquement lors de la connection d'un utilisateur) et les droits avec lesquels une application se lance.



##### Configuration des lancements de l'application selon le type de poste : 

Notre application différenciera deux types de postes : client (professeur|eleve) et serveur (AD).
Le lancement de l'application se fait à l'aide de la commande suivante et à l'emplacement où se situe l'exécutable. 
Le port considéré par défaut est le ``7777``.

pour les clients : ``.\PRO.exe [professeur|eleve] <ipServer> <Port>``

pour le serveur : ``.\PRO.exe serveur <Port>``



###### Serveur

L'application côté serveur sera considérée comme un service, i.e. elle démarrera avec le serveur et restera active avec le serveur.

Les arguments nécessaires au bon fonctionnement de l'application sont par défaut :  ``.\PRO.exe serveur``
Un port pourra être spécifié de cette façon : ``.\PRO.exe server 7777``
À noter que le port par défaut est le ``7777``.

Dans le cadre de PRO, les arguments par défaut seront suffisant.

**TODO : voir si on peut fournir un launcher.bat**



###### Client - élève

Pour le bon fonctionnement de l'application côté élève, il est nécessaire de la lancer avec des droits administrateur local au minimum, l'application ayant besoin d'interagir avec `kernell32.dll`.
L'application sur un poste élève devra être démarrée avec chaque nouvelle session de la part d'un élève.
Pour cela il serait préférable d'utiliser `SSCM`/`configmgr` qui permet toutes ces actions, ainsi que de les automatiser.
[Voir la documentation MS](https://docs.microsoft.com/en-us/mem/configmgr/core/clients/deploy/plan/client-installation-methods)

Les arguments nécessaires au bon fonctionnement de l'application sont par défaut : ``.\PRO.exe eleve 192.168.0.1`` ou ``.\PRO.exe eleve pro.local``.
L'IP fournie en 2ème argument sera celle du serveur AD sur lequel l'application est active. 

**TODO : voir si on peut fournir un launcher.bat**

###### Client - professeur 


Pour les sessions "professeur" la différence majeure sera la nécessité de créer un raccourci vers l'application sur le bureau, qui lancera l'application avec la commande : ``.\PRO.exe professeur 192.168.0.1 `` par défaut.
 ``.\PRO.exe professeur 192.168.0.1 7777``

**TODO : voir si on peut fournir un launcher.bat ou avec un shorcut windows, exemple :**

![exemple raccourci](./img/raccourci.png)


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

