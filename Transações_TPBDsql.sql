-- LançarAlbum -> album, albumgenero, bandaalbumeditora
delimiter $$
CREATE PROCEDURE Tr_LancarAlbum(IN albumI INT, IN dataI DATE, IN TituloI VARCHAR(100), IN TipoI VARCHAR(100), IN DuracaoI INT, 
								IN generoI INT, IN bandaI INT, IN editoraI INT, IN formatoI VARCHAR(100), 
								IN datalancamentoI DATE, IN nrcopiasI INT)
BEGIN
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro=1;
START TRANSACTION;

INSERT INTO album (idAlbum, Data, Titulo, Tipo, Duracao)
	VALUES (albumI, dataI, TituloI, TipoI, DuracaoI);
INSERT INTO albumgenero(album, genero)
	VALUES (albumI, generoI);
INSERT INTO bandaeditoraalbum(Banda, Album, Editora, Formato, Datalancamento, Nrcopias)
	VALUES (bandaI, albumI, editoraI, formatoI, datalancamentoI, nrcopiasI);

IF Erro THEN ROLLBACK;
	ELSE COMMIT;
END IF;
	
END $$
DELIMITER ;


-- CriarMembroParaBanda -> membro, membrobanda, membrobandafuncao
delimiter $$
CREATE PROCEDURE Tr_CriarMembroBanda(IN membroI INT, IN dataNascimentoI DATE, IN NomeI VARCHAR(100), IN PaisI INT, 
								IN BandaI INT, IN eDataI DATE, IN bDataI DATE, IN DescricaoI VARCHAR(100))
BEGIN
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro=1;
START TRANSACTION;

INSERT INTO membro (idMembro, DataNascimento, Nome, Pais)
	VALUES (membroI, dataNascimentoI, NomeI, PaisI);
INSERT INTO membro_banda(membro, banda, bData, eData)
	VALUES (membroI, bandaI, bDataI, eDataI);
INSERT INTO membro_banda_funcao (Descricao, Membro, Banda, bData)
	VALUES (DescricaoI, membroI, bandaI, bDataI);

IF Erro THEN ROLLBACK;
	ELSE COMMIT;
END IF;
	
END $$
DELIMITER ;


-- Musica -> Musica, AlbumMUsica
delimiter $$
CREATE PROCEDURE Tr_CriarMusica(IN musicaI INT, IN TituloI VARCHAR(100), IN LetraI TEXT, IN DuracaoI INT, IN AlbumI INT)
BEGIN
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro=1;
START TRANSACTION;

INSERT INTO musica (idMusica, Titulo, Letra, Duracao)
	VALUES (musicaI, TituloI, LetraI, DuracaoI);
INSERT INTO albummusica(album, musica)
	VALUES (albumI, musicaI);

IF Erro THEN ROLLBACK;
	ELSE COMMIT;
END IF;
	
END $$
DELIMITER ;



-- Adiconar membro c/ funcao a album-> membroalbumfuncao, membroalbum
delimiter $$
CREATE PROCEDURE Tr_AdicionarMembroAlbum(IN membroI INT, IN albumI INT, IN eConvidadoI BOOLEAN, IN DescricaoI VARCHAR(100))
BEGIN
DECLARE Erro BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET Erro=1;
START TRANSACTION;

INSERT INTO membroalbum (Membro, Album, eConvidado)
	VALUES (membroI, albumI, eConvidadoI);
INSERT INTO Membro_Album_Funcao(Descricao, Membro, Album)
	VALUES (DescricaoI,membroI,albumI);

IF Erro THEN ROLLBACK;
	ELSE COMMIT;
END IF;
	
END $$
DELIMITER ;

