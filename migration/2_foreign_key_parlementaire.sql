/*
⚠️ Des erreurs empeche la creation de certaine foreigne key ⚠️

parlementaire.slug ne peut pas etre lié a personalite.slug
  => Key (slug)=(thibault-bazin) is not present in table "personnalite".

preuve_presence.presence_id ne peut pas etre lié a presence.id 
  => Key (presence_id)=(872) is not present in table "presence".

⚠️ "texteloi_id" est de type "character varying(16)" parce aue des fois ya du putain de text dans sont id ⚠️

*/


-- parlementaire_amendement
ALTER TABLE "parlementaire_amendement"
ADD FOREIGN KEY ("parlementaire_id") REFERENCES "parlementaire" ("id");

ALTER TABLE "parlementaire_amendement"
ALTER "amendement_id" TYPE bigint USING amendement_id::bigint,
ALTER "amendement_id" DROP DEFAULT;

ALTER TABLE "parlementaire_amendement"
ADD FOREIGN KEY ("amendement_id") REFERENCES "amendement" ("id");


-- parlementaire_organisme
ALTER TABLE "parlementaire_organisme"
ADD FOREIGN KEY ("organisme_id") REFERENCES "organisme" ("id"),
ADD FOREIGN KEY ("parlementaire_id") REFERENCES "parlementaire" ("id");


-- parlementaire_photo
ALTER TABLE "parlementaire_photo"
ADD FOREIGN KEY ("slug") REFERENCES "parlementaire" ("slug");


-- parlementaire_scrutin
ALTER TABLE "parlementaire_scrutin"
ADD FOREIGN KEY ("scrutin_id") REFERENCES "scrutin" ("id"),
ADD FOREIGN KEY ("parlementaire_id") REFERENCES "parlementaire" ("id");


-- parlementaire_texteloi
ALTER TABLE "parlementaire_texteloi"
ADD FOREIGN KEY ("parlementaire_id") REFERENCES "parlementaire" ("id"),
ADD FOREIGN KEY ("texteloi_id") REFERENCES "texteloi" ("id");


-- presence
ALTER TABLE "presence"
ADD FOREIGN KEY ("parlementaire_id") REFERENCES "parlementaire" ("id"),
ADD FOREIGN KEY ("seance_id") REFERENCES "seance" ("id");


-- question_ecrite
ALTER TABLE "question_ecrite"
ADD FOREIGN KEY ("parlementaire_id") REFERENCES "parlementaire" ("id");


-- scrutin
ALTER TABLE "scrutin"
ADD FOREIGN KEY ("seance_id") REFERENCES "seance" ("id");

ALTER TABLE "scrutin"
ALTER "texteloi_id" TYPE character varying(16);

ALTER TABLE "scrutin"
ADD FOREIGN KEY ("texteloi_id") REFERENCES "texteloi" ("id");

ALTER TABLE "scrutin"
ADD FOREIGN KEY ("amendement_id") REFERENCES "amendement" ("id");

-- sceance
ALTER TABLE "seance"
ADD FOREIGN KEY ("organisme_id") REFERENCES "organisme" ("id");


-- texteloi
ALTER TABLE "texteloi"
ADD FOREIGN KEY ("organisme_id") REFERENCES "organisme" ("id")

