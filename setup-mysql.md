# Ce fichier à pour but d'expliquer comment installer MySQL et Importer la base de données

## Installation de MySQL
* On commence par installer MySQL avec la commande :
```shell
sudo apt install mysql-server
```
* On s'assure qu'il focntionne correctement avec la commande : 
```shell
sudo systemctl start mysql.service
```
## Configuration de MySQL 
### Configuration sécurité

* On ouvre MySQL avec :
```shell
sudo mysql
```
* On configure un nouveau mot de passe pour l'utilisateur :
```shell
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
exit
```
* Désormais si l'on veut se connecter on doit rentrer : 
```shell 
mysql -u root -p
```
* Mais on peut ajouter la commande : 
```shell
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
``` 
Désormais, pour ouvrir My SQL on tapera seulement 

     sudo mysql

* On rentre ensuite les paramètres de sécurité (Force mot de passe, mot d epasse, etc) avce la commande :
```shell
sudo mysql_secure_installation
```
### Configuration utilisateur
On va maintenant devoir créer un utilisateur pour utiliser MySQL:

* Après être entré dans mysql avec la commande sudo mysql on crée un nouvel utilisateur avec un nouveau mot de passe : 
```shell
CREATE USER 'nouvel_utilisateur'@'localhost' IDENTIFIED BY 'mot_de_passe';
```
* On lui accorde tous les privilèges pour ne pas être restreint :
```shell
GRANT ALL PRIVILEGES ON *.* TO 'nouvel_utilisateur'@'localhost';
```
* Pour que la commande eprenne effet, on écrit : 
```shell
FLUSH PRIVILEGES
```

## Importation de la base de données 

* On télécharge le fichier avec :
```shell
wget  https://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip
```
* On dézippe le fichier :
```shell
unzip /home/user/mysqlsampledatabe.zip
```
* On ouvre le fichier de base de données dans MySQL et on regarde les bases de données qu'il contient :
```shell
sudo mysql
```
On est maintenant dans mysql:
```shell
source <nom du dossier sql>
show databases;
```
On voit toutes les bases de données importer par le fichier backup.

