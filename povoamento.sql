-- inserir paises
use tpbd;

insert into Pais(idPais,designacao)
	values(1,'Portugal'),
		  (2,'Bélgica'),
		  (3,'Inglaterra');

-- inserir editoras

insert into Editora(idEditora,localidade,rua,data_fundacao,nome,estado,website,telefone,email,pais)
	values(1,'Não definida','Não definida','1900-01-01','Lançamentos independentes','Não encontrado',null,null,null,1),
		  (2,'Prior Velho-Sacavém','Rua Francisco Salgado Zenha Nº 13','1983-01-01','Espacial Música','Ativo','espacial.pt','+351 219 491 700' ,'espacial@espacial.pt',1),
		  (3,'London','One Codrington Mews ','1989-01-01','XL Recordings','Ativo','xlrecordings.com','0208 870 7511','xl@xl-recordings.com' ,3);

-- inserir bandas

insert into banda(idbanda,datafundacao,nome,estado,biografia,pais,editora)
	values(1,'1971-01-01','Quim Barreiros','Ativo','Quim Barreiros, é um cantor popular português que toca acordeão, conhecido por as suas letras de duplo sentido.',1,2),
	      (2,'2010-08-01','Altar of Pain','Separada','Um grupo de amigos da Madeira com um interesse comum em música repugnante, inspirada pelos sons brutais de Death Metal.',1,1),
	      (3,'2006-09-01','Adele','Ativo','Cantora a solo britânica com voz fenomenal.',3,3);

-- inserir membros pertencentes a bandas com determinada função

call Tr_CriarMembroBanda(1,'1947-07-19','Joaquim de Magalhães Fernandes Barreiros',1,1,null,'1971-01-01','Vocalista');
call Tr_CriarMembroBanda(2,'1956-03-10','Manuel Lima',1,1,null,'1988-01-01','Baterista');
call Tr_CriarMembroBanda(3,'1966-10-19','Claudio Fernandes',1,1,null,'1988-01-01','Técnico de som');
call Tr_CriarMembroBanda(4,'1967-01-20','Zé Valadas',1,1,null,'1988-01-01','Teclista');
call Tr_CriarMembroBanda(5,'1966-09-12','António Pires',1,1,null,'1988-01-01','Teclista');
call Tr_CriarMembroBanda(6,'1989-02-24','Marcelo Rodrigues',1,2,null,'2010-08-01','Baixista');
call Tr_CriarMembroBanda(7,'1989-06-12','Zé Rodrigues',1,2,null,'2010-08-01','Guitarrista');
call Tr_CriarMembroBanda(8,'1990-09-10','Guilherme Abreu',1,2,null,'2010-08-01','Guitarrista');
call Tr_CriarMembroBanda(9,'1987-09-12','Brandon Leigh',2,2,null,'2012-01-01','Vocalista');
call Tr_CriarMembroBanda(10,'1988-05-05','Adele Laurie Blue Adkins',3,3,null,'2006-09-01','Vocalista');

-- inserir membros não pertencentes a bandas

insert into membro(idmembro,datanascimento,nome,pais)
	values(11,'1991-07-30','David Araújo Antunes',1),
	      (12,'1957-03-25','Américo Pinto da Silva Monteiro ',1);

-- inserir géneros

insert into genero(idgenero,designacao)
	values(1,'Música popular'),
	      (2,'Death Metal'),
	      (3,'R&B Contemporâneo'),
	      (4,'Soul');

-- lançar albúns pela primeira vez

call Tr_LancarAlbum(1,'2014-05-05','Caça Asneiras','Álbum',43,1,1,2,'CD','2014-05-05',10000);
call Tr_LancarAlbum(2,'2011-08-01','The Ritual Has Begun','Álbum',51,2,2,1,'CD','2011-08-01',1000);
call Tr_LancarAlbum(3,'2015-11-20','25','Álbum',48,3,3,3,'CD','2015-11-20',150000);
call Tr_LancarAlbum(4,'2011-01-19','21','Álbum',48,3,3,3,'CD','2011-01-19',100000);

-- inserir membros em albuns

call Tr_AdicionarMembroAlbum(1,1,0,'Vocalista');
call Tr_AdicionarMembroAlbum(2,1,0,'Baterista');
call Tr_AdicionarMembroAlbum(3,1,0,'Técnico de som');
call Tr_AdicionarMembroAlbum(4,1,0,'Teclista');
call Tr_AdicionarMembroAlbum(5,1,0,'Teclista');
call Tr_AdicionarMembroAlbum(6,2,0,'Baixista');
call Tr_AdicionarMembroAlbum(7,2,0,'Teclista');
call Tr_AdicionarMembroAlbum(8,2,0,'Guitarrista');
call Tr_AdicionarMembroAlbum(9,2,0,'Vocalista');
call Tr_AdicionarMembroAlbum(10,3,0,'Vocalista');
call Tr_AdicionarMembroAlbum(10,4,0,'Vocalista');
call Tr_AdicionarMembroAlbum(11,1,1,'Vocalista');
call Tr_AdicionarMembroAlbum(12,1,1,'Vocalista');

-- inserir musicas

call Tr_CriarMusica(1,'Caça Asneiras','Os mosquitos picam picam 
										Por cima estavas tu
										A mim picaram-me na cara
										A ti picaram-te no ...',329,1);

call Tr_CriarMusica(2,'Trituração Sanguinária','Deformação membral
												Impede desenvolvimento
												Febres intermitentes
												intestino em excremento',271,2);

call Tr_CriarMusica(3,'Hello','Hello
							   It\'s me
							   I was wondering if after all these years
							   You\'d like to meet
							   To go over
							   Everything
							   They say that time\'s supposed to heal ya
							   But I ain\'t done much healing',295,3);


call Tr_CriarMusica(4,'When we were young','Everybody loves the things you do
					   						From the way you talk
					   						To the way you move
					   						Everybody here is watching you
					   						\'Cause you feel like home
					   						You\'re like a dream come true
					   						But if by chance you\'re here alone
					   						Can I have a moment
					   						Before I go?
					   						\'Cause I\'ve been by myself all night long
					   						Hoping you\'re someone I used to know',291,3);

call Tr_CriarMusica(5,'Set Fire to the Rain','I let it fall, my heart
											  And as it fell, you rose to claim it
											  It was dark and I was over
											  Until you kissed my lips and you saved me',242,4);
