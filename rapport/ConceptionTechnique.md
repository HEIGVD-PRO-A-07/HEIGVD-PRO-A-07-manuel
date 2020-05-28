# Conception technique

##### Nom du projet: Management de Session Windows

##### Contexte : Cours de PRO - HEIG-VD 2020

##### Professeur responsable : Jean-Marc Bost

##### Équipe de développement :

| Nom                               | E-mail                             | Github       |
| --------------------------------- | ---------------------------------- | ------------ |
| Cassandre Wojciechowski           | cassandre.wojciechowski@heig-vd.ch | CassandreWoj |
| Gabriel Roch (Project lead)       | gabriel.roch@heig-vd.ch            | g-roch       |
| Gwendoline Dossegger              | gwendoline.dossegger@heig-vd.ch    | Dosseggegw1  |
| Laurent Scherer                   | laurent.scherer@heig-vd.ch         | 0x47726579   |
| Laurent Thoeny                    | laurent.thoeny@heig-vd.ch          | Sicriss      |
| Nenad Rajic (deputy project lead) | nenad.rajic@heig-vd.ch             | NR09         |

## Table des matières

// todo : generate on office

## Introduction

Dans le cadre de ce cours PRO, nous avons imaginé un projet qui permet à un professeur de surveiller les activités de ses étudiants sur ordinateur. Nous avons implémenté un software utilisable et utile dans le cadre de nos études. De plus, notre groupe est constitué d’étudiants des filières “Sécurité de l’information” et “Réseaux et services”, donc ce projet nous a permis d’impliquer chaque membre du groupe. Ce projet a été réalisé de mi-février à fin mai, donc sur une durée de trois mois et demi. 

Le projet peut être utilisé dans un environnement Windows uniquement. Chaque poste “élève” est surveillé et le poste “professeur” recense les fenêtres visibles par les étudiants sur leur ordinateur. En cas d’activité illégale de la part d’un élève, le professeur peut bloquer les entrées clavier/souris de la session.

#### Public cible

Ce programme est principalement destiné à être utilisé au sein d'écoles. Les professeurs pourront ainsi les laisser se familiariser avec le monde de l'informatique en toute sécurité. Cela permettrait également aux élèves d'effectuer des tests sur les ordinateurs en vérifiant qu'il n'y a pas de triche. 

Le blocage de session permet aussi de forcer les élèves à rester attentif à ce qu'il se dit autour d'eux quand le professeur souhaite reprendre la main dans la classe.

#### Prérequis

Au niveau de l'infrastructure nécessaire, il ne faut que le matériel qu'on peut trouver habituellement dans une salle d'informatique et dans une école. 
Nous utilisons des groupes Active Directory pour la récupération des rôles / droits / groupes / etc .. (notamment les groupes "Professeurs" et "Elèves" mais également des groupes de machines pour les "salles").
Notre logiciel serveur peut être deployé sur le serveur AD de l'école mais ce n'est pas obligatoire. Il peut être installé sur une machine dédiée (membre de l'AD) si une répartition des fonctions est souhaitée. 

## Analyse

Nous souhaitons obtenir une application réalisant des captures d'écran des postes élèves, les envoyant sur le serveur qui les transmet au poste professeur ainsi qu'offrant au professeur la possibilité de bloquer les entrées souris/clavier sur les postes élèves pour encourager les étudiants à se concentrer sur l'activité de la classe. 

Pour obtenir une application fonctionnelle, nous avons fixé plusieurs objectifs :

- implémentation du protocole de communication client &harr; serveur
- prise de captures d'écran des sessions élève
- envoi des captures d'écran sur un serveur
- envoi des captures d'écran au poste professeur depuis le serveur
- blocage des entrées souris / clavier sur les postes élèves depuis le poste professeur

### Description de l'existant

##### Protocole réseau

Nos recherches sur les échanges client - serveur en C# nous ont très rapidement conduit sur le namespace [Sockets](https://docs.microsoft.com/en-us/dotnet/api/system.net.sockets?view=netcore-3.1) que nous avons pu utiliser.

##### Multi-threading

Naturellement le C# possède une implémentation native des threads que nous avons ré-utilisée telle quelle grâce à la [documentation](https://docs.microsoft.com/en-us/dotnet/api/system.threading.thread?view=netcore-3.1) de Microsoft.

##### Capture d'écran

La base de notre projet repose sur des captures d'écran faites sur les postes des élèves. Il nous a donc fallu implémenter la prise de ces captures. Nous nous sommes basés pour cela sur du code déjà [existant](https://www.developerfusion.com/code/4630/capture-a-screen-shot/). 

##### Envoi/réception d'images

Pour implémenter le code permettant d'envoyer les captures d'écran depuis le PC de l'élève sur le serveur, nous nous sommes basés sur un fragment de code trouvé sur le site dédié au C# [c-sharpcorner](https://www.c-sharpcorner.com/article/socket-programming-in-C-Sharp/). Nous avons ainsi pu envoyer l'image sur le socket prévu et récupérer cette image sur le poste professeur. 

##### Blocage d'entrées souris/clavier

Pour implémenter le code qui bloque et débloque les activités de la souris et du clavier, nous avons utilisé un "hook" sur user32.dll afin de modifier directement le traitement des inputs clavier/souris au niveau logiciel. 
Cela ne bloque pas les combinaisons de touches qui sont rattrapées directement par Windows. C'est possible mais pas du tout [recommandé](https://www.codeproject.com/questions/216453/how-to-disable-ctrlplusaltplusdel-key) car c'est une modification de Windows et de son fonctionnement interne. Ces combinaisons spéciales sont par exemple les [Secure Attention Key](https://en.wikipedia.org/wiki/Secure_attention_key)

## Implémentation

Nous avons réalisé notre projet entièrement en C# et sur l'IDE VisualStudio. Cela nous a permis de consulter la documentation .NET existante de Microsoft sur les différents sujets abordés dans le cadre de cette application. 

#### GUI

Nous avons implémenté l'interface graphique avec les Windows Forms. L'affichage a été pensé pour que le nombre d'écrans affichés soit dynamique selon le nombre de postes occupés dans la classe surveillée. 

L'affichage est modifié toutes les secondes car les captures d'écran sont actualisées à ce rythme. Depuis cette interface, nous pouvons demander l'actualisation des groupes disponibles. En sélectionnant le groupe, les postes des élèves s'affichent et en cliquant sur le poste d'un élève en particulier, des options apparaissent. A cet endroit, on peut lire le nom de l'élève connecté et il est possible de bloquer ou débloquer les inputs souris/clavier pour cet élève.

Nous avons fait en sorte que la GUI garantisse la meilleure expérience utilisateur : une esthétique minimaliste permettant la compréhension rapide des possibilités et un usage simplifié pour les utilisateurs novices. Cela aura un impact significatif sur la réduction du temps de formation et de support nécessaire.  

En cas de besoin, l'utilisateur peut accéder au manuel d'utilisation en sélectionnant l'onglet d'aide. 

#### Protocole

Notre protocole utilise le port 7777 en TCP. C'est un protocole avec état (mémorisation d'informations). Nous utilisons un encodage "Unicode" pour le transfert des images et des messages. 

Plusieurs messages d'erreur sont configurés avec une numérotation (expliquée en détail dans le document "Spécifications du protocole") permettant de trouver rapidement l'origine de l'erreur. 

C'est systématiquement le client qui se connecte au serveur et non l'inverse.

Nous avons prédéfini des messages afin que le serveur confirme bonne réception des informations ou qu'il envoie une erreur si l'information n'est pas passée correctement ou pas comprise. Les messages permettent aussi au client et au serveur d'obtenir des informations et d'accuser réception. 

Le document "Spécifications du protocole" présent sur Github explique plus en détails l'implémentation du protocole. 

#### Client

Nous avons implémenté l'application côté client avec un système de callbacks. Ce système nous permet d'assigner des méthodes à chaque commande/réponse que le serveur peut nous transmettre et nous permet ainsi de les éxecuter en parallèle d'autres tâches si nécessaires.

Pour le cas d'un élève, l'application va simplement demander ses droits puis entrer dans une boucle d'envoi de screenshots, avec une écoute en parallèle pour un potentiel blocage ou une prise de contrôle à distance.

Le cas d'un professeur est plus détaillé, nous avons toute la GUI qui commande diverses méthodes destinées à la mettre à jour ou à changer le groupe affiché, tandis que nous avons une tâche en arrière plan qui va demander des captures d'écran en boucle lorsque la connexion à un groupe a été effectuée.

Cette gestion nous permet de laisser à la vue de très simples fonctions de mise à jour ou d'envoi de commandes tandis que les réponses et le traitement peuvent être gérés dans le client, cela nous a permis de répartir la logique d'une manière plus optimale entre le _main_ qui gère la vue et notre client.

Lorsque le client est quitté, il doit prévenir le serveur de sa déconnexion afin de ne pas utiliser des ressources inutilement, ainsi la fermeture de la GUI du professeur va envoyer _/exit_ au serveur afin de terminer la connexion. Pour l'élève c'est géré grâce à la commande _/offline_ qui fait déjà partie du flux normal.

#### Serveur

Le serveur implémente une logique multi-threads qui écoute les connexions de clients et leur dédie ensuite un _Worker_ qui va s'occuper d'une machine en particulier et recevoir les commandes émises par cette dernière. Le serveur dispose de _Handlers_ pour les commandes existantes qui vont procéder aux vérifications et opérations nécessaires puis répondre au client. Le détails des opérations, réponses et codes d'erreur est disponible dans nos spécifications de protocole.

Le serveur conserve également une liste de tous les threads existants et des machines connectées, ainsi le _Worker_ qui reçoit une demande d'une machine peut contacter celui de la machine cible si cette dernière est connectée (typiquement pour une demande de contrôle à distance).

Parmi les vérifications effectuées sont notamment traités les formats des SIDs et des adresses IP, le nombre de paramètres, le rôle du demandeur. Le serveur dispose d'une liste de messages d'erreur (encore une fois selon spécifications). Les ouvertures de connexion ainsi que les erreurs sont également inscrites dans le système de logs. Les erreurs sont inscrites dans la catégorie _warning_ du système de logs (voir détails de ce dernier ci-dessous) car les erreurs rencontrées comme un mauvais format de SID sont gérées par l'application. Les erreurs documentées dans la catégorie _error_ proviennent des exceptions ou autres comportement indésirables ne faisant pas partie du flux d'exécution de notre programme.

Notre serveur possède une tâche en arrière plan pour chaque session elève ouverte qui va vérifier que ce dernier soit toujours connecté en vérifiant toute les minutes que le screenshot ait été actualisé, dans le cas contraire il fermera le socket afin de ne pas utiliser des ressources inutilement. Ce cas de figure entraînera le _logging_ d'une erreur car il n'est pas normal dans notre flux de travail qu'un client (professeur ou elève) se ferme sans se déconnecter (via _/offline_ ou _/exit_).

### Gestion des logs 

Nous avons mis l'accent sur la gestion des logs, outil précieux pour le _debug_ mais également point nécessaire pour tout logiciel qui passe en production.

À cet effet nous avons créé une classe dédiée, qui gère l'écriture dans trois fichiers qui correspondent à trois _niveaux_ de logs : les informations (_Info_), les avertissements (_Warning_) et les erreurs (_Error_). L'importance du message est gérée via ce niveau et le fichier de destination est choisi en conséquence, le log est inscrit au format `Date : Message`.   

## Conclusion

A la fin de ce projet, nous avons obtenu une application fonctionnelle permettant de prendre des captures d'écran et de les envoyer à travers un serveur. Nous pouvons aussi bloquer/débloquer les inputs de la souris et du clavier sur les postes élèves en activant ou désactivant un bouton sur l'interface professeur. 

Nous n'avons malheureusement pas eu le temps de traiter tous les points initialement prévus "nice to have" de notre cahier des charges. Cependant, nous obtenons quand même une application fonctionnelle réalisée entièrement par nos soins. 

Nous sommes arrivés au bout de notre itération 1 qui contient les points suivants : 

- Programme installable
- Communication avec le serveur
- Programme élève communique avec le serveur
- Programme prof communique avec le serveur
- Affichage chez le prof des écrans élèves

Les points "nice to have" implémentés sont :

- blocage/déblocage des inputs souris/clavier
- historique des captures d'écran sauvegardé **partiellement pour l'instant**

Les points "nice to have" non implémentés faisant partie de l'itération 2 sont les suivants : 

- chiffrement des connexions client-serveur
- prise de contrôle de la session élève à distance
- envoi de fichiers entre les postes élève et professeur

## Références

GUI : https://www.wideagency.ch/articles/les-vraies-valeurs-de-lux-wide

Sockets : 

- https://docs.microsoft.com/en-us/dotnet/api/system.net.sockets?view=netcore-3.1

- https://www.c-sharpcorner.com/article/socket-programming-in-C-Sharp/

Multi-threading : https://docs.microsoft.com/en-us/dotnet/api/system.threading.thread?view=netcore-3.1

Capture d'écran : https://www.developerfusion.com/code/4630/capture-a-screen-shot/

Blocage / déblocage d'inputs : 

- https://www.codeproject.com/questions/216453/how-to-disable-ctrlplusaltplusdel-key
- https://www.codeproject.com/Articles/23955/Running-a-Web-Site-in-Kiosk-Mode-with-C
- https://en.wikipedia.org/wiki/Control-Alt-Delete
- https://en.wikipedia.org/wiki/Secure_attention_key





