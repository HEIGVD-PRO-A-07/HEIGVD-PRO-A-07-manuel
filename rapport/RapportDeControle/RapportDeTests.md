# Rapport de tests des fonctionnalités

##### Nom : Management de Session Windows

##### Contexte : Cours de PRO - HEIG-VD 2020

##### Professeur responsable : Jean-Marc Bost

##### Équipe de développement :

| Nom                               | E-mail                                                       | Github       | Info |
| --------------------------------- | ------------------------------------------------------------ | ------------ | :--: |
| Cassandre Wojciechowski           | [cassandre.wojciechowski@heig-vd.ch](mailto:cassandre.wojciechowski@heig-vd.ch) | CassandreWoj |  CW  |
| Gabriel Roch (Project lead)       | [gabriel.roch@heig-vd.ch](mailto:gabriel.roch@heig-vd.ch)    | g-roch       |  GR  |
| Gwendoline Dossegger              | [gwendoline.dossegger@heig-vd.ch](mailto:gwendoline.dossegger@heig-vd.ch) | Dosseggegw1  |  GD  |
| Laurent Scherer                   | [laurent.scherer@heig-vd.ch](mailto:laurent.scherer@heig-vd.ch) | 0x47726579   |  LS  |
| Laurent Thoeny                    | [laurent.thoeny@heig-vd.ch](mailto:laurent.thoeny@heig-vd.ch) | Sicriss      |  LT  |
| Nenad Rajic (deputy project lead) | [nenad.rajic@heig-vd.ch](mailto:nenad.rajic@heig-vd.ch)      | NR09         |  NR  |



---
### Tests effectués

Les tests mentionnés tout au long de ce document ont été réalisés à la main. Nous avons choisi de ne pas les automatiser car nous avons rencontrés certaines difficultés dues à la gestion avec état, les tests de chaque partie dépendant des autres parties implémentées. 
Ces difficultés d'automatisation des tests sont également relatives au contexte car nous avons travaillé dans un domaine et les tests devaient être effectués sur des machines spécifiques. 

### Listes des fonctionnalités contrôlées

La liste ci-dessous recense l'ensemble des fonctionnalités annoncées dans le cahier des charges de ce projet. Il est possible de voir si elles sont implémentées, leur(s) critère(s) de validation ainsi que la date à laquelle elles ont été certifié validées. Les critères de validité sont décidés avant l'implémentation de la fonctionnalité.

Les grilles permettent donc de détailler à l'instant t les différentes options que notre application offre. Lors d'une modification qui peut potentiellement altérer la validité de la fonctionnalité, celle-ci est retestée afin de garantir que son implémentation est toujours efficace. Les tests effectuant des actions non visibles dans le GUI (transmission au travers de la socket) sont vérifiés à l'aide d'un sniffer de réseau.



##### Lancement de l'application

| Fonctionnalités à tester                            | Critère de validation                                        | Validé par | Last date |
| --------------------------------------------------- | ------------------------------------------------------------ | :--------: | :-------: |
| Lancement de l'application sur le Serveur           | lors de l'exécution de ``.\PRO.exe server 7777``, le processus est actif + trames de communication visibles avec un sniffer |     GR     | 26.05.20  |
| Lancement de l'application sur un client professeur | lors de l'exécution de ``.\PRO.exe client <ipServer> 7777``, le processus est actif + trames de communication visibles avec un sniffer |     GR     | 26.05.20  |
| Lancement de l'application sur un client élève      | lors de l'exécution de ``.\PRO.exe client <ipServer> 7777``, le processus est actif + trames de communication visibles avec un sniffer |     GR     | 26.05.20  |



##### Fonctionnalités du serveur

| Imp.* | Fonctionnalité à tester                                      | Critère de validation                                        | Validé par  | Last date |
| :---: | ------------------------------------------------------------ | ------------------------------------------------------------ | :---------: | :-------: |
|  Oui  | Identifie un client (envoie les droits à un client)          | Envoi au client ``/yourRight <right>**``                     |    GD CW    | 26.05.20  |
|  Oui  | Accepte la connexion d'un nouveau client élève               | Confirmation offline avec ``/received``                      |    GD CW    | 26.05.20  |
|  Oui  | Ajoute le nouveau poste client à la liste des clients surveillés (selon précédent) | Ajout des références du poste selon implémentation           |    GD CW    | 26.05.20  |
|  Oui  | Gestion du timeout d'un poste                                | Enlever les références du postes                             |     LT      | 26.05.20  |
|  Oui  | Récupération des machines d'un groupe                        | Communication avec l'AD                                      |     LT      | 26.05.20  |
|  Oui  | Envoie la liste des groupes AD au GUI                        | Envoi au client ``/groups ...\n``                            |     LT      | 26.05.20  |
|  Oui  | Récupération des groupes d'un utilisateur                    | Communication avec l'AD                                      |     LT      | 26.05.20  |
|  Oui  | Envoie les informations d'un groupe au client professeur     | Envoi au client ``/infosGroup ...\n ``                       |     LT      | 26.05.20  |
|  Oui  | Récupération des screenshots envoyés par un client élève     | Envoi au client ``Received\n``                               |     LT      | 26.05.20  |
|  Oui  | Envoie des screenshots d'un groupe à un client Professeur (sur demande) | Envoi au client ``/screens ...\n``                           |     LT      | 26.05.20  |
|  Oui  | Transmet la demande de blocage des inputs par le client professeur à un client élève | Envoi au client élève ``Lock\n``                             |     LT      | 27.05.20  |
|  Oui  | Transmet la demande de blocage des inputs par le client professeur à plusieurs clients élèves | Envoi au client élève ``Lock\n``                             |     GR      | 27.05.20  |
|  Oui  | Transmet la demande de déblocage des inputs par le client professeur à un client élève | Envoi au client élève ``Unlock\n``                           |     GR      | 27.05.20  |
|  Oui  | Transmet la demande de déblocage des inputs par le client professeur à plusieurs clients élèves | Envoi au client élève ``Unlock\n``                           |     LT      | 26.05.20  |
|  Oui  | Gestion d'un historique de screenshots                       | Envoi au client ``/history ...\n``                           |     LT      | 26.05.20  |
|  Oui  | Envoie l'historique d'un ordinateur connecté au client professeur | Le serveur répond au professeur``/history <nombre> <liste des screenshots>\n`` |     LT      | 26.05.20  |
|  Oui  | Dans le cadre de l'historique, les screenshots datant de plus d'une minute sont effacés | Ecrasement selon l'implémentation dans le code               |     LT      | 26.05.20  |
|  Oui  | Gestion des commandes mal formulées, de paramètres manquants et autres abus de droits avec des messages d'erreurs | Génère une erreur selon l'infraction : ``/error <NoErr> <errMessage>`` | GD CW LT GR | 26.05.20  |
|  Oui  | Gestion de la demande de session à distance par un client professeur | Retourne la liste des IP disponibles + retourne si la session est toujours active |     LT      | 26.05.20  |
|  Non  | Gestion de l'envoi de fichiers par le protocole entre un élève et un professeur | -                                                            |      -      |     -     |
|  Non  | Gestion de surveillance par plusieurs professeurs en même temps | -                                                            |      -      |     -     |
|  Non  | Chiffrement des communications                               | -                                                            |      -      |     -     |

*Fonctionnalité implémentée ou non

** le right correspond à ``student = SID élève``, ``professor = SID professeur`` ou ``non = aucun des deux précédents``



##### Fonctionnalités du Client

| Imp.* | Fonctionnalité à tester                              | Type client        | Critère de validation                                        | Validé par | Last date |
| :---: | ---------------------------------------------------- | ------------------ | ------------------------------------------------------------ | :--------: | :-------: |
|  Oui  | Etablissement de la communication                    | élève              | Envoi au serveur ``/online ....``                            |   GD CW    | 26.05.20  |
|  Oui  | Identification initiale auprès du serveur            | Professeur / élève | Envoi au serveur   ``/getRights <sidUser>``                  |   GD CW    | 26.05.20  |
|  Oui  | Termine la communication                             | élève              | Envoi au serveur ``/offline <sidComputer>``   puis ``/exit`` |     GD     | 27.05.20  |
|  Oui  | Termine la communication lors de la fermeture du GUI | Professeur         | Envoi au serveur ``/exit`` puis ``/offline``                 |     GD     | 27.05.20  |
|  Oui  | Envoi d'un screenshot                                | élève              | Envoi au serveur ``/sendScreen ...``                         |   GD CW    | 26.05.20  |
|  Oui  | Demande les groupes d'élèves connectés au serveur    | Professeur         | Envoi au serveur ``/getGroups``                              |  GD CW GR  | 26.05.20  |
|  Oui  | Demande les informations pour un groupe renseigné    | Professeur         | Envoi au serveur ``/getGroupInfo <sidGrp>``                  |  GD CW GR  | 26.05.20  |
|  Oui  | Demande les sceenshots au serveur                    | Professeur         | Envoi au serveur ``/getScreens <sidGrp>``                    |     GR     | 26.05.20  |
|  Oui  | Demande de bloquer les inputs d'un élève             | Professeur         | Envoi au serveur ``/lock <sid>``                             |     GD     | 27.05.20  |
|  Oui  | Demande de bloquer les inputs de plusieurs élèves    | Professeur         | Envoi au serveur ``/lock <sid>``                             |     GD     | 27.05.20  |
|  Oui  | Demande de débloquer les inputs d'un élève           | Professeur         | Envoi au serveur ``/unlock <sid>``                           |     GR     | 27.05.20  |
|       | Demande de débloquer les inputs de plusieurs élèves  | Professeur         | Envoi au serveur ``/unlock <sid>``                           |            |           |
|  Oui  | Demande de prise de session distante                         | Professeur         | Demande des adresses IP possibles au serveur                 |            |           |
|  Oui  | Session distante par un professeur                   | Professeur         | Connexion en RDP sur l'IP du poste élève choisi              |            |           |
|  Oui  | Demande de l'historique des screenshots d'un élève   | Professeur         | Envoi au serveur ``/getHistory <sidComputer>``               |   GD LT    | 27.05.20  |
|  Non  | Envoi de fichiers entre le professeur et les élèves  | Professeur / élève | Un professeur peut envoyer un fichier depuis son GUI aux élèves |     -      |     -     |

*Fonctionnalité implémentée ou non

s

##### Fonctionnalités générales du GUI

| Fonctionnalité à tester                                      | Critère de validation                                        | Validé par * | Last date |
| ------------------------------------------------------------ | ------------------------------------------------------------ | :----------: | :-------: |
| L'application a une interface pour un utilisateur du groupe professeur | Affichage du GUI lorsqu'un professeur lance l'application    |    GD CW     | 26.05.20  |
| Le processus est terminé lors de la fermeture de l'application (croix) | Termine le processus une fois la croix cliquée               |      GD      | 27.05.20  |
| Liste de groupes d'élèves connectés                          | L'application affiche tous les groupes d'élèves actuellement connectés |    GD CW     | 26.05.20  |
| Mise à jour de la liste de groupes d'élèves connectés (sous fichier) | Lorsqu'on clique sur ``Mettre à jour les groupes``, la liste est mise à jour |    GD CW     | 26.05.20  |
| Sélection d'un groupe d'élèves                               | Lorsqu'on sélectionne un groupe d'élèves, les écrans des élèves sont affichés |    GD CW     | 26.05.20  |
| Affichage d'un screenshot par élève                          | Chaque écran d'élève du groupe est affiché 1x                |    GD CW     | 26.05.20  |
| Chaque écran d'élève a une légende avec le username de l'utilisateur | Chaque screenshot possède une légende avec le username de l'étudiant |    GD CW     | 26.05.20  |
| Il est possible d'afficher un menu avec plusieurs options lorsqu'on sélectionne un élève | Lorsqu'on clique sur un screenshot d'un élève un menu s'affiche avec diverses options |      GD      | 26.05.20  |
| Le username de l'élève est affiché dans le menu (cité ci-dessus) | Lorsqu'on affiche le menu de l'élève, son username est affiché |      GD      | 26.05.20  |
| Il est possible de bloquer un élève depuis le menu (cité ci-dessus) | Les inputs de l'élève sélectionné sont bloqués lors du click sur ``Bloquer`` |      GR      | 27.05.20  |
| Bloque tous les inputs du groupe surveillé (sous outils)     | Tous les élèves du groupe ne peuvent plus effectuer d'inputs sur leur poste |              |           |
| Il est possible de débloquer un élève depuis le menu (cité ci-dessus) | Les inputs de l'élève sélectionné sont débloqués lors du click sur ``Bloquer`` |      GR      | 27.05.20  |
| Débloque tous les inputs du groupe surveillé (sous outils)   | Tous les élèves du groupe peuvent réeffectuer des inputs sur leur poste |              |           |
| Demande de connexion à un poste élève (RDP)                  | Le professeur peut choisir un élève pour se connecter en RDP (depuis le menu de l'élève) |    LS***     | 27.05.20  |
| Session à distance sur un poste élève                      | Le professeur peut se connecter en RDP sur le poste élève choisi |    LS***     | 27.05.20  |
| Il est possible de voir l'historique des screenshots de l'élève (la dernière minute écoulée) | Les screenshots de la dernière minute écoulée sont affichés dans le GUI |    GD LT     | 27.05.20  |
| Accès au manuel d'utilisation (depuis menu Aide)             | Une redirection** sur la page web du manuel d'utilisation est effectuée |    GD CW     | 26.05.20  |

*les champs ayant le symbole ``-`` dans la colonne ``Validé par`` ne sont pas implémentés ou que partiellement.

**la machine sur laquelle on teste cette fonctionnalité doit obligatoirement être connectée à internet.

\*** **AMETTREQQCHMAISJESAISPASQUOI**
