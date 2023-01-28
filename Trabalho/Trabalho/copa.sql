/*
Trabalho Final Sistemas de Banco de Dados I
Parte 2

Professores: Bruno Augusto Nassif Travençolo
			 Elaine Ribeiro de Faria

Alunas: Beatriz Ribeiro Borges - 12021BSI231
		Laura Rosado Rodrigues Muniz - 12021BSI216
		Sara Rosado Rodrigues Muniz - 12021BSI215
*/


DROP SCHEMA IF EXISTS copa CASCADE;
CREATE SCHEMA copa;

SET search_path TO copa;


--CREATE
CREATE TABLE copa (
    ano integer NOT NULL,
    pais varchar(50) NOT NULL,
	CONSTRAINT pk_ano PRIMARY KEY (ano)
);

CREATE TABLE patrocinador (
    nome_patrocinador varchar(100) NOT NULL,
	ramo varchar(50) NOT NULL,
	CONSTRAINT pk_nome_patrocinador PRIMARY KEY (nome_patrocinador)
);

CREATE TABLE selecao (
    id_selecao integer NOT NULL,
    nome_selecao varchar(100) NOT NULL,
	ano_fundacao integer NOT NULL,
	nome_patrocinador varchar(100) NOT NULL,
	CONSTRAINT pk_id_selecao PRIMARY KEY (id_selecao),
	CONSTRAINT fk_nome_patrocinador FOREIGN KEY (nome_patrocinador) REFERENCES patrocinador(nome_patrocinador)
);

CREATE TABLE participante (
	id_participante integer NOT NULL,
    nome_participante varchar(100) NOT NULL,
	data_nascimento date NOT NULL,
	CONSTRAINT pk_id_participante PRIMARY KEY (id_participante)
);

CREATE TABLE jogador (
	id_jogador integer NOT NULL,
    altura real NOT NULL,
	peso real NOT NULL,
	posicao varchar(20) NOT NULL,
	CONSTRAINT pk_id_jogador PRIMARY KEY (id_jogador),
	CONSTRAINT fk_id_jogador FOREIGN KEY (id_jogador) REFERENCES participante(id_participante)
);

CREATE TABLE juiz (
	id_juiz integer NOT NULL,
    nacionalidade varchar(50) NOT NULL,
	CONSTRAINT pk_id_juiz PRIMARY KEY (id_juiz),
	CONSTRAINT fk_id_juiz FOREIGN KEY (id_juiz) REFERENCES participante(id_participante)
);

CREATE TABLE juiz_campo (
	id_juiz_campo integer NOT NULL,
    confederacao varchar(50) NOT NULL,
	CONSTRAINT pk_id_juiz_campo PRIMARY KEY (id_juiz_campo),
	CONSTRAINT fk_id_juiz_campo FOREIGN KEY (id_juiz_campo) REFERENCES juiz(id_juiz)
);

CREATE TABLE juiz_var (
	id_juiz_var integer NOT NULL,
    curso varchar(50) NOT NULL,
	CONSTRAINT pk_id_juiz_var PRIMARY KEY (id_juiz_var),
	CONSTRAINT fk_id_juiz_var FOREIGN KEY (id_juiz_var) REFERENCES juiz(id_juiz)
);

CREATE TABLE tecnico (
	id_tecnico integer NOT NULL,
	salario DECIMAL(10,2),
	CONSTRAINT pk_id_tecnico PRIMARY KEY (id_tecnico),
	CONSTRAINT fk_id_tecnico FOREIGN KEY (id_tecnico) REFERENCES participante(id_participante)
);

CREATE TABLE evento_copa (
	ano_copa integer NOT NULL,
    id_selecao integer NOT NULL,
	id_treinador integer NOT NULL,
	CONSTRAINT pk_ano_selecao PRIMARY KEY (ano_copa, id_selecao),
	CONSTRAINT fk_ano_copa FOREIGN KEY (ano_copa) REFERENCES copa(ano),
	CONSTRAINT fk_id_selecao FOREIGN KEY (id_selecao) REFERENCES selecao(id_selecao),
	CONSTRAINT fk_id_treinador FOREIGN KEY (id_treinador) REFERENCES tecnico(id_tecnico)
);

CREATE TABLE jogo (
	id_jogo integer NOT NULL,
    estadio varchar(30) NOT NULL,
	horario time NOT NULL,
	id_selecao1 integer NOT NULL,
	id_selecao2 integer NOT NULL,
	ano_time1 integer NOT NULL,
	ano_time2 integer NOT NULL,
	gols_time1 integer NOT NULL,
	gols_time2 integer NOT NULL,
	CHECK(ano_time1 = ano_time2),
	CONSTRAINT pk_id_jogo PRIMARY KEY (id_jogo),
	CONSTRAINT fk_selecao1_ano1 FOREIGN KEY (id_selecao1, ano_time1) REFERENCES evento_copa(id_selecao, ano_copa),
	CONSTRAINT fk_selecao2_ano2 FOREIGN KEY (id_selecao2, ano_time2) REFERENCES evento_copa(id_selecao, ano_copa)
);


CREATE TABLE torcedor (
	cpf varchar(15) NOT NULL,
	nome_torcedor varchar(100) NOT NULL,
	data_nasc date NOT NULL,
	CONSTRAINT pk_cpf PRIMARY KEY (cpf)
);

CREATE TABLE ingresso (
	id_ingresso integer NOT NULL,
	secao varchar(10) NOT NULL,
	nro_cadeira integer NOT NULL,
	valor real NOT NULL,
	data_jogo date NOT NULL,
	cpf_torcedor varchar(15) NOT NULL,
	CONSTRAINT pk_id_ingresso PRIMARY KEY (id_ingresso),
	CONSTRAINT fk_cpf_torcedor FOREIGN KEY (cpf_torcedor) REFERENCES torcedor(cpf)
);

CREATE TABLE premiacao (
	id_participante integer NOT NULL,
	nome_premio varchar(30) NOT NULL,
	data_conquista date NOT NULL,
	CONSTRAINT pk_participante_premio PRIMARY KEY (id_participante, nome_premio),
	CONSTRAINT fk_id_participante FOREIGN KEY (id_participante) REFERENCES participante(id_participante)
);

CREATE TABLE vende (
	id_ingresso integer NOT NULL,
	id_jogo integer NOT NULL,
	CONSTRAINT pk_ingresso_jogo PRIMARY KEY (id_ingresso, id_jogo),
	CONSTRAINT fk_id_ingresso FOREIGN KEY (id_ingresso) REFERENCES ingresso(id_ingresso),
	CONSTRAINT fk_id_jogo FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo)
);

CREATE TABLE jogador_atua (
	id_jogador integer NOT NULL,
	id_jogo integer NOT NULL,
	CONSTRAINT pk_jogador_jogo PRIMARY KEY (id_jogador, id_jogo),
	CONSTRAINT fk_id_jogador FOREIGN KEY (id_jogador) REFERENCES jogador(id_jogador),
	CONSTRAINT fk_id_jogo_atua FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo)
);

CREATE TABLE joga_evento (
	id_jogador integer NOT NULL,
	ano_copa integer NOT NULL,
	id_selecao integer NOT NULL,
	CONSTRAINT pk_jogador_ano_selecao PRIMARY KEY (id_jogador, ano_copa, id_selecao),
	CONSTRAINT fk_id_jogador FOREIGN KEY (id_jogador) REFERENCES jogador(id_jogador),
	CONSTRAINT fk_ano_selecao_joga FOREIGN KEY (ano_copa, id_selecao) REFERENCES evento_copa(ano_copa, id_selecao)
);

CREATE TABLE apita_jogo (
	id_juiz integer NOT NULL,
	id_jogo integer NOT NULL,
	CONSTRAINT pk_juiz_jogo PRIMARY KEY (id_juiz, id_jogo),
	CONSTRAINT fk_id_juiz FOREIGN KEY (id_juiz) REFERENCES juiz(id_juiz),
	CONSTRAINT fk_id_jogo_apita FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo)
);

CREATE TABLE arbitra_evento (
	id_juiz integer NOT NULL,
	ano_copa integer NOT NULL,
	id_selecao integer NOT NULL,
	CONSTRAINT pk_juiz_ano_selecao PRIMARY KEY (id_juiz, ano_copa, id_selecao),
	CONSTRAINT fk_id_juiz FOREIGN KEY (id_juiz) REFERENCES juiz(id_juiz),
	CONSTRAINT fk_ano_selecao_arbitra FOREIGN KEY (ano_copa, id_selecao) REFERENCES evento_copa(ano_copa, id_selecao)
);

CREATE TABLE clubes (
	id_tecnico integer NOT NULL,
	nome_clube varchar(50),
	CONSTRAINT pk_id_tecnico_clube PRIMARY KEY (id_tecnico, nome_clube),
	CONSTRAINT fk_id_tecnico_clube FOREIGN KEY (id_tecnico) REFERENCES tecnico(id_tecnico)
);

--INSERT

INSERT INTO copa (ano, pais) VALUES (1958, 'Suécia'),
									(1962, 'Chile'),
									(1970, 'México'),
									(1994, 'Estados Unidos'),
									(2002, 'Coreia do Sul/Japão');

INSERT INTO patrocinador (nome_patrocinador, ramo) VALUES ('Adidas', 'Vestimenta'),
															('Coca-Cola', 'Bebidas'),
															('Hyundai', 'Automóveis'),
															('Visa', 'Cartões'),
															('Claro', 'Telefonia');
															
INSERT INTO selecao (id_selecao, nome_selecao, ano_fundacao, nome_patrocinador) VALUES (1, 'Seleção Brasileira', 1914, 'Adidas'),
																				(2, 'Seleção Inglesa', 1872, 'Coca-Cola'),
																				(3, 'Seleção Sul-Coreana', 1933, 'Hyundai'),
																				(4, 'Seleção Francesa', 1904, 'Visa'),
																				(5, 'Seleção Argentina', 1893, 'Claro');

INSERT INTO participante (id_participante, nome_participante, data_nascimento) VALUES (1, 'Pelé', '1940-10-23'), --jogador
																						(2, 'Maradona', '1960-10-30'), -- jogador
																						(3, 'Harry Kane', '1993-07-28'), -- jogador
																						(4, 'Son Heung-min', '1992-07-08'), -- jogador
																						(5, 'Kylian Mbappé', '1998-12-20'), -- jogador
																						(6, 'Zagallo', '1931-08-09'), --tecnico
																						(7, 'Didier Deschamps', '1968-10-15'), --tecnico
																						(8, 'Maradona', '1960-10-30'), --tecnico
																						(9, 'Paulo Jorge Gomes Bento', '1969-06-20'), --tecnico
																						(10, 'Gareth Southgate', '1970-09-03'), --tecnico
																						(11, 'Kathryn Nesbitt', '1988-11-07'), --arbitra campo
																						(12, 'Sam', '1978-10-17'), --arbitro campo
																						(13, 'Frodo', '1978-11-27'), --arbitra campo
																						(14, 'Merry', '1977-08-04'), --arbitro campo
																						(15, 'Pippin', '1977-09-07'), --arbitra campo
																						(16, 'Harry', '1980-07-31'), --arbitro var
																						(17, 'Rony', '1980-03-01'), --arbitra var
																						(18, 'Hermione', '1979-09-19'), --arbitro var
																						(19, 'Neville', '1980-07-30'), --arbitra var
																						(20, 'Luna', '1981-02-13'); --arbitro var


INSERT INTO jogador (id_jogador, altura, peso, posicao) VALUES (1, 1.73, 70.0, 'Atacante'),
																(2, 1.65, 67.0, 'Atacante'),
																(3, 1.70, 69.0, 'Lateral Direita'),
																(4, 1.67, 68.0, 'Lateral Esquerda'),
																(5, 1.65, 65.0, 'Defesa');


INSERT INTO juiz (id_juiz, nacionalidade) VALUES (11, 'Estadunidense'),
												(12, 'Chileno'),
												(13, 'Mexicano'),
												(14, 'Suéco'),
												(15, 'Croata'),
												(16, 'Inglês'),
												(17, 'Brasileiro'),
												(18, 'Mulçumano'),
												(19, 'Grego'),
												(20, 'Chinês');

INSERT INTO juiz_campo (id_juiz_campo, confederacao) VALUES (11, 'USSF'),
															(12, 'FFC'),
															(13, 'FMF'),
															(14, 'SVFF'),
															(15, 'HNS');

INSERT INTO juiz_var (id_juiz_var, curso) VALUES (16, 'Curso A'),
												(17, 'Curso B'),
												(18, 'Curso A'),
												(19, 'Curso A'),
												(20, 'Curso C');


INSERT INTO tecnico (id_tecnico,salario) VALUES (6,20000.00),
										(7,34000.00),
										(8,44000.00),
										(9,25000.00),
										(10,17000.00);

INSERT INTO evento_copa(ano_copa, id_selecao, id_treinador) VALUES (2002, 1, 6),
													 (2002, 2, 7),
													 (2002, 3, 7),
													 (1958, 3, 8),
													 (1958, 1, 8),
													 (1958, 5, 9),
													 (1994, 1, 9),
													 (1994, 2, 9),
													 (2002, 4, 10);
													 
													 

													 
INSERT INTO jogo(id_jogo, estadio, horario, id_selecao1, id_selecao2, ano_time1, ano_time2, gols_time1, gols_time2)
				VALUES(1,'Solna-Rasunda', '22:00', 1, 2, 2002, 2002, 0, 2),
				(2,'Carlos Dittborn', '13:00', 3, 5, 1958, 1958, 10, 0),
				(3,'Cuauhtémoc', '14:00', 1, 4, 2002, 2002, 1, 2),
				(4,' Lumen Field', '16:00', 1, 2, 1994, 1994, 1, 1),
				(5,'Sang-am ', '12:00', 2, 4, 2002, 2002, 3, 0);
				
INSERT INTO torcedor(cpf, nome_torcedor, data_nasc)
				VALUES('178.587.985-58', 'Joãozinho da Silva', '25-08-1998'),
				('148.458.258-58', 'Maria Gomes Nascimento', '17-05-1988'),
				('123.456.789-10', 'Pedro Henrique de Oliveira', '18-02-1992'),
				('987.654.321-00', 'Mariana Rodrigues da Silva', '13-09-2000'),
				('178.758.895-58', 'José Antônio Goulart', '24-03-2001');
				
INSERT INTO ingresso(id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torcedor)
				VALUES(11,'A1', 23, 2500, '10-06-2002', '178.587.985-58'),
				      (12,'B2', 101, 1500, '11-06-2002','178.587.985-58'),
				      (13,'B2', 120, 1500, '23-06-2002', '123.456.789-10'),
				      (14,' C3', 314, 1200, '15-06-1994', '148.458.258-58'),
				      (15,'D1 ', 453, 1100, '09-07-2002', '178.587.985-58');

INSERT INTO premiacao(id_participante, nome_premio, data_conquista)
				VALUES(2,'Copa América', '25-10-1988'),
				      (3,'Champions League', '10-11-2004'),
				      (5,'Copa do Mundo', '15-07-2018'),
				      (1,' Copa do Mundo', '29-06-1958'),
				      (4,'Olimpiadas', '14-07-2016');

INSERT INTO vende(id_ingresso, id_jogo)
				VALUES(11,1),
				      (12,5),
				      (13,3),
				      (14,4),
				      (15,5);
					 
INSERT INTO jogador_atua(id_jogador, id_jogo)
				VALUES(1,3),
				      (2,5),
				      (3,2),
				      (4,4),
				      (5,1);
					  
INSERT INTO joga_evento(id_jogador, ano_copa, id_selecao)
				VALUES(1,2002,1),
				      (2,1958,5),
				      (3,1994,2),
				      (4,2002,3),
				      (5,1994,1);
					 
INSERT INTO apita_jogo(id_juiz, id_jogo)
				VALUES(11,3),
				      (12,4),
				      (16,1),
				      (14,2),
				      (17,5);
					  
INSERT INTO arbitra_evento(id_juiz, ano_copa, id_selecao)
				VALUES(11,2002,1),
				      (12,1958,3),
				      (16,1994,2),
				      (14,2002,3),
				      (17,1994,1);
					  
INSERT INTO clubes(id_tecnico, nome_clube)
				VALUES(6,'Flamengo'),
				      (7,'Paris Saint-Germain'),
				      (8,'Textil Mandiyú'),
				      (9,'Cruzeiro'),
				      (10,'Inglaterra');
