#!/bin/bash



LISTEDB=$(echo 'show databases' | mysql -u anthony --password=Kopate-64)   #On liste nos bases de données
CHEMIN="/home/anthony/Documents/sauvegarde_DB"    #On choisit l'emplacement de la base de données
DATE="$(date +%Y-%m-%d-%H-%M-%S)"            #On horodate le fichier
LOG="/var/log/database.log"     #On indique le fichier dans lequel on va envoyer les logs

exec &>> $LOG     #On crée ce fichier
echo "Recherche des bases de donnée">> $LOG;


for DB in $LISTEDB; do       #Dans la liste de toutes les DB, on va sélectionner classicmodels et backup seulement celle-ci
	if [ $DB = "classicmodels" ]; then
         mysqldump -u anthony --password=Kopate-64 "$DB" >"$CHEMIN/${DB}_${DATE}.sql" #On backup notre DB dans un seul fichier
	
    bzip2 "$CHEMIN/${DB}_${DATE}.sql" #On compresse ce fichier au format .bz2 ; (penser à installer bzip2 avant depuis le temrinal) 
	echo "Sauvegarde de la base de données $DB.sql dans le dossier sauvegarde_DB">> $LOG;
    fi
done


n=1
for file in $(ls -t /home/anthony/Documents/sauvegarde_DB/*.bz2); do #On selectionne les fichiers du type .bz2
    if [ $n -gt 5 ]; then                                        #Et on tant qu'il y en a plus de 5 on supprime en partant du plus ancien
        rm $file

    fi
    ((n = n + 1))

done







echo "$(tail -n 30 $LOG)" > $LOG  #On réduit la taille du fichier LOG à 20 lignes pour limiter son volume
                                  #Je n'ai pas réussi à mettre en place une méthode plus efficace agissant directement sur la taille du fichier



#Fin du script