# TODO

<!-- install maria db -->

coder une api vraiment basique, très fidèle à la db, faire au plus simple

# notes sur les tables :

alerte : table contenant tous les abonnements à des alertes mails
alinea : alinéas qui constituent projet de loi
amendement : les amendemdent
article : contenu éditorial de la plateforme
article_loi : les articles d'un projet de loi
article_version : version des contenus éditoriaux
citoyen : les utilisateurs de la plateforme
commentaire : les commentaires
commentaire_object : lien entre un commentaire et un objet commentable
intervention : les interventions des parlementaires
object_commentable : une abstraction des objets commentable (héritage)
object_rated : une abstraction des objets ratables
organisme : les organismes parlementraires (ou extra) : groupes, commissions, ...
parlementaire : les parlementaires
parlementaire_amendement : liens entre parlementaires et amendmenets
parlementaire_organisme : liens entre parlementaires et organismes
parlementaire_photo : photos des parlementaires
parlementaire_texteloi : liens entre parlementaire et un projet de loi
personnalite : personnes auditionnées en commission ou s'étant exprimée au sein du parlement n'étant pas un parlementaire de cette chambre (ministre, personnalité qualifiée, ...)
presence : présence des parlementaires
preuve_presence : lien entre une présence et un document attestant de cette présence
question_ecrite : questions écrites
rate : note attribuée à un utilisateur sur un contenu ratable
seance : séances publiques (hémicycle ou commission)
section : section d'un projet de loi
tag : mot clé
tagging : association entre mot clé et interventions
texteloi : documents parlementaires : projet de loi / rapports / ...
titre_loi : projet de loi mis en discussion sur simplifions
variable_globale : variables de configurations ou stockage (tops, ...)

schema https://github.com/regardscitoyens/nosdeputes.fr/blob/master/doc/data_model.md

# manage local mariadb

    brew info mariadb

    brew services restart mariadb

    # login (need to wait ~1min after mariadb start)
    mysql

    # login as root
    sudo mysql -u root

Tips for first install
https://stackoverflow.com/questions/50453078/unable-to-connect-to-mariadb-using-dbeaver
user is manu/password

# comment récupérer le dernier dump en local

https://data.regardscitoyens.org/nosdeputes.fr/

prendre "nosdeputes.fr_donnees.sql.gz"
Décompresser l'archive

    sudo mysql -u root

    SHOW DATABASES;
    DROP DATABASE nosdeputes;
    CREATE DATABASE nosdeputes;

    (exist mysql prompt)

    (check than you can connect with manu/password)

    mysql -u manu -p nosdeputes
    SHOW TABLES;

    (exit again)
    (import the dump)

    mysql -u manu -p nosdeputes < ~/Desktop/nosdeputes.fr_donnees.sql
