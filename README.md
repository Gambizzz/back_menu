## MENU API
Projet final de groupe : Mise en place d'une application Rails en API
* Authentification de l'admin et de l'user : Devise, Devise-jwt
* Mailer : Mailjet
* Base de donnée : PostgreSQL
### Liens
* [Lien github front-end](https://github.com/Gambizzz/front_menu.git "Lien github front-end")
* [Lien en production front-end](https://front-menu.onrender.com/ "Lien en production front-end")

## Installation local
* Ruby 3.2.2
* Rails 7.1.3

Clone repository
```bash
git clone [lien SSH]
```
Installation des dépendances
```bash
cd [nom_du_dossier_back]
bundle install
```
Création de la base de donnée
```bash
rails db:create
rails db:migrate
rails db:seed
```
Lancement du serveur
```bash
rails server
```

## Environnement variables
Ajouter les variables dans le fichier .env
* Mailjet
    * MJ_API_KEY
    * MJ_SECRET_KEY
    * MJ_DEFAULT_FROM
* Devise-jwt
    * JWT_SECRET_KEY
 
## La Team
* [Anelise GAMBINI](https://github.com/Gambizzz)
* [Benedicte TRAN](https://github.com/Jokeraware)
* [Nicolas BALDO](https://github.com/NicolasBaldo)
* [Nicolas VANBREUSEGEM](https://github.com/yeezynico)
