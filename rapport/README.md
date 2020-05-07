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

Dans le cadre de ce cours PRO, nous avons imaginé un projet qui permet à un professeur de surveiller les activités de ses étudiants sur ordinateur. Nous avons implémenté un software utilisable et utile dans le cadre de nos études. De plus, notre groupe est constitué d’étudiants des filières “Sécurité de l’information” et “Réseaux et services”, donc ce projet nous a permis d’impliquer chaque membre du groupe. 

Le projet peut être utilisé dans un environnement Windows uniquement. Chaque poste “élève” est surveillé et le poste “professeur” recense les fenêtres visibles par les étudiants sur leur ordinateur. En cas d’activité illégale de la part d’un élève, le professeur peut bloquer les entrées clavier/souris de la session.

// todo : à améliorer si besoin

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

##### Organisation

// meetings (OJ, PV), Git (PR, issues, planning ...), Telegram (com. informelle), attribution des tâches

##### En cas de problème

// décrire la marche à suivre adoptée en cas de pb : message Telegram, discussion en meeting, volontariat pour aide, rdv plus tard pour partage, résolution au prochain meeting

##### Expérience générale au sein du groupe

// bonne entente grâce à la bonne communication, ajustements nécessaires au début, prise de rythme rapide, échanges réguliers, etc.

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