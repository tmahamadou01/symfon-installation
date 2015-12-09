#Message de Bienvenue
echo "Welcome to installation Symfony 2"

#Mise a jour des Paquets
sudo apt-get update

#Installation de Curl
sudo apt-get install php5-curl

#Redemarrage du Service Apache 2 
sudo /etc/init.d/apache2 restart

#installation de Composer
# --filename=composer te permettra d'executer composer et non plus composer.phar
curl -sS https://getcomposer.org/installer | php -- --filename=composer

#Creation de la commande Symfony comme Commande Système
sudo curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

#Creation du Dossier du Projet
echo "Enter le nom de votre projet:"
read sitedir

#On creer le dossier
sudo mkdir ${sitedir}

#On attribut les droits
sudo chmod -R 777 ${sitedir}

#On test l'existence du nouveau dossier creer
#s'il existe pas :
if [ -d ${sitedir} ]:
then
	#on installe Symfony dans le dossier
    symfony new ${sitedir}
	#on lui demande a nouveau de creer
    
	#Sinon si le dossier existe
else
    echo "installation interrompu"
    exit
fi

#on execute cette commande pour entrer dans le dossier
cd ${sitedir}

#On install composer
composer install

#On clone le dossier bash avec le script
git clone https://github.com/tmahamadou01/bash.git

#On attribue les droit au dossier bash
sudo chmod -R 777 bash

#On execute le fichier pour attribuer les droits au cache
sudo sh bash/chmod.sh
