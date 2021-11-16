
CREATE DATABASE db_libreria;

USE db_libreria;

CREATE TABLE Usuario(

    Id_usuario      bigint(20) auto_increment NOT NULL,
    Nombre          varchar(50) 	            NOT NULL,
    PrimerApellido  varchar(50) 	            NOT NULL,
    SegundoApellido varchar(50)               NOT NULL,
    Rol             varchar(15)               NOT NULL,
    Usuario         varchar(35)               NOT NULL UNIQUE,
    Contrasena      varchar(50)               NOT NULL,
    FechaCaptura    datetime        	        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          int(1)                    NOT NULL DEFAULT'1',
    PRIMARY KEY (Id_usuario)

      )ENGINE = INNODB;

CREATE TABLE Imagenes(

    Id_imagen   bigint(20) auto_increment NOT NULL,
    Nombre      varchar(50)               NOT NULL,
    Ruta 	      varchar(250)              NOT NULL UNIQUE,
    FechaSubida datetime        	        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status      int(1)                    NOT NULL DEFAULT'1',
    PRIMARY KEY (Id_imagen)

      )ENGINE = INNODB;

CREATE TABLE Autor(

    Id_autor        bigint(20) auto_increment NOT NULL,
    Codigo          int(5)                    NOT NULL UNIQUE,
    Nombre          varchar(50)               NOT NULL,
    PrimerApellido  varchar(50)               NOT NULL,
    SegundoApellido varchar(50)               NOT NULL,
    Nacionalidad    varchar(50)               NOT NULL,
    FechaNacimiento date                      NOT NULL,
    FechaCaptura    datetime        	        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          int(1)                    NOT NULL DEFAULT'1',
    PRIMARY KEY (Id_autor)

      )ENGINE = INNODB;

CREATE TABLE Tema(

    Id_tema      bigint(20) auto_increment NOT NULL,
    Codigo       int(5)                    NOT NULL UNIQUE,
    Nombre       varchar(100) 	           NOT NULL UNIQUE,
    FechaCaptura datetime                  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status       int(1)                    NOT NULL DEFAULT'1',
    PRIMARY KEY(Id_tema)

      )ENGINE = INNODB;


CREATE TABLE Editorial(

    Id_editorial 	  bigint(20) auto_increment NOT NULL,
    Contacto_id     bigint(20)         	      NOT NULL,
    Codigo          int(5)                    NOT NULL UNIQUE,
    Editorial       varchar(100) 	            NOT NULL UNIQUE,
    Telefono 	      bigint(20)                NOT NULL,
    FechaCaptura    datetime        	        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          int(1)                    NOT NULL DEFAULT'1',
    PRIMARY KEY(Id_editorial),
    INDEX fk_Editorial_Contacto1_idx (Contacto_id ASC)

      )ENGINE = INNODB;


CREATE TABLE Contacto(

    Id_contacto     bigint(20) auto_increment NOT NULL,
    Nombre          varchar(50)	              NOT NULL,
    PrimerApellido  varchar(50)               NOT NULL,
    SegundoApellido varchar(50)               NOT NULL,
    FechaCaptura    datetime        	        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          int(1)                    NOT NULL DEFAULT'1',
    PRIMARY KEY(Id_contacto)

      )ENGINE = INNODB;


CREATE TABLE Libro(

    Id_libro        bigint(20)  auto_increment NOT NULL,
    ISBN            varchar(15) 	             NOT NULL UNIQUE,
    Titulo	        varchar(100) 	             NOT NULL,
    Editorial       varchar(100) 	             NOT NULL,
    FechaEdicion    date 		                   NOT NULL,
    Tema 		        text         	             NOT NULL,
    Precio 		      double 		                 NOT NULL,
    status          int(1)                     NOT NULL DEFAULT'1',
    FechaCaptura    datetime        	         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Autor_id        bigint(20) 		             NOT NULL,
    Tema_id         bigint(20) 		             NOT NULL,
    Editorial_id    bigint(20) 		             NOT NULL,
    Imagen_id       bigint(20) 		             NOT NULL,
    PRIMARY KEY(Id_libro),
    INDEX fk_Libro_Autor_idx (Autor_id ASC) ,
    INDEX fk_Libro_Tema_idx (Tema_id ASC) ,
    INDEX fk_Libro_Editorial_idx (Editorial_id ASC) ,
    INDEX fk_Libro_imagenes_idx (Imagen_id ASC)

      )ENGINE = INNODB;

ALTER TABLE Usuario
ADD CONSTRAINT indiceUsuarios UNIQUE(Nombre, PrimerApellido, SegundoApellido);

ALTER TABLE Autor
ADD CONSTRAINT indiceUsuarios   UNIQUE(Nombre, PrimerApellido, SegundoApellido),
ADD CONSTRAINT CHK_Codigo_Autor CHECK (Codigo > 0 );

ALTER TABLE Tema
ADD CONSTRAINT CHK_Codigo_Tema CHECK ( Codigo > 0);

ALTER TABLE Editorial
ADD CONSTRAINT CHK_Info_Editorial    CHECK (Codigo > 0 AND  Telefono >= 10 ),
ADD CONSTRAINT editorial_contacto_fk FOREIGN KEY (Contacto_id)  REFERENCES contacto(Id_contacto) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Contacto
ADD CONSTRAINT indiceContactos UNIQUE(Nombre, PrimerApellido, SegundoApellido);

ALTER TABLE Libro
ADD CONSTRAINT libro_autor_fk     FOREIGN KEY (Autor_id)     REFERENCES autor(Id_autor)         ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT libro_tema_fk      FOREIGN KEY (Tema_id)      REFERENCES tema(Id_tema)           ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT libro_editorial_fk FOREIGN KEY (Editorial_id) REFERENCES editorial(Id_editorial) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT libro_imagen_fk    FOREIGN KEY (Imagen_id)    REFERENCES imagenes(Id_imagen)     ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT CHK_Libro_Precio   CHECK ( Precio > 1.0 );

/*Insert de Prueba*/
/*select * from autor;*/
INSERT INTO Autor(Codigo,Nombre,PrimerApellido,SegundoApellido,Nacionalidad,FechaNacimiento) VALUES(14725,'Daniel','Gomez','Perez','Méxicana','1999-08-30');
/*select * from contacto;*/
INSERT INTO Contacto(Nombre,PrimerApellido,SegundoApellido) values('Erick','Silva','Paredes');
/*select * from editorial;*/
INSERT INTO Editorial(Contacto_id,Codigo,Editorial,Telefono) values(1,12345,'La Garto',5874963214);
/*SELECT * FROM tema;*/
INSERT INTO Tema(Codigo,Nombre) VALUES(14789,'Misterio');
/*select * from usuario;*/
insert into Usuario(Nombre,PrimerApellido,SegundoApellido,Rol,Usuario,Contrasena) VALUES('Armando','Jiménez','Teodoro','Admin','Teo',1234);
/*select * from imagenes;*/
insert into Imagenes(Nombre,Ruta) values('picture','cd/cd/cd');
/*select * from libro;*/
insert into Libro(ISBN,Titulo,Editorial,FechaEdicion,Tema,Precio,Autor_id,Tema_id,Editorial_id,Imagen_id) values('12-1448-147-2','El niño perdido','porua','2001-04-22','Un niño perdido',47.1,1,1,1,1);
