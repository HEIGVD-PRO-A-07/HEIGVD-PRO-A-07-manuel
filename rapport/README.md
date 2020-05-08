# Rapport de projet

##### Nom : Management de Session Windows

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

// todo : à améliorer si besoin

Dans le cadre de ce cours PRO, nous avons imaginé un projet qui permet à un professeur de surveiller les activités de ses étudiants sur ordinateur. Nous avons implémenté un software utilisable et utile dans le cadre de nos études. De plus, notre groupe est constitué d’étudiants des filières “Sécurité de l’information” et “Réseaux et services”, donc ce projet nous a permis d’impliquer chaque membre du groupe. 

Le projet peut être utilisé dans un environnement Windows uniquement. Chaque poste “élève” est surveillé et le poste “professeur” recense les fenêtres visibles par les étudiants sur leur ordinateur. En cas d’activité illégale de la part d’un élève, le professeur peut bloquer les entrées clavier/souris de la session.

## Public cible et prérequis

// todo : décrire à qui servira le programme et pourquoi, décrire brièvement l'infrastructure nécessaire

Ce programme est principalement destiné à être utilisé au sein d'écoles. Les professeurs pourront ainsi les laisser se familiariser avec le monde de l'informatique en toute sécurité. Cela permettrait également aux élèves d'effectuer des tests sur les ordinateurs en vérifiant qu'il n'y a pas de triche. 

Le blocage de session permet aussi de forcer les élèves à rester attentif à ce qu'il se dit autour d'eux quand le professeur souhaite reprendre la main dans la classe.

// todo : à compléter pour le serveur

Au niveau de l'infrastructure nécessaire, il ne faut que le matériel qu'on peut trouver habituellement dans une salle d'informatique et dans une école. Nous utilisons les groupes de l'AD pour la surveillance des postes. Le serveur de l'école sera utilisé pour l'envoi et la réception des captures d'écran.

## Analyse

// todo : Ici on mettrait les recherches effectuées, et documenterait ce qu'on a utilisé d'existant.

// NOTE : J'ai mis ce que j'ai utilisé moi, c'est bien si tout le monde peut compléter (@Sicriss)

// DONE for @Sicriss, @dosseggegw1, @CassandreWoj

Pour obtenir une application fonctionnelle, nous avons fixé plusieurs objectifs:

- implémentation du protocole de communication client &harr; serveur
- prise de captures d'écran des sessions élève
- envoi des captures d'écran sur un serveur
- envoi des captures d'écran au poste professeur depuis le serveur
- blocage des entrées souris / clavier sur les postes élèves depuis le poste professeur

### Description de l'existant

##### Protocole réseau

Nos recherches sur les échanges client - serveur en C# nous ont très rapidement conduit sur le namespace [Sockets](https://docs.microsoft.com/en-us/dotnet/api/system.net.sockets?view=netcore-3.1) que nous avons pu utiliser.

##### Multi-threading

Naturellement le C# possède une implémentation native des threads que nous avons ré-utilisée comme telle grâce à la [documentation](https://docs.microsoft.com/en-us/dotnet/api/system.threading.thread?view=netcore-3.1) de Microsoft.

##### Sécurité

Comme mentionné dans le cahier des charges, il était impératif de se baser sur des fonctions existantes pour la sécurité qui n'est pas un domaine que l'on pouvait se permettre de ré-implémenter. Bien heureusement ...[todo selon choix]

##### Capture d'écran

// mentionner les sources utilisées

##### Envoi d'images

Pour implémenter le code permettant d'envoyer les captures d'écran depuis le PC de l'élève sur le serveur, nous nous sommes basés sur un fragment de code trouvé sur le site dédié au C# [c-sharpcorner](https://www.c-sharpcorner.com/article/socket-programming-in-C-Sharp/). Nous avons ainsi pu envoyer l'image sur le socket prévu et récupérer cette image sur le poste professeur. 

##### Blocage d'entrées

// todo

## Implémentation

// todo : ici on documente tout ce qui est des choix personnels d'implémentation + spécificités techniques ?

## Tests

// todo : un résumé/listing de nos tests, à ajouter à la fin

## Planification

// todo : à la fin, comparer notre planification initiale et réelle, commenter brièvement, retards, rattrapage des retards, etc.

## Gestion de projet

Ce projet réalisé au sein du cours PRO est le premier projet d'une telle envergure que nous effectuons en tant qu'étudiants à la HEIG-VD. Nous avons donc dû adapter notre manière de travailler pour communiquer en groupe et avancer efficacement. Cela nous a pris quelques semaines pour trouver notre rythme mais nous y sommes finalement parvenus. 

##### Organisation

Notre organisation s'est vue chamboulée par le confinement causé par la pandémie du COVID-19. Nos réunions hebdomadaires ont été remplacées par des conférences à distance. Nous avons donc du revoir notre organisation. 

Chaque semaine, nous nous sommes parlé au minimum à trois reprises. Pour ces rendez-vous, le chef de projet préparait un ordre du jour disponible sur Github afin de lister les sujets de discussion que nous devions aborder et les problèmes rencontrés auxquels il fallait trouver une solution. Ces problèmes émergeaient souvent entre deux meetings et étaient d'abord communiqués de manière informelle via le groupe Telegram. 

Avant le meeting, nous pouvions donc prendre connaissance de l'ordre du jour et proposer des modifications. Au terme de la réunion, un procès verbal était rédigé pour garder trace de ce qui s'était dit. 

Un outil que nous avons énormément utilisé lors de la réalisation de ce projet est Github. Celui-ci s'est révélé extrêmement utile pour l'organisation et pas seulement pour la mise en commun du code du projet. 

Pour la planification et l'attribution des tâches, nous avons utilisé les "issues" et les "milestones". Cela nous a permis de morceler le projet en dizaines de petites tâches à effectuer et de les classer selon l'urgence. Nous nous étions fixé un planning en établissant le cahier des charges et nous avons utilisé les outils mis à disposition sur Github pour le respecter au mieux. Les "issues" peuvent être attribuées à des membres du groupe, ce qui nous a laissé nous répartir le travail : quand un membre trouvait une tâche intéressante ou qu'il savait comment la réaliser, il pouvait simplement se l'assigner et ainsi, nous avons pu garder trace du travail de chacun. 

Toujours grâce à Github, nous avons pu mettre en place un système de "peer reviewing" en établissant comme règle que chaque "pull request" (PR) devait être validée par deux membres du groupe. Ainsi, chaque partie de code intégrée au projet était assurée de fonctionner car plusieurs personnes devaient la tester. Nous pouvions également commenter et modifier si besoin. Les commentaires pertinents étaient discutés lors des meetings pour que l'entièreté du groupe se mette d'accord. 

##### En cas de problème

Si l'un des membres du groupe rencontrait un problème technique, la marche à suivre suivante était adoptée : un message était envoyé sur le groupe Telegram dédié à la communication informelle au sein du groupe. Cela permettait de signaler une première fois le problème. Ensuite, soit il était noté sur l'ordre du jour pour être abordé au meeting, soit un rendez-vous avec un ou plusieurs autres membres du groupe était pris directement pour discuter. 

Lors des meetings, quand un problème était annoncé, les membres du groupe les plus à l'aise se proposait pour aider à résoudre le problème. En général, nous prenions un rendez-vous pour se parler sur Microsoft Teams (autre outil extrêmement utile pour le projet). Au meeting suivant, nous pouvions ensuite discuter pour classer le problème comme résolu ou pour demander de l'aide supplémentaire. 

Le fait d'annoncer rapidement les problèmes et d'en discuter en groupe a permis de ne pas les négliger trop longtemps. Cela nous a aussi permis de mettre en avant les compétences des membres les plus forts et d'aider les membres les moins expérimentés, donc de resserrer les liens du groupe et d'avancer ensemble dans ce projet. 

##### Expérience générale au sein du groupe

// bonne entente grâce à la bonne communication, ajustements nécessaires au début, prise de rythme rapide, échanges réguliers, etc.

Malgré les quelques semaines d'ajustement que nous avons vécues, la mise en place des meetings réguliers a largement amélioré notre communication. Nous avons pu nous entraider et avancer de front dans ce projet. 

// todo : a compléter, si chacun pouvait donner un peu son avis ce serait bien, pour ensuite avoir l'impression générale reflétée dans le rapport

L'expérience générale de travail en groupe de six étudiants s'est très bien passée dans l'ensemble, ...

## Conclusion

// todo : quelqu'un d'inspiré pourra écrire une conclusion

// faire un point sur l'avancement général du projet, qu'est ce qui est fonctionnel, qu'est ce qui ne l'est pas, où on en est dans les points nice to have du CC, pourquoi (retards, difficultés techniques, ...) ...

## Références

// todo : ajout des sites web utilisés (réutiliser les liens mis dans "Description de l'existant")

## Annexes

* Les journaux de travail des divers membres du projet
* Une procédure d'installation
* Un manuel d'utilisation, il présente les cas d'utilisations classiques
* Les sources du projet

// todo : peut-être des ajouts.