# Grille des tests pour la validation des fonctionnalités
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

### Listes des fonctionnalités à contrôler

Dans le fichier [RapportDeTests]( https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/blob/master/rapport/RapportDeControle/RapportDeTests.md ) vous pouvez trouver tous les tests que nous avons effectués sur l'application. Voici une grille de contrôle vierge afin que le destinataire de ce document puisse tester le bon fonctionnement de celle-ci :



##### Lancement de l'application

| Fonctionnalités à tester                            | Critère de validation                                        | Validé |
| --------------------------------------------------- | ------------------------------------------------------------ | :----: |
| Lancement de l'application sur le Serveur           | lors de l'exécution de ``.\PRO.exe server 7777``, le processus est actif + trames de communication visibles avec un sniffer |        |
| Lancement de l'application sur un client professeur | lors de l'exécution de ``.\PRO.exe client <ipServer> 7777``, le processus est actif + trames de communication visibles avec un sniffer |        |
| Lancement de l'application sur un client élève      | lors de l'exécution de ``.\PRO.exe client <ipServer> 7777``, le processus est actif + trames de communication visibles avec un sniffer |        |



##### Fonctionnalités générales du GUI

| Fonctionnalité à tester                                      | Critère de validation                                        | Validé |
| ------------------------------------------------------------ | ------------------------------------------------------------ | :----: |
| L'application a une interface pour un utilisateur du groupe professeur | Affichage du GUI lorsqu'un professeur lance l'application    |        |
| Le processus est terminé lors de la fermeture de l'application (croix) | Termine le processus une fois la croix cliquée               |        |
| Liste de groupes d'élèves connectés                          | L'application affiche tous les groupes d'élèves actuellement connectés |        |
| Mise à jour de la liste de groupes d'élèves connectés (sous fichier) | Lorsqu'on clique sur ``Mettre à jour les groupes``, la liste est mise à jour |        |
| Sélection d'un groupe d'élèves                               | Lorsqu'on sélectionne un groupe d'élèves, les écrans des élèves sont affichés |        |
| Affichage d'un screenshot par élève                          | Chaque écran d'élève du groupe est affiché 1x                |        |
| Chaque écran d'élève a une légende avec le username de l'utilisateur | Chaque screenshot possède une légende avec le username de l'étudiant |        |
| Il est possible d'afficher un menu avec plusieurs options lorsqu'on sélectionne un élève | Lorsqu'on clique sur un screenshot d'un élève un menu s'affiche avec diverses options |        |
| Le username de l'élève est affiché dans le menu (cité ci-dessus) | Lorsqu'on affiche le menu de l'élève, son username est affiché |        |
| Il est possible de bloquer un élève depuis le menu (cité ci-dessus) | Les inputs de l'élève sélectionné sont bloqués lors du click sur ``Bloquer`` |        |
| Bloque tous les inputs du groupe surveillé (sous outils)     | Tous les élèves du groupe ne peuvent plus effectuer d'inputs sur leur poste |        |
| Il est possible de débloquer un élève depuis le menu (cité ci-dessus) | Les inputs de l'élève sélectionné sont débloqués lors du click sur ``Bloquer`` |        |
| Débloque tous les inputs du groupe surveillé (sous outils)   | Tous les élèves du groupe peuvent réeffectuer des inputs sur leur poste |        |
| Il est possible de lancer une ouverture de session à distance sur un poste élève depuis le menu  (cité plus haut) | Le professeur peut choisir un élève pour se connecter en RDP (depuis le menu de l'élève) |        |
| Ouverture de session à distance à un poste élève (RDP) sur le poste d'un élève | Le professeur peut se connecter en RDP sur le poste élève choisi |        |
| Il est possible de voir l'historique des screenshots de l'élève (la dernière minute écoulée) | Les screenshots de la dernière minute écoulée sont affichés dans le GUI |        |
| Accès au manuel d'utilisation (depuis menu Aide)             | Une redirection* sur la page web du manuel d'utilisation est effectuée |        |

\* La machine sur laquelle on teste cette fonctionnalité doit obligatoirement être connectée à internet.