# Organisation du code

### Arborescence du code

``` bash
Projet [PRO]: 
│   LogHelper.cs
│   Main.cs
│   Program.cs
│
├──+bin
├──+obj
├──+Properties
│
├───protocol
│       Client.cs
│       Protocol.cs
│       Server.cs
│
├───Resources
│       windows - Copie.jpg
│       windows.jpg
│       windows.png
│       windows1.jpg
│
└───Utils
        ScreenCapture.cs
```

### Contenu du code

##### LogHelper.cs : 

Création et écriture de logs (informations, warnings, erreurs) pour garder trace des actions du serveur. 

##### Main.cs :

Affichage graphique du projet côté client "Professeur" avec la fenêtre Windows et les boutons nécessaires pour les actions prévues.

##### Program.cs :

Appel du main pour démarrer le projet.

##### Client.cs :

Gestion des callbacks côté client "Professeur" et "Elève" pour la demande d'envoi de captures d'écran et l'envoi effectif ainsi que pour le blocage et le déblocage des sessions "Elève" et que la récupération des groupes de classe avec les informations reliées. 

En résumé, ce fichier contient les fonctions gérant toutes les requêtes faites par le côté client "Professeur". 

##### Protocol.cs :

Ce fichier contient l'implémentation du protocole. On y trouve toutes les constantes exprimant les commandes envoyées et leur interprétation. On y crée la connexion au socket,  dans lequel on peut écrire et lire.

##### Server.cs :

Ce fichier contient toute la gestion du projet côté serveur : son démarrage, la création du socket liant le client au serveur, l'implémentation de la gestion des commandes envoyées depuis le client sur le serveur, l'authentification pour la connexion et la déconnexion des utilisateurs, la gestion des groupes et des utilisateurs ainsi que la génération de logs lors d'erreurs.

##### ScreenCapture.cs :

Ce fichier contient l'implémentation permettant la génération des bitmaps à partir des captures d'écran et conversion bidirectionnelle entre bitmap et string pour l'envoi des captures.