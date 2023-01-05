# Ce fichier a pour but d'expliquer commment configurer le service

* On commence par donner la possibilité à notre script de s'exécuter :
```shell
chmod +x dump-database.sh
```
On l'exècute :
```shell
./dump-database.sh
```
* On va ensuite créer notre service:
```shell
sudo nano /lib/systemd/system/dump-database.service
```

Cela nous envoie dans un nano où l'on pourra rédiger notre service.

Pour que le système prenne en compte les modifications
apportées aux services, il faut lancer la commande :
```shell
sudo systemctl deamon-reload
```


* On va ensuite s'intéresser un démarage du service :
On veut que le script se lance au démarage : 
```shell 
sudo systemctl enable dump-database.service
```
On lance notre service :
```shell
sudo systemctl start dump-database.service
```
Pour vérifier son statut on écrit:
```shell
sudo systemctl status dump-database.service
```
La syntaxe doit être correcte.

* NB: On passera par les mêmes étapes pour créer le timer avec "dump-database.timer".


