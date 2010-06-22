
-- -----------------------------------------------------
-- Table "queroSair"."Local"
-- -----------------------------------------------------
CREATE  TABLE "queroSair"."Local" (
  "id" INT NOT NULL IDENTITY ,
  "nome" VARCHAR(45) NULL ,
  "logradouro" VARCHAR(100) NULL ,
  "bairro" VARCHAR(25) NULL ,
  "cidade" VARCHAR(25) NULL ,
  "uf" VARCHAR(2) NULL ,
  "cep" VARCHAR(9) NULL ,
  "telefone" VARCHAR(13) NULL ,
  "celular" VARCHAR(45) NULL ,
  PRIMARY KEY ("id") )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "queroSair"."Usuario"
-- -----------------------------------------------------
CREATE  TABLE  "queroSair"."Usuario" (
  "id" INT NOT NULL AUTO_INCREMENT ,
  "nome" VARCHAR(45) NULL ,
  "login" VARCHAR(10) NULL ,
  "senha" VARCHAR(10) NULL ,
  "logradouro" VARCHAR(100) NULL ,
  "bairro" VARCHAR(25) NULL ,
  "cidade" VARCHAR(25) NULL ,
  "uf" VARCHAR(2) NULL ,
  "cep" VARCHAR(9) NULL ,
  "telefone" VARCHAR(13) NULL ,
  "email" VARCHAR(45) NULL ,
  "celular" VARCHAR(13) NULL ,
  PRIMARY KEY ("id") )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "queroSair"."Comentario"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "queroSair"."Comentario" (
  "id" INT NOT NULL AUTO_INCREMENT ,
  "corpo" VARCHAR(1000) NULL ,
  "autor" VARCHAR(45) NULL ,
  "emailAutor" VARCHAR(45) NULL ,
  PRIMARY KEY ("id") )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "queroSair"."Midia"
-- -----------------------------------------------------
CREATE  TABLE "queroSair"."Midia" (
  "id" INT NOT NULL AUTO_INCREMENT ,
  "nome" VARCHAR(45) NULL ,
  "tipo" INT NULL ,
  "foto" BYTE NULL ,
  "video" VARCHAR(1000) NULL ,
  PRIMARY KEY ("id") )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "queroSair"."TipoEvento"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "queroSair"."TipoEvento" (
  "id" INT NOT NULL AUTO_INCREMENT ,
  "nome" VARCHAR(45) NULL ,
  "descricao" VARCHAR(250) NULL ,
  PRIMARY KEY ("id") )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "queroSair"."Evento"
-- -----------------------------------------------------
CREATE  TABLE "queroSair"."Evento" (
  "id" INT NOT NULL AUTO_INCREMENT ,
  "responsavel" VARCHAR(45) NULL ,
  "tag" VARCHAR(1000) NULL ,
  "telefone" VARCHAR(13) NULL ,
  "celular" VARCHAR(13) NULL ,
  "twitter" VARCHAR(100) NULL ,
  "Comentario_id" INT NOT NULL ,
  "Midia_id" INT NOT NULL ,
  "TipoEvento_id" INT NOT NULL ,
  "Usuario_id" INT NOT NULL ,
  PRIMARY KEY ("id", "Comentario_id", "Midia_id", "TipoEvento_id", "Usuario_id") ,
  INDEX "fk_Evento_Comentario1" ("Comentario_id" ASC) ,
  INDEX "fk_Evento_Midia1" ("Midia_id" ASC) ,
  INDEX "fk_Evento_TipoEvento1" ("TipoEvento_id" ASC) ,
  INDEX "fk_Evento_Usuario1" ("Usuario_id" ASC) ,
  CONSTRAINT "fk_Evento_Comentario1"
    FOREIGN KEY ("Comentario_id" )
    REFERENCES "queroSair"."Comentario" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Evento_Midia1"
    FOREIGN KEY ("Midia_id" )
    REFERENCES "queroSair"."Midia" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Evento_TipoEvento1"
    FOREIGN KEY ("TipoEvento_id" )
    REFERENCES "queroSair"."TipoEvento" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Evento_Usuario1"
    FOREIGN KEY ("Usuario_id" )
    REFERENCES "queroSair"."Usuario" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table "queroSair"."Evento_Local"
-- -----------------------------------------------------
CREATE  TABLE "queroSair"."Evento_Local" (
  "Evento_id" INT NOT NULL ,
  "Evento_TipoEvento_id" INT NOT NULL ,
  "Evento_Tag_id" INT NOT NULL ,
  "Local_id" INT NOT NULL ,
  "dataInicio" DATE NULL ,
  "horaInicio" TIME NULL ,
  "dataFim" DATE NULL ,
  "horaFim" TIME NULL ,
  PRIMARY KEY ("Evento_id", "Evento_TipoEvento_id", "Evento_Tag_id", "Local_id") ,
  INDEX "fk_Evento_has_Local_Evento1" ("Evento_id" ASC, "Evento_TipoEvento_id" ASC, "Evento_Tag_id" ASC) ,
  INDEX "fk_Evento_has_Local_Local1" ("Local_id" ASC) ,
  CONSTRAINT "fk_Evento_has_Local_Evento1"
    FOREIGN KEY ("Evento_id" , "Evento_TipoEvento_id" , "Evento_Tag_id" )
    REFERENCES "queroSair"."Evento" ("id" , "TipoEvento_id" , "Tag_id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_Evento_has_Local_Local1"
    FOREIGN KEY ("Local_id" )
    REFERENCES "queroSair"."Local" ("id" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
