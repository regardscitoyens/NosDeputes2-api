# A faire

## Creer une migration pour mettre a jour les sequence d'auto-increment

Si vous faites `SELECT last_value FROM organisme_id_seq ;`, vous verez que toutes les seqence d'id sont a 1. 
Il faut ecrire quelque chose du genre `ALTER SEQUENCE parlementaire_id_seq RESTART WITH 599;` avec le bon chiffre pour chaque sequence. 







# Finit
