# Suivi qualité

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



#### Principes de supervision

##### Organisation

Chaque semaine, nous nous sommes parlé au minimum à trois reprises. Pour ces rendez-vous, le chef de projet préparait un ordre du jour disponible sur Github afin de lister les sujets de discussion que nous devions aborder et les problèmes rencontrés auxquels il fallait trouver une solution. Ces problèmes émergeaient souvent entre deux meetings et étaient d'abord communiqués de manière informelle via le groupe Telegram. 

Avant le meeting, nous pouvions donc prendre connaissance de l'ordre du jour et proposer des modifications. Au terme de la réunion, un procès verbal était rédigé pour garder trace de ce qui s'était dit. 

Un outil que nous avons énormément utilisé lors de la réalisation de ce projet est Github. Celui-ci s'est révélé extrêmement utile pour l'organisation et pas seulement pour la mise en commun du code du projet. 

Pour la planification et l'attribution des tâches, nous avons utilisé les "issues" et les "milestones". Cela nous a permis de morceler le projet en dizaines de petites tâches à effectuer et de les classer selon l'urgence. Nous nous étions fixé un planning en établissant le cahier des charges et nous avons utilisé les outils mis à disposition sur Github pour le respecter au mieux. Les "issues" peuvent être attribuées à des membres du groupe, ce qui nous a laissé nous répartir le travail : quand un membre trouvait une tâche intéressante ou qu'il savait comment la réaliser, il pouvait simplement se l'assigner et ainsi, nous avons pu garder trace du travail de chacun. 

##### Révision du code

Toujours grâce à Github, nous avons pu mettre en place un système de "peer reviewing" en établissant comme règle que chaque "pull request" (PR) devait être validée par deux membres du groupe. Ainsi, chaque partie de code intégrée au projet était assurée de fonctionner car plusieurs personnes devaient la tester. Nous pouvions également commenter et modifier si besoin. Les commentaires pertinents étaient discutés lors des meetings pour que l'entièreté du groupe se mette d'accord. 

##### Spécifications du projet pour uniformisation 

Au début du projet, nous avons mis en place un document contenant toutes les spécifications concernant le projet. Ce document a permis au groupe de synchroniser les manières de faire et de coder afin d'obtenir un code plus uniforme. Etant donné que nous avons codé chacun de notre côté avant la mise en commun, il fallait que chaque morceau du projet puisse fonctionner avec l'ensemble. 

Nous avons donc pu nous baser sur ses spécifications. 

Lien : [Spécifications](https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07/blob/master/specs.md)

#### Contrôles effectués

Dès que la communication entre le serveur et les clients a été établie, chaque nouvelle fonctionnalité implémentée a été contrôlée et validée en la testant directement sur l'infrastructure à disposition. La validation du bon fonctionnement des fonctionnalités est basée sur des critères précis (détaillés dans le répertoire "RapportdeControle").

Nos exigences en terme de _gestion des logs_ nous ont permis de procéder au _debug_ et aux tests avec une visibilité en détails sur les opérations effectuées par les instances de notre logiciel. Ces dernières sont décrites plus en détails dans le document "Conception technique" situé [ici](https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/tree/master/rapport). 

#### Vérification des protocoles

Le suivi du projet peut être trouvé sur notre Git à cet [emplacement](https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Organisation). On y trouve les procès verbaux et les ordres du jour liés à nos meetings. 

Nous avons également gardé tout au long du projet un journal de travail rempli régulièrement par les membres du groupe. Ce journal se trouve sur notre Google Drive à cet [emplacement](https://drive.google.com/drive/u/1/folders/1sF0pq3aViTvDxD7CISzfavcqVbe3I243). 

Dans ce [répertoire](https://github.com/HEIGVD-PRO-A-07/HEIGVD-PRO-A-07-Documentation/tree/master/rapport/RapportDeControle), on peut trouver les résultats des tests effectués sur l'application pour contrôler le fonctionnement des travaux des membres du groupe. 