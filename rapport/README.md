# Rapport de projet

##### Nom : Management de Session Windows

##### Contexte : Cours de PRO - HEIG-VD 2020

##### Professeur encadrant : Jean-Marc Bost

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

// todo : écrire une introduction

## Planification

// todo : à la fin, comparer notre planification initiale et réelle, commenter brièvement

## Analyse

// todo : Ici on mettrait les recherches effectuées, et documenterait ce qu'on a utilisé d'existant.

// NOTE : J'ai mis ce que j'ai utilisé moi, c'est bien si tout le monde peut compléter (@Sicriss)

### Description de l'existant

##### Protocole réseau

Nos recherches sur les échanges client - serveur en C# nous ont très rapidement conduit sur le namespace [Sockets](https://docs.microsoft.com/en-us/dotnet/api/system.net.sockets?view=netcore-3.1) que nous avons pu utiliser.

##### Multi-threading

Naturellement le C# possède une implémentation native des threads que nous avons ré-utilisée comme telle grâce à la [documentation](https://docs.microsoft.com/en-us/dotnet/api/system.threading.thread?view=netcore-3.1) de Microsoft.

##### Sécurité

Comme mentionné dans le cahier des charges, il était impératif de se baser sur des fonctions existantes pour la sécurité qui n'est pas un domaine que l'on pouvait se permettre de ré-implémenter. Bien heureusement ...[todo selon choix]



## Implémentation

// todo : ici on documente tout ce qui est des choix personnels d'implé + spécificités techniques ?

## Tests

// todo : un résumé/listing de nos tests, à ajouter à la fin

## Conclusion

// todo : quelqu'un d'inspiré pourra écrire une conclusion

## Références

// todo : seems obvious

## Annexes

* Les journaux de travail des divers membres du projet
* Une procédure d'installation
* Un manuel d'utilisation, il présente les cas d'utilisations classiques
* Les sources du projet

// todo : peut-être des ajouts.