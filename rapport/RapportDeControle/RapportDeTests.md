# Rapport de tests des fonctionnalités

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



---

### Listes des fonctionnalités contrôlées

La liste ci-dessous recense l'ensemble des fonctionnalités annoncées dans le cahier des charges de ce projet. Il est possible de voir si elles sont implémentées, leur(s) critère(s) de validation ainsi que la date à laquelle elles l'ont été. 







##### Fonctionnalités du serveur

| Imp.* | Fonctionnalité à tester                                      | Critère de validation                     | Validé par | Date |
| ----- | ------------------------------------------------------------ | ----------------------------------------- | ---------- | ---- |
| Oui   | Accessible en TCP  sur le port 7777                          |                                           |            |      |
| Oui   | Identifie un client (envoi les droits à un client)           | répond au client ``/yourRight <right>**`` |            |      |
| Oui   | Accepte la connexion d'un nouveau client élève               | confirmation offline avec ``/received\n`` |            |      |
| Oui   | Ajoute le nouveau poste client à la liste des clients surveillés (selon précédent) |                                           |            |      |
| Oui   | Accepte la déconnexion d'un poste                            | confirmation offline avec ``Received\n``  |            |      |
| Oui   | Récupération des machines d'un groupe                        |                                           |            |      |
| Oui   | Renvoie la liste des groupes AD au GUI                       |                                           |            |      |
| Oui   | Récupération des groupes d'un utilisateur                    |                                           |            |      |
| Oui   | Envoi les informations d'un groupe au client professeur      |                                           |            |      |
| Oui   | Récupération des screenshots envoyés par un client élève     |                                           |            |      |
| Oui   | Gestion d'un historique de screenshots                       |                                           |            |      |
| Oui   | Envoi des screenshots d'un groupe à un client Professeur (sur demande) |                                           |            |      |
| Oui   | Transmet une demande de contrôle d'un client professeur vers un client élève |                                           |            |      |
| Oui   | Transmet la demande de blocage des inputs par le client professeur à un client élève |                                           |            |      |
| Oui   | Transmet la demande de blocage des inputs par le client professeur à plusieurs clients élèves |                                           |            |      |
| Oui   | Transmet la demande de déblocage des inputs par le client professeur à un client élève |                                           |            |      |
| Oui   | Transmet la demande de déblocage des inputs par le client professeur à plusieurs clients élèves |                                           |            |      |
| Oui   | Envoi l'historique d'un ordinateur connecté                  |                                           |            |      |
| Oui   | Gestion des commandes mal formulées, de paramètres manquants et autres abus de droits avec des messages d'erreurs | Génère une erreur selon l'infraction      |            |      |

** le right correspond à ``student = SID élève``, ``professor = SID professeur`` ou ``non = aucun des deux précédents``



##### Fonctionnalités du Client

| Imp.* | Fonctionnalité à tester                 | Type client | Critère de validation                   | Validé par | Date |
| ----- | --------------------------------------- | ----------- | --------------------------------------- | ---------- | ---- |
| Oui   | Etablissement de la communication       | Elève       |                                         |            |      |
| Oui   | Etablissement de la communication       | Professeur  |                                         |            |      |
| Oui   | S'authentifier au serveur selon son SID |             | envoi au serveur   /getRights <sidUser> |            |      |
| Oui   | Termine la communication                |             | envoie ``/offline <sidComputer>\n``     |            |      |
|       |                                         |             |                                         |            |      |
|       |                                         |             |                                         |            |      |
|       |                                         |             |                                         |            |      |
|       |                                         |             |                                         |            |      |
|       |                                         |             |                                         |            |      |
|       |                                         |             |                                         |            |      |
|       |                                         |             |                                         |            |      |
|       | Sélection d'un groupe à surveiller      | Professeur  |                                         |            |      |
|       |                                         | Professeur  |                                         |            |      |
|       |                                         | Professeur  |                                         |            |      |
|       |                                         | Professeur  |                                         |            |      |
|       |                                         |             |                                         |            |      |

*Fonctionnalité implémenté



##### Fonctionnalités générales du GUI

| Fonctionnalité à tester                                      | Critère de validation                                        | Validé par * | Date |
| ------------------------------------------------------------ | ------------------------------------------------------------ | :----------: | ---- |
| L'application a une interface pour un utilisateur du groupe professeur | Affichage du GUI lorsqu'un professeur lance l'application    |              |      |
| Liste de groupes d'élèves connectés                          | L'application affiche tous les groupes d'élèves actuellement connectés |              |      |
| Mise à jour de la liste de groupes d'élèves connectés (sous fichier) | Lorsqu'on clique sur ``Mettre à jour les groupes``, la liste est mise à jour |              |      |
| Sélection d'un groupe d'élèves                               | Lorsqu'on sélectionne un groupe d'élèves, les écrans des élèves est affichés |              |      |
| Affichage d'un screenshot par élève                          | Chaque écran d'élève du groupe est affiché 1x                |              |      |
| Chaque écran d'élève a une légende avec le username de l'utilisateur | Chaque screenshot possède une légende avec le username de l'étudiant |              |      |
| Bloque tous les inputs du groupe surveillé (sous outils)     | Tous les élèves du groupe ne peuvent plus effectuer d'inputs sur leur poste |              |      |
| Débloque tous les inputs du groupe surveillé (sous outils)   | Tous les élèves du groupe peuvent réeffectuer des inputs sur leur poste |              |      |
| Il est possible d'afficher un menu avec plusieurs options lorsqu'on sélectionne un élève | Lorsqu'on clique sur un screenshot d'un élève un menu s'affiche avec diverses options |              |      |
| Le username de l'élève est affiché dans le menu (cité ci-dessus) | Lorsqu'on affiche le menu de l'élève, son username est affiché |              |      |
| Il est possible de bloquer un élève depuis le menu (cité ci-dessus) | Les inputs de l'élève sélectionné sont bloqué lors du clique sur ``Bloquer`` |              |      |
| Il est possible de débloquer un élève depuis le menu (cité ci-dessus) | Les inputs de l'élève sélectionné sont débloqué lors du clique sur ``Bloquer`` |              |      |
| Il est possible de voir l'historique des screenshots de l'élève (la dernière minute écoulée) | Les screenshots de la dernière minute écoulée sont affichés dans le GUI |      X       |      |
| Accès au manuel d'utilisation (depuis menu Aide)             | Une redirection sur la page web du manuel d'utilisation est effectuée |              |      |

*les champs ayant le symbole ``X`` dans la colonne ``Validé par`` ne sont pas implémentés ou que partiellement.



Objectifs “nice to have”Chiffrement des connexions entre le serveur et les clients pour éviter qu’une tierce personne intercepte des données et les modifiePermettre au professeur d'empêcher les élèves d’utiliser les PCs en leur figeant les sessionslors d’une présentation, le professeur peut bloquer les “inputs” sur la machine “élève” (la session sera figée). Aucune entrée de clavier ou de souris ne peuvent modifier l’état actuel de la session jusqu’à ce que le déblocage soit levé.

Objectifs “nice to have”Le professeur peut prendre le contrôle d’une machine “élève”. La prise en main complète via les protocoles Windows intégrésPar exemple, un professeur peut montrer à l’élève une marche à suivre en effectuant pour ce dernier les manipulationsUn professeur peut projeter la session d’un élève au beamer afin que l’ensemble de la classe puisse suivre la présentationLe professeur peut accéder à l’historique des captures d’écran pour chaque élèves. L’historique des captures est supprimé à intervalle régulierLe professeur peut consulter les différentes captures prises de l’écran d’un élève sur une durée de x de jours. Les captures peuvent servir en cas de suspicion de triche durant un examen

Objectifs “nice to have”Envoi de fichiers entre professeur et élèves (dans les deux sens), le prof envoie par exemple des exercices ou des devoirs aux élèves et les élèves pourraient lui renvoyer les exercices complétésprofesseur → tous les élèveschaque élève → professeurCapture des inputs pour la mise en place d’un historique de la session élève, l’idée est de pouvoir “rejouer” la session Windows, les saisies utilisateur ne sont pas forcément nécessaires pour ça.Écran (capture vidéos ou screenshot régulier (environ 20 à 30 FPS))

Objectifs “nice to have”permettre à plusieurs professeurs d’observer en même temps un même groupe d’élèves. Durant un examen d’informatique, le professeur est assisté d’un autre professeur afin de surveiller une classe. Les deux professeurs ont chacun les mêmes captures d’écran affichées au même moment