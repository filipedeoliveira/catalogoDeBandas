use tpbd;
delimiter $$
CREATE PROCEDURE albuns_by_banda(IN bandaI VARCHAR(100))
BEGIN

select titulo from album where idalbum in 
	( select album from bandaeditoraalbum where banda in
		( select idbanda from banda where nome= bandaI));
	
END $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE albuns_by_ano(IN ano int)
BEGIN

select titulo from album where idalbum in 
	( select album from bandaeditoraalbum where year(DataLancamento)=ano);
	
END $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE bandas_by_editora(IN editorai VARCHAR(100))
BEGIN

select nome from banda where idbanda in 
	( select banda from bandaeditoraalbum where editora in 
		(select ideditora from editora where nome=editorai ));
	
END $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE bandas_by_pais(IN paisI VARCHAR(100))
BEGIN

select nome from banda where pais in 
	( select idpais from pais where designacao=paisI );
	
END $$
DELIMITER ;



delimiter $$
CREATE PROCEDURE albuns_by_genero (IN generoI VARCHAR(100))
BEGIN

select titulo from album where idalbum in 
	( select album from albumgenero where genero in
		( select idgenero from genero where designacao = generoI));
	
END $$
DELIMITER ;

delimiter $$
CREATE PROCEDURE membros_by_banda (IN bandaI VARCHAR(100))
BEGIN

select nome from membro where idMembro in 
	( select membro from membro_banda where banda in
		( select idbanda from banda where nome = bandaI));
	
END $$
DELIMITER ;



delimiter $$
CREATE PROCEDURE albuns_by_membro_funcao (IN nomeI VARCHAR(100), IN funcaoI VARCHAR(100))
BEGIN

select titulo 
	from album as a inner join membroalbum as ma
		on a.idAlbum = ma.album
        inner join membro as me
			on ma.membro = me.idMembro
			inner join membro_album_funcao as maf
				on maf.membro = ma.Membro and maf.album= ma.album
	where me.nome=nomeI and maf.Descricao=funcaoI;
END $$
DELIMITER ;

call albuns_by_banda('ALTAR of Pain');
call albuns_by_ano(2014);
call bandas_by_editora('XL Recordings');
call bandas_by_pais('Portugal');
call albuns_by_genero('Música popular');
call membros_by_banda('Quim Barreiros');
call albuns_by_membro_funcao('Manuel Lima','Baterista');