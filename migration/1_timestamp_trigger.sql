

/* Set default value for when inserting to now() */
ALTER TABLE alinea
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE amendement
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE article
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE article_version
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE intervention
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE organisme
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE parlementaire
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();
ALTER TABLE parlementaire_amendement
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE parlementaire_organisme
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE parlementaire_scrutin
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE parlementaire_texteloi
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE personnalite
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE presence
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE preuve_presence
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE question_ecrite
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE scrutin
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE seance
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE section
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE texteloi
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE titre_loi
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

ALTER TABLE variable_globale
ALTER "created_at" SET DEFAULT now(),
ALTER "updated_at" SET DEFAULT now();

/* Add moddatetime extemsin to facilitate the creation of update trigger   */
CREATE EXTENSION moddatetime;

/* Create the update triggers */

CREATE TRIGGER update_alinea
  BEFORE UPDATE ON alinea
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);

CREATE TRIGGER update_amendement
  BEFORE UPDATE ON amendement
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);

CREATE TRIGGER update_article
  BEFORE UPDATE ON article
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);

CREATE TRIGGER update_article_version
  BEFORE UPDATE ON article_version
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_intervention
  BEFORE UPDATE ON intervention
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_organisme
  BEFORE UPDATE ON organisme
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_parlementaire
  BEFORE UPDATE ON parlementaire
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_parlementaire_amendement
  BEFORE UPDATE ON parlementaire_amendement
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_parlementaire_organisme
  BEFORE UPDATE ON parlementaire_organisme
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_parlementaire_scrutin
  BEFORE UPDATE ON parlementaire_scrutin
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_parlementaire_texteloi
  BEFORE UPDATE ON parlementaire_texteloi
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_personnalite
  BEFORE UPDATE ON personnalite
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_presence
  BEFORE UPDATE ON presence
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_preuve_presence
  BEFORE UPDATE ON preuve_presence
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_question_ecrite
  BEFORE UPDATE ON question_ecrite
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_scrutin
  BEFORE UPDATE ON scrutin
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_seance
  BEFORE UPDATE ON seance
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_section
  BEFORE UPDATE ON section
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_texteloi
  BEFORE UPDATE ON texteloi
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_titre_loi
  BEFORE UPDATE ON titre_loi‘_u
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);


CREATE TRIGGER update_variable_globale
  BEFORE UPDATE ON variable_globale
  FOR EACH ROW
  EXECUTE PROCEDURE moddatetime(updated_at);



