
# NosDeputes PostgREST API

Le but dans l'immédiat est de faciliter le prototypage du frontend grâce a une exposition complète des données en local
Sur le long terme cette branche vise a explorer les possibilisées qu'offre PostgREST pour le développement de nosdeputes.fr

## Les Fonctionnalités

Un fois que vous aurez lancé docker-compose vous pourrez accéder a:

-   [http://localhost:4001/](http://localhost:4001/) : **Une API complète** qui permet d'exposer toutes les données de nosdeputes.fr de manière simple et très flexible.

-   [http://localhost:4002/](http://localhost:4002/) : La base de donnée **PostgreSQL** qui remplace a base MariaDB
    
-   [http://localhost:4003/](http://localhost:4003/) : Une instance **Adminer** qui sert de GUI minimalist et rapide pour la DB
    
-   [http://localhost:4004/](http://localhost:4004/) : Une instance **SwaggerUI** qui documente l'API et permet d'essayer des requêtes.
    

## Utiliser l'API

L'API fournit un endpoint par table avec sur chaque endpoint les méthodes GET, POST, PATCH, DELETE.

Ce qui est vraiment fort avec PostgreSQL c'est qu'il est possible de **filtrer, paginer, et sélectionner les relation** comme bon vous semble.

Par exemple: 

> [http://localhost:4001/parlementaire](http://localhost:4001/parlementaire)
> => retourne la liste complete des parlementaires
> 
> [http://localhost:4001/parlementaire?id=eq.434=](http://localhost:4001/parlementaire?id=eq.434=)
> => retourne le profile de Sandra Regol  
> 
> [http://localhost:4001/parlementaire?nom=eq.Sandra%20Regol](http://localhost:4001/parlementaire?nom=eq.Sandra%20Regol)
> => retourne aussi le profile de Sandra Regol, mais cette fois  on a utilise sont nom pour la trouver

**Notez bien la présence de `eq.`** dans la requête. Avec PostgREST chaque valeur est précédé d'un comparateur:  
eq => equals  
gt => greater than  
like => SQL LIKE  
fts => Full-Text Search en utilisant to_tsquery

Il y en a bien plus (27 pour être exacte) et ils permettent **d'exploiter tout le potentielle de SQL**. Vous pouvez consulter la liste complète ici: [https://postgrest.org/en/stable/api.html](https://postgrest.org/en/stable/api.html)

Le champ `select` permet de choisir les **colonnes a charger** ainsi que les **relation a charger**. Par exemple: 

> http://localhost:4001/parlementaire?select=slug 
> => vous permet de lister juste les slugs des députés

Quand vous voulez accéder a une relation il vous suffit de mettre le nom de la seconde table dans le select avec entre parenthèse les colonnes voulue dans cette table :

> http://localhost:4001/parlementaire?id=eq.434&select=id,nom,question_ecrite(id,themes))
> => Retourne les thématiques des questions écrites par la député 434

Pour les relations toute la documentation est disponible ici: https://postgrest.org/en/stable/api.html#resource-embedding

Pour paginer vous avez accès a  plusieurs fonction:  `order`, `offset`, l`imit`, `range`. Attention vous devez préciser `Prefer: count=exact` dans le header de la requête si vous voulez un count exacte. 

**L'API peut repondre a n'importe quel requete au format JSON ou CSV**. Voir https://postgrest.org/en/stable/api.html#response-format
pour les details. Le XML peut aussi etre activé dans le future. 


## Comment l'installer

**⚠️ Prérequis : avoir docker d'installé ⚠️**

 1. Vous clonez cette branche du repos
 2. Vous ouvrez un terminale dans le dossier et exécutez `docker-compose up` ( vous pouvez ajouter `-d` pour être en mode détaché)
 3. accédez a http://localhost:4003/, vous devriez tomber sur la page de connexion de Adminer. Remplissez le formulaire; 
	  - **Systeme:** PostgreSQL
	  - **Server:** db
	  - **Password:** postgre
	  - **Database:** nosdeputes
 4. Un fois connecte accédez a la page import (http://localhost:4003/?pgsql=db&username=nosdeputes&db=nosdeputes&ns=public&import=). Cliquez sur `Choose files` et importez le fichier `postgre_nosdeputes_2022-10-06.gz` qui se trouve dans le dossier data du repos.  
 5. Relancez docker-compose avec `docker-compose down` puis `docker-compose up` (ca permet de refresh le schema de l'API)

**C'est bon vous avez finit!** Vous pouvez maintenant consulter le [swager](http://localhost:4004/)  et tester [l'API](http://localhost:4001/)!


## Et la suite c'est quoi?

Il reste beaucoup d'exploration a faire, notamment: 
- **Gestion des secrets.** C'est pas possible de publier en production avec les identifiant de la DB directement dans le fichier docker-compose XD. 
- **Gestion d'accès.** Pour restreindre les utilisateurs non identifier a seulement la méthode GET.
- **Fonction d'agréation**: Pour faciliter le calcule de stats 
- **Support XML** Cest juste un peu de configuration faire. 
- **Melanger PostgREST API avec une api traditionelle sur certains endpoint?** Pour plus de flexibilité.