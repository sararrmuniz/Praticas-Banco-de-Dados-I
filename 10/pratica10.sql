/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;

CREATE SCHEMA universidade;

--21)
--a) Semestre só pode ser '1' ou '2'
	CREATE TABLE universidade.turma (
    id integer NOT NULL,
    turma character(2) NOT NULL,
    semestre integer CHECK(semestre = 1 OR semestre = 2),
    ano integer NOT NULL,
    cod_disc character(6) NOT NULL,
    predio_s character(5),
    n_sala integer
);

INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1822, '06', 20232, 2023, '1805  ', '2E   ', 203);

--b) O orçamento não pode ser negativo
	CREATE TABLE universidade.faculdade (
    sigla character(5) NOT NULL,
    nome character varying(100),
    predio character(5),
    orcamento numeric(10,2) CHECK(orcamento>0)
);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FACOM', 'Faculdade da Computação', '1B   ', -2000.00);

--c) A nota é um valor entre 0 e 100
	CREATE TABLE universidade.frequenta (
    id_est character(11) NOT NULL,
    id_turma integer NOT NULL,
    nota real CHECK(nota BETWEEN 0 AND 100)
);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1304', 1300, 101);

--d) Caso no cadastro de um professor sua faculdade ainda não esteja definida, ele deverá ser alocado na FACOM (mostrar um insert into neste caso em que isso ocorre)
	CREATE TABLE universidade.professor (
    id character(11) NOT NULL,
    nome character varying(255) NOT NULL,
    fac_prof character(5) DEFAULT 'FACOM',
    admissao date
);
INSERT INTO universidade.professor (id, nome, admissao) VALUES ('100', 'Gina Maira', '2000-02-27');

--e) Elabore outra restrição que julgue importante.
	CREATE TABLE universidade.sala (
    predio character(5) NOT NULL,
    numero smallint NOT NULL,
    capacidade integer CHECK(capacidade>0 AND capacidade < 80)
);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1B', 204, 81);

--Criando o resto das tabelas
CREATE TABLE universidade.disciplina (
    codigo character(6) NOT NULL,
    nome character varying(70) NOT NULL,
    fac_disc character(5) NOT NULL,
    ch smallint
);

CREATE TABLE universidade.ensina (
    id_prof character(11) NOT NULL,
    id_turma integer NOT NULL
);

CREATE TABLE universidade.estudante (
    id character(11) NOT NULL,
    nome character varying(255) NOT NULL,
    datanasc date,
    fac_est character(5) NOT NULL,
    cra real,
    tutor character(11)
);

CREATE TABLE universidade.horario (
    id_hora character(1) NOT NULL,
    hora_inicio time without time zone,
    hora_fim time without time zone
);

CREATE TABLE universidade.horario_aula (
    id_sem character(1) NOT NULL,
    id_hora character(1) NOT NULL,
    id_turma integer NOT NULL
);

CREATE TABLE universidade.pre_requisito (
    cod_disc character(6) NOT NULL,
    cod_pre character(6) NOT NULL
);

CREATE TABLE universidade.semana (
    id_sem character(1) NOT NULL,
    descricao character varying(13)
);


--Restrições de chave
ALTER TABLE ONLY universidade.disciplina
    ADD CONSTRAINT pk_disciplina PRIMARY KEY (codigo);

ALTER TABLE ONLY universidade.ensina
    ADD CONSTRAINT pk_ensina PRIMARY KEY (id_prof, id_turma);
	
ALTER TABLE ONLY universidade.estudante
    ADD CONSTRAINT pk_estudante PRIMARY KEY (id);
	
ALTER TABLE ONLY universidade.faculdade
	ADD CONSTRAINT pk_faculdade PRIMARY KEY (sigla);

ALTER TABLE ONLY universidade.frequenta
    ADD CONSTRAINT pk_frequenta PRIMARY KEY (id_est, id_turma);

ALTER TABLE ONLY universidade.horario
    ADD CONSTRAINT pk_horario PRIMARY KEY (id_hora);
	
ALTER TABLE ONLY universidade.horario_aula
    ADD CONSTRAINT pk_horario_aula PRIMARY KEY (id_sem, id_hora, id_turma);

ALTER TABLE ONLY universidade.pre_requisito
    ADD CONSTRAINT pk_pre_requisito PRIMARY KEY (cod_disc, cod_pre);

ALTER TABLE ONLY universidade.professor
    ADD CONSTRAINT pk_professor PRIMARY KEY (id);
	
ALTER TABLE ONLY universidade.sala
    ADD CONSTRAINT pk_sala PRIMARY KEY (predio, numero);
	
ALTER TABLE ONLY universidade.semana
    ADD CONSTRAINT pk_semana PRIMARY KEY (id_sem);
	
ALTER TABLE ONLY universidade.turma
    ADD CONSTRAINT pk_turma PRIMARY KEY (id);

ALTER TABLE ONLY universidade.turma
    ADD CONSTRAINT uq_turma UNIQUE (turma, semestre, ano, cod_disc);
--
ALTER TABLE ONLY universidade.horario_aula
    ADD CONSTRAINT fk_aula_turma FOREIGN KEY (id_turma) REFERENCES universidade.turma(id) 
	ON UPDATE CASCADE 
	ON DELETE NO ACTION;


--22)
--f)
UPDATE turma SET id = 1111 WHERE id = 1822;
SELECT *FROM horario_aula;
/*
"2"	"i"	155
"2"	"j"	155
"2"	"d"	154
"2"	"f"	154
"4"	"a"	153
"4"	"b"	153
"6"	"c"	152
"6"	"e"	152
"4"	"f"	151
"4"	"g"	151
"2"	"a"	650
"2"	"b"	651
"3"	"b"	651
"3"	"c"	651
"3"	"d"	651
"5"	"e"	652
"2"	"f"	315
"3"	"m"	316
"3"	"a"	317
"4"	"f"	318
"5"	"a"	319
"6"	"f"	320
"2"	"f"	2019
"3"	"b"	2017
"4"	"k"	2016
"5"	"g"	2018
"6"	"d"	2015
"2"	"a"	1817
"2"	"b"	1818
"4"	"f"	1819
"4"	"g"	1820
"6"	"b"	1821
"2"	"a"	920
"3"	"a"	921
"2"	"c"	922
"3"	"c"	923
"4"	"a"	924
"4"	"c"	925
"2"	"a"	511
"3"	"c"	512
"4"	"e"	513
"5"	"g"	514
"6"	"i"	515
"1"	"a"	1300
"4"	"d"	1302
"4"	"d"	1305
"5"	"q"	1303
"6"	"l"	1301
"2"	"a"	1720
"2"	"b"	1720
"4"	"g"	1725
"6"	"l"	1722
"6"	"m"	1722
"2"	"a"	1417
"2"	"b"	1418
"3"	"c"	1419
"4"	"a"	1420
"4"	"b"	1421
"1"	"c"	10
"2"	"a"	20
"3"	"m"	30
"4"	"p"	40
"5"	"o"	50
"2"	"a"	218
"3"	"e"	219
"4"	"c"	220
"5"	"p"	221
"6"	"i"	222
"2"	"a"	1
"3"	"b"	2
"4"	"c"	3
"5"	"d"	4
"6"	"e"	5
"1"	"a"	1500
"2"	"b"	1501
"4"	"k"	1502
"4"	"k"	1503
"2"	"a"	430
"2"	"g"	431
"2"	"a"	432
"2"	"g"	433
"2"	"a"	434
"2"	"a"	400
"3"	"b"	401
"4"	"c"	402
"5"	"d"	403
"6"	"e"	404
"6"	"c"	1111
*/

DELETE FROM turma WHERE id = 1111;
/*
ERROR:  update or delete on table "turma" violates foreign key constraint "fk_aula_turma" on table "horario_aula"
*/

--
ALTER TABLE ONLY universidade.pre_requisito
    ADD CONSTRAINT fk_disciplina FOREIGN KEY (cod_disc) REFERENCES universidade.disciplina(codigo)
	ON UPDATE CASCADE 
	ON DELETE NO ACTION;

UPDATE disciplina SET codigo= '2222' WHERE codigo = '310';
SELECT * FROM pre_requisito;
/*
"GBC023"	"GBC045"
"GBC024"	"GBC023"
"GMV007"	"GMV003"
"GMV006"	"GMV005"
"1415  "	"1412  "
"1416  "	"1414  "
"GAV007"	"GAV001"
"GAV019"	"GAV013"
"FADIR4"	"FADIR3"
"FADIR6"	"FADIR5"
"311   "	"310   "
"312   "	"311   "
"2001  "	"2000  "
"2003  "	"2002  "
"1805  "	"1804  "
"1805  "	"1803  "
"ESTES4"	"ESTES1"
"ESTES3"	"ESTES2"
"GGO011"	"GGO001"
"GGO012"	"GGO002"
"MAT213"	"MAT212"
"GSI034"	"GBC043"
"GOG005"	"GOG001"
"GEDU42"	"GEDU32"
"GEDU43"	"GEDU31"
*/

DELETE FROM disciplina WHERE codigo = 'MAT211';
/*
ERROR:  update or delete on table "disciplina" violates foreign key constraint "fk_disciplina" on table "pre_requisito"
*/
--
ALTER TABLE ONLY universidade.turma
    ADD CONSTRAINT fk_disciplina FOREIGN KEY (cod_disc) REFERENCES universidade.disciplina(codigo)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM disciplina;
UPDATE disciplina SET codigo = '7777' WHERE codigo = '310';
/*
"GEDU43"	"Comportamento Motor "	"FAEDU"	90
"GBC045"	"Programação Procedimental"	"FACOM"	90
"GBC023"	"Algoritmo e Estrutura de Dados 1"	"FACOM"	90
"GBC024"	"Algoritmo e Estrutura de Dados 2"	"FACOM"	70
"GBC034"	"Programação Orientada a Objetos"	"FACOM"	60
"GBC012"	"Lógica"	"FACOM"	60
"BCC002"	"Lógica para Programação"	"FACOM"	60
"BCC003"	"Cálculo 1"	"FACOM"	60
"BCC005"	"Arquitetura e Organização de Computadores"	"FACOM"	60
"GMV003"	"Bioquímica 1"	"FAMEV"	75
"GMV007"	"Bioquímica 2"	"FAMEV"	75
"GMV005"	"Fundamentos de Anatomia Veterinária"	"FAMEV"	75
"GMV006"	"Anatomia dos Animais Domésticos"	"FAMEV"	75
"GMV001"	"Citologia, Histologia e Embriologia"	"FAMEV"	75
"1410  "	"Filosofia Geral: Problemas Metafísicos"	"IFILO"	60
"1411  "	"História da Filosofia Medieval"	"IFILO"	30
"1412  "	"Ética"	"IFILO"	90
"1413  "	"Psicologia da Educação"	"IFILO"	60
"1414  "	"Didática Geral"	"IFILO"	60
"1415  "	"Etica II"	"IFILO"	90
"1416  "	"Didática Geral II"	"IFILO"	60
"GAV001"	"Historia da Arte I"	"IARTE"	60
"GAV007"	"Historia da Arte II"	"IARTE"	60
"GAV013"	"Arte Contemporanea I"	"IARTE"	60
"GAV019"	"Arte Contemporanea II"	"IARTE"	60
"GAV010"	"Arte Computacional"	"IARTE"	60
"31505 "	"Avaliação de Impactos Ambiental para Biólogos"	"INBIO"	60
"39030 "	"Biologia e Cultura - (PROINTER III)"	"INBIO"	60
"31104 "	"Construção do Conhecimento Científico"	"INBIO"	30
"31602 "	"Evolução"	"INBIO"	60
"31407 "	"Profissão Biólogo"	"INBIO"	30
"FADIR3"	"Teoria do Direito"	"FADIR"	60
"FADIR4"	"Direito Digital"	"FADIR"	30
"FADIR5"	"Direito do Trabalho 1"	"FADIR"	60
"FADIR6"	"Direito do Trabalho 2"	"FADIR"	30
"FADIR7"	"Direito Financeiro"	"FADIR"	30
"311   "	"Física Básica II"	"INFIS"	90
"312   "	"Física Básica III"	"INFIS"	90
"313   "	"Geometrica Analítica"	"INFIS"	60
"314   "	"Algoritmos e Programação de Computadores"	"INFIS"	60
"2000  "	"Analises Clinicas"	"ICBIM"	40
"2001  "	"Imunologia"	"ICBIM"	30
"2002  "	"Genetica"	"ICBIM"	20
"2003  "	"Microbiologia"	"ICBIM"	30
"2004  "	"Biossegurança"	"ICBIM"	40
"1801  "	"Construções Rurais"	"ICIAG"	60
"1802  "	"Adubos e Adubação"	"ICIAG"	60
"1803  "	"Manejo e Conservação do Solo e da Água"	"ICIAG"	60
"1804  "	"Irrigação e Drenagem"	"ICIAG"	75
"1805  "	"Agrometeorologia"	"ICIAG"	60
"ESTES1"	"Fundamentos em Enfermagem"	"ESTES"	75
"ESTES2"	"Saúde Coletiva I"	"ESTES"	45
"ESTES3"	"Saúde Coletiva II"	"ESTES"	30
"ESTES4"	"Enfermagem Médica"	"ESTES"	60
"ESTES5"	"Psicologia e Ética"	"ESTES"	45
"GGO001"	"Geologia 1"	"FACIP"	60
"GGO002"	"Climatologia 1"	"FACIP"	60
"GGO003"	"Teoria e método em Geografia"	"FACIP"	60
"GGO004"	"Cartografia"	"FACIP"	60
"GGO005"	"PIPE 1"	"FACIP"	60
"GGO011"	"Geologia 2"	"FACIP"	60
"GGO012"	"Climatologia 2"	"FACIP"	60
"MAT201"	"Fundamentos de Matemática Elementar I"	"FAMAT"	90
"MAT211"	"Fundamentos de Matemática Elementar II"	"FAMAT"	90
"MAT212"	"Cálculo Diferencial e Integral I"	"FAMAT"	90
"MAT213"	"Cálculo Diferencial e Integral II"	"FAMAT"	90
"MAT214"	"Geometria Analitica"	"FAMAT"	90
"GBC043"	"Sistemas de Banco de Dados"	"FACOM"	90
"GSI023"	"Redes de computadores"	"FACOM"	60
"GSI034"	"Projeto e desenvolvimento 1"	"FACOM"	60
"GSI030"	"Engenharia de Software"	"FACOM"	60
"GSI027"	"Otimização"	"FACOM"	60
"GOG001"	"Unidade de Constituição do Organismo"	"FOUFU"	210
"GOG002"	"Unidade de Funcionamento do Organismo I"	"FOUFU"	120
"GOG003"	"Un. de Reabilitação Integral do Ap. Estomatognático I"	"FOUFU"	60
"GOG004"	"Unidade de Investigação Científica I (UIC1)"	"FOUFU"	45
"GOG005"	"Unidade de Saúde Humana I (USH1)"	"FOUFU"	30
"410   "	"Metodologia do Ensino de Ciência"	"ESTES"	120
"411   "	"Estágio Supervisionado I"	"ESTES"	150
"412   "	"Construção do Discurso Escrito"	"ESTES"	60
"413   "	"Metodologia do Ensino da Língua Portuguesa"	"ESTES"	120
"414   "	"Filosofia da Educação"	"ESTES"	60
"GEDU31"	"Fisiologia do Exercício"	"FAEDU"	90
"GEDU32"	"Teoria e Prática do Treinamento I"	"FAEDU"	60
"GEDU41"	"Ritmo e Expressão"	"FAEDU"	60
"GEDU42"	"Teoria e Prática do Treinamento II"	"FAEDU"	60
"7777  "	"Física Básica I"	"INFIS"	90 <----
*/

DELETE FROM disciplina WHERE codigo = '7777';
/*
ERROR:  update or delete on table "disciplina" violates foreign key constraint "fk_disciplina" on table "turma"
*/
--
ALTER TABLE ONLY universidade.ensina
    ADD CONSTRAINT fk_ensina_turma FOREIGN KEY (id_turma) REFERENCES universidade.turma(id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;
	
SELECT * FROM turma;
UPDATE turma SET id = 0 WHERE id = 1822;
/*
920	"1A"	1	2022	"ESTES1"	"4K   "	205
921	"1B"	1	2022	"ESTES1"	"4K   "	205
922	"1A"	1	2022	"ESTES2"	"4K   "	206
923	"1A"	1	2022	"ESTES3"	"4K   "	207
924	"1A"	2	2022	"ESTES4"	"4K   "	206
925	"1A"	2	2022	"ESTES5"	"4K   "	207
511	"33"	1	2022	"GGO002"	"3K   "	101
512	"33"	2	2022	"GGO012"	"3K   "	101
513	"31"	1	2021	"GGO001"	"3K   "	102
514	"31"	2	2021	"GGO011"	"3K   "	102
515	"29"	2	2020	"GGO012"	"3K   "	103
1300	"A "	1	2022	"GMV003"	"1BCG "	101
1301	"B "	1	2022	"GMV007"	"1BCG "	102
1302	"C "	1	2022	"GMV005"	"1BCG "	103
1303	"D "	1	2022	"GMV006"	"1BCG "	103
1304	"E "	1	2022	"GMV001"	"1BCG "	102
1305	"F "	1	2022	"GMV005"	"1BCG "	103
1720	"C "	1	2022	"31505 "	"8C   "	119
1721	"D "	1	2022	"31505 "	"8C   "	119
1722	"C "	1	2022	"39030 "	"2D   "	13
1723	"C "	1	2022	"31104 "	"8C   "	121
1724	"C "	1	2022	"31602 "	"8C   "	322
1725	"C "	1	2022	"31407 "	"8C   "	123
1417	"A "	1	2022	"1410  "	"1U   "	204
1418	"A "	1	2022	"1411  "	"5O-A "	206
1419	"A "	1	2022	"1412  "	"5O-A "	206
1420	"A "	2	2022	"1413  "	"5O-A "	207
1421	"A "	2	2022	"1414  "	"1U   "	204
1422	"B "	2	2022	"1414  "	"1U   "	204
10	"55"	1	2015	"GAV001"	"5S   "	207
20	"57"	2	2016	"GAV007"	"5S   "	205
30	"59"	1	2017	"GAV013"	"5S   "	208
40	"61"	2	2018	"GAV019"	"5S   "	207
50	"63"	1	2019	"GAV010"	"5S   "	205
218	"A "	1	2018	"MAT201"	"1F   "	215
219	"B "	2	2019	"MAT211"	"1F   "	216
220	"C "	1	2020	"MAT212"	"1F   "	217
221	"D "	2	2021	"MAT213"	"1F   "	215
222	"E "	2	2022	"MAT214"	"1F   "	216
223	"F "	2	2022	"MAT214"	"1F   "	216
1	"01"	1	2022	"GBC043"	"1BBSI"	127
2	"02"	2	2022	"GBC043"	"1BBSI"	127
3	"03"	2	2022	"GSI023"	"1BBSI"	128
4	"04"	2	2022	"GSI034"	"1BBSI"	129
5	"05"	2	2022	"GSI027"	"1BBSI"	128
1500	"17"	1	2022	"GOG001"	"UMU4L"	39
1501	"17"	1	2021	"GOG001"	"UMU4L"	39
1502	"18"	2	2021	"GOG002"	"UMU3L"	38
1503	"19"	2	2022	"GOG003"	"UMU4L"	39
1504	"20"	1	2023	"GOG004"	"UMU1L"	37
430	"65"	2	2020	"410   "	"1G   "	101
431	"66"	1	2020	"410   "	"1G   "	101
432	"67"	2	2020	"411   "	"1G   "	102
433	"68"	1	2021	"412   "	"1G   "	103
434	"69"	2	2021	"413   "	"1G   "	104
400	"00"	2	1982	"GEDU31"	"1A   "	490
401	"01"	1	1983	"GEDU32"	"1A   "	490
402	"02"	2	1983	"GEDU41"	"1A   "	491
403	"03"	2	1990	"GEDU42"	"1A   "	491
404	"04"	2	1995	"GEDU43"	"1A   "	492
405	"05"	2	1995	"GEDU43"	"1A   "	492
155	"63"	2	2020	"GBC034"	"1B   "	204
154	"64"	1	2021	"GBC034"	"1B   "	203
153	"65"	2	2021	"GBC024"	"5R   "	103
152	"66"	1	2022	"GBC023"	"5R   "	103
151	"67"	2	2022	"GBC045"		
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
652	"D2"	1	2021	"FADIR5"	"3D   "	104
653	"D3"	2	2022	"FADIR6"		
654	"D4"	1	2022	"FADIR6"		
317	"B1"	1	2020	"311   "	"1X   "	3
318	"C1"	1	2021	"312   "	"1X   "	1
319	"D1"	1	2021	"313   "	"1X   "	1
320	"E1"	2	2021	"314   "	"1X   "	1
2015	"A "	1	2022	"2000  "	"2A   "	1
2016	"B "	1	2022	"2001  "	"2A   "	2
2017	"C "	1	2022	"2002  "	"2A   "	3
2018	"D "	1	2022	"2003  "	"2A   "	4
2019	"E "	1	2022	"2004  "	"2A   "	5
2020	"F "	1	2022	"2004  "	"2A   "	6
1817	"01"	1	2021	"1801  "	"2E   "	201
1818	"02"	2	2021	"1801  "	"2E   "	201
1819	"03"	1	2022	"1803  "	"2E   "	201
1820	"04"	2	2022	"1804  "	"2E   "	202
1821	"05"	1	2023	"1802  "	"2E   "	202
315	"A1"	2	2020	"7777  "	"1X   "	2
316	"A2"	2	2020	"7777  "	"1X   "	2
0	"06"	1	2023	"1805  "	"2E   "	203 <--
*/
DELETE FROM turma WHERE id = 0;
/*
ERROR:  update or delete on table "turma" violates foreign key constraint "fk_ensina_turma" on table "ensina"
*/
--
ALTER TABLE ONLY universidade.frequenta
    ADD CONSTRAINT fk_est_frequenta FOREIGN KEY (id_est) REFERENCES universidade.estudante(id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM frequenta;
UPDATE estudante SET id = 8888 WHERE id = '1304'; 
/*
"1710       "	1720	55.2
"1711       "	1724	60.1
"1711       "	1720	70.6
"1714       "	1723	40
"1712       "	1722	55.2
"1713       "	1725	10
"1405       "	1417	79
"1406       "	1417	70
"1407       "	1418	68
"1408       "	1419	45
"1409       "	1419	90
"12021BAV001"	10	60
"12021BAV016"	20	65
"12021BAV029"	30	70
"12021BAV040"	40	75
"12021BAV020"	50	80
"205        "	218	80
"206        "	219	85
"207        "	220	74
"208        "	221	80
"209        "	222	69
"221BSI251ST"	1	75.9
"222BCC201ST"	2	67.9
"189BSI255ST"	3	70.9
"221BSI255ST"	4	80.9
"189BSI232ST"	5	60.9
"1501       "	1501	10
"1503       "	1503	8
"420        "	430	78.5
"421        "	431	10
"422        "	432	86.7
"423        "	433	96.4
"424        "	434	96
"444        "	400	70
"445        "	401	10
"446        "	402	68
"447        "	404	84
"448        "	404	92
"199        "	152	87
"198        "	152	93
"197        "	154	
"196        "	155	80
"195        "	151	68
"605        "	650	70.15
"605        "	651	63.6
"605        "	652	76.9
"605        "	653	85.5
"606        "	651	84.1
"606        "	650	81.8
"606        "	652	87.99
"606        "	653	75.5
"606        "	654	61.1
"607        "	652	74.9
"607        "	651	61.8
"607        "	653	
"607        "	654	87.4
"607        "	650	
"608        "	653	67.9
"608        "	650	61.76
"608        "	651	78.9
"608        "	652	83.1
"608        "	654	90.76
"609        "	654	
"609        "	650	
"609        "	651	
"609        "	652	70.92
"609        "	653	67.54
"305        "	315	9
"306        "	316	8
"307        "	317	9.5
"308        "	318	7
"308        "	320	8.6
"309        "	319	9.2
"2013       "	2015	65
"2010       "	2015	99
"2014       "	2019	60
"2012       "	2016	98
"2011       "	2017	70
"1807       "	1817	10
"1808       "	1817	80
"1809       "	1818	15
"1810       "	1819	
"1811       "	1820	
"950        "	920	92.2
"950        "	922	80.9
"951        "	921	75.5
"952        "	923	61
"953        "	924	55.2
"954        "	925	10
"12021GEO001"	511	85
"12021GEO002"	512	58
"12021GEO003"	513	61
"12021GEO004"	514	86
"12021GEO005"	515	90
"1300       "	1300	80
"1301       "	1300	70
"1302       "	1301	90
"1303       "	1302	90
"8888       "	1300	95
*/

DELETE FROM estudante WHERE id = '8888';
/*
ERROR:  update or delete on table "estudante" violates foreign key constraint "fk_est_frequenta" on table "frequenta"
*/

--
ALTER TABLE ONLY universidade.professor
    ADD CONSTRAINT fk_faculdade FOREIGN KEY (fac_prof) REFERENCES universidade.faculdade(sigla)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;
	
SELECT * FROM professor;

UPDATE faculdade SET sigla = 'FAM' WHERE  sigla = 'FAMAT';
/*
"456BCC023  "	"José da Silva"	"FACOM"	"2002-06-14"
"100        "	"Gina Maira"	"FACOM"	"2000-02-27"
"101        "	"Marcelo Keese Albertini"	"FACOM"	"2013-03-07"
"102        "	"Rivalino Matias Júnior"	"FACOM"	"2003-02-05"
"104        "	"Bruno Augusto Nassif Travençolo"	"FACOM"	"2018-01-09"
"105        "	"Luiz Gustavo Almeida Martins"	"FACOM"	"2008-05-04"
"1700       "	"Ailton Gonçalves Rodrigues Junior"	"INBIO"	"2021-10-12"
"1701       "	"Ariádine Cristine de Almeida"	"INBIO"	"2013-01-02"
"1702       "	"Giuliano Buzá Jacobucci"	"INBIO"	"2005-08-05"
"1703       "	"Jeamylle Nilin Gonçalves"	"INBIO"	"2019-02-28"
"1704       "	"Cassiano Aimberê Dorneles Welker"	"INBIO"	"2016-06-07"
"10000000000"	"Jean Ponciano"	"FACOM"	"2005-10-10"
"10000000001"	"Elaine Ribeiro"	"FACOM"	"2005-09-10"
"10000000010"	"Alexsandro Soares"	"FACOM"	"2005-08-10"
"10000000011"	"Pedro Frosi"	"FACOM"	"2000-10-10"
"10000000100"	"Marcia Aparecida Fernandes"	"FACOM"	"2005-01-10"
"1500       "	"Adriano Mota Loyola"	"FOUFU"	"1988-12-01"
"1501       "	"Alessandra Maia de Castro Prado"	"FOUFU"	"2010-03-26"
"1502       "	"Álex Moreira Herval"	"FOUFU"	"2019-06-18"
"1503       "	"Ana Paula Turrioni Hidalgo"	"FOUFU"	"2015-12-01"
"1504       "	"Ana Paula de Lima Oliveira"	"FOUFU"	"2014-04-01"
"1600       "	"Belchior de Sousa"	"IARTE"	"2019-10-25"
"1605       "	"Elsieni Coelho da Silva"	"IARTE"	"2021-05-20"
"1610       "	"Gastao da Cunha Frota"	"IARTE"	"2012-06-15"
"1615       "	"Nikoleta Tzvetanova Kerinska"	"IARTE"	"2018-08-10"
"1620       "	"Renato Palumbo Doria"	"IARTE"	"2020-11-05"
"400        "	"Adriana Pastorello Buim Arena"	"ESTES"	"2004-08-02"
"401        "	"Aldeci Cacique Calixto"	"ESTES"	"2000-05-10"
"402        "	"Aléxia Pádua Franco"	"ESTES"	"2008-10-11"
"403        "	"Ana Beatriz da Silva Duarte"	"ESTES"	"2014-12-06"
"404        "	"Andrea Maturano Longarezi"	"ESTES"	"1998-05-08"
"420        "	"Jailson Mendes"	"FAEDU"	"1982-02-02"
"421        "	"Gabriel Jesus"	"FAEDU"	"1982-03-04"
"422        "	"Luciano Hulk"	"FAEDU"	"1983-10-11"
"423        "	"João Guilherme"	"FAEDU"	"1990-11-11"
"424        "	"Péricles Mendes"	"FAEDU"	"1985-09-07"
"1400       "	"Alcino Eduardo Bonella"	"IFILO"	"2009-12-30"
"1401       "	"Alexandre Guimarães Tadeu de Soares"	"IFILO"	"2003-11-01"
"1402       "	"Ana Maria Said"	"IFILO"	"2009-01-30"
"1403       "	"Anselmo Tadeu Ferreira"	"IFILO"	"2010-06-09"
"1404       "	"Dennys Garcia Xavier"	"IFILO"	"2011-11-05"
"1300       "	"Kelly Aparecida Geraldo Yoneyama Tudini"	"FAMEV"	"2000-09-09"
"1301       "	"Lucas de Assis Ribeiro"	"FAMEV"	"2005-07-26"
"1302       "	"Natália Mundim Tôrres"	"FAMEV"	"2007-07-09"
"1303       "	"Tiago Wilson Patriarca Mineo "	"FAMEV"	"2004-10-07"
"1304       "	"Neide Maria da Silva "	"FAMEV"	"2000-12-09"
"601        "	"Alexandre Garrido da Silva"	"FADIR"	"2010-08-15"
"602        "	"Beatriz Corrêa Camargo"	"FADIR"	"2015-03-21"
"603        "	"Daniela de Melo Crosara"	"FADIR"	"2022-08-03"
"604        "	"Fernando Rodrigues Martins"	"FADIR"	"2002-01-26"
"620        "	"Gustavo de Carvalho Marin"	"FADIR"	"2006-08-11"
"300        "	"Ademir Cavalheiro"	"INFIS"	"2007-12-10"
"301        "	"Adevailton Bernardo dos Santos"	"INFIS"	"2003-11-07"
"302        "	"Alessandra Riposati Arantes"	"INFIS"	"2012-01-12"
"303        "	"Djalmir Nestor Messias"	"INFIS"	"2003-11-07"
"304        "	"Marcel Novaes"	"INFIS"	"2012-01-12"
"2005       "	"Alberto da Silva Morais"	"ICBIM"	"2008-11-11"
"2006       "	"Carlos Hernrique Gomes"	"ICBIM"	"2019-01-10"
"2007       "	"Daniela Cristina de Oliveira"	"ICBIM"	"2010-03-05"
"2008       "	"Disney Oliver"	"ICBIM"	"2019-01-01"
"2009       "	"Henrique Tomaz Gonzaga"	"ICBIM"	"2020-09-09"
"1812       "	"Jamil Salem"	"ICIAG"	"1969-08-14"
"1813       "	"Julia Vingadora"	"ICIAG"	"2004-06-06"
"1814       "	"Roberto Carlos"	"ICIAG"	"1971-10-08"
"1815       "	"Cláudio Assembly"	"ICIAG"	"1969-12-01"
"1816       "	"Elaine Java"	"ICIAG"	"2000-09-11"
"900        "	"Lilian Rodrigues Sant’ Anna Campos"	"ESTES"	"2019-07-24"
"901        "	"Clelia Regina Cafer"	"ESTES"	"2008-02-20"
"902        "	"Marisa Aparecida Elias"	"ESTES"	"2017-06-13"
"903        "	"Barbara Dias Rezende Gontijo"	"ESTES"	"2014-06-04"
"904        "	"Tatiana Carneiro de Resende"	"ESTES"	"2010-01-26"
"500        "	"Alessandro Gomes Enoque"	"FACIP"	"2010-05-10"
"501        "	"Alex Fernando Borges"	"FACIP"	"2012-02-22"
"502        "	"Alexandre Alves Alvenha"	"FACIP"	"2020-10-02"
"503        "	"Alexandre Cacheffo"	"FACIP"	"2000-11-15"
"504        "	"Alexandre Calzavara Yoshida"	"FACIP"	"2016-06-17"
"3333       "	"André Backes"	"FACOM"	"20015-06-02"
"200        "	"Admilson Lopes dos Santos"	"FAM  "	"2013-12-10"
"201        "	"Adriana Rodrigues da Silva"	"FAM  "	"2010-03-26"
"202        "	"Camila Mariana Ruiz"	"FAM  "	"2022-05-30"
"203        "	"Fernando Rodrigo Rafaeli"	"FAM  "	"2014-06-03"
"204        "	"Taciana Oliveira Souza"	"FAM  "	"2013-11-12"
*/

DELETE FROM faculdade WHERE sigla='FAM';
/*
ERROR:  update or delete on table "faculdade" violates foreign key constraint "fk_faculdade" on table "professor"
*/
--
ALTER TABLE ONLY universidade.estudante
    ADD CONSTRAINT fk_faculdade FOREIGN KEY (fac_est) REFERENCES universidade.faculdade(sigla)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM estudante;

UPDATE faculdade SET sigla = 'FEQ' WHERE sigla = 'FEELT';
/*
"1710       "	"Jonas Caravalho"	"1990-09-12"	"INBIO"	70	"1700       "
"1711       "	"Luna da Conceição"	"1987-07-19"	"INBIO"	60.2	
"1712       "	"Ana Silveira"	"2003-07-22"	"INBIO"	80.9	"1703       "
"1713       "	"Guilherme da Cunha"	"2000-12-02"	"INBIO"	66.6	"1701       "
"1714       "	"Davi Lucca Duarte"	"1974-09-25"	"INBIO"	55.3	"1700       "
"205        "	"Joao Vitor Correia"	"2000-03-05"	"FAMAT"	70	"204        "
"206        "	"Marina Silva Gomes"	"2002-08-17"	"FAMAT"	85	"203        "
"207        "	"Maria Julia Oliveira"	"1999-11-02"	"FAMAT"	90	"202        "
"208        "	"Vicente Araujo Mendes"	"1995-04-14"	"FAMAT"	80	"200        "
"209        "	"Alexandre Oliveira Rodrigues"	"2001-05-20"	"FAMAT"	65	"201        "
"1500       "	"Vinicius Ribeiro"	"1993-01-06"	"FOUFU"	100	"1500       "
"1501       "	"César Bertolin"	"1993-01-06"	"FOUFU"	50	"1501       "
"1502       "	"Bruno José"	"1900-01-06"	"FOUFU"	100	"1502       "
"1503       "	"Elaine Maria"	"1989-01-06"	"FOUFU"	60	"1503       "
"1504       "	"Carlos Silva"	"1993-01-06"	"FOUFU"	70	"1504       "
"12021BAV001"	"Isabella Melo Sousa"	"2000-03-11"	"IARTE"	8	"1600       "
"12021BAV016"	"Jose Almeida Azevedo"	"2002-05-21"	"IARTE"	7	"1605       "
"12021BAV029"	"Aline Oliveira Araujo"	"2001-08-15"	"IARTE"	8	"1600       "
"12021BAV040"	"Andre Silva Martins"	"2000-09-03"	"IARTE"	7	"1610       "
"12021BAV020"	"Lavinia Sousa Carvalho"	"2002-10-18"	"IARTE"	8	"1600       "
"420        "	"Victor Guilherme Oliveira Santos"	"1998-11-20"	"ESTES"	96.3	"400        "
"421        "	"Sara Pelegrineti de José"	"1974-01-01"	"ESTES"	99.7	"401        "
"422        "	"Davi Rui Pasquim"	"2002-04-17"	"ESTES"	76.8	"402        "
"423        "	"Diego Ruas"	"1995-12-20"	"ESTES"	85.9	"403        "
"424        "	"Pedro Tiene Silva"	"2003-05-22"	"ESTES"	63.8	"404        "
"444        "	"Jason Manmoa"	"1962-03-06"	"FAEDU"	67.5	"420        "
"445        "	"Scott Pilgrim"	"1964-04-04"	"FAEDU"	88.3	"421        "
"446        "	"Naruto Uzumaki"	"1967-12-11"	"FAEDU"	59	"421        "
"447        "	"Frederico Krueger"	"1968-03-20"	"FAEDU"	78.5	"423        "
"448        "	"Jason Thirtenn"	"1968-03-20"	"FAEDU"	98.5	"423        "
"1405       "	"Aline Ferreira Magalhaes"	"2000-06-04"	"IFILO"	70	"1400       "
"1406       "	"Cristiano Bueno de Almeida"	"2002-07-13"	"IFILO"	88.9	"1400       "
"1407       "	"Derli Luis Arantes Junior"	"2001-12-20"	"IFILO"	77	"1403       "
"1408       "	"Gladston Marcelo Pereira do Vale"	"2000-05-11"	"IFILO"	80.2	"1403       "
"1409       "	"Kamila Stephany Alves Santos"	"2005-07-30"	"IFILO"	66	"1402       "
"1300       "	"João Augusto Silva"	"2000-09-09"	"FAMEV"	80	
"1301       "	"Pedro Nunes"	"2001-12-09"	"FAMEV"	90	"1300       "
"1302       "	"Augusto Pereira"	"1999-01-28"	"FAMEV"	73	
"1303       "	"Maria Ferreira"	"2000-02-02"	"FAMEV"	95	"1304       "
"1304       "	"Ana Paula Freitas"	"2002-10-18"	"FAMEV"	89	
"605        "	"Elaine Ribeiro de Faria Paiva"	"1998-01-26"	"FADIR"	89	"603        "
"606        "	"Fernando Souza"	"1999-03-12"	"FADIR"	67.25	"603        "
"607        "	"Rafael Silva"	"2002-12-01"	"FADIR"	78.55	"604        "
"608        "	"João Marcos Ramos"	"2001-05-12"	"FADIR"	87.9	"604        "
"609        "	"Marcos Estefam"	"2000-07-15"	"FADIR"	75.15	"604        "
"305        "	"Neil Gaiman"	"2000-11-10"	"INFIS"	90.5	"300        "
"306        "	"Robert Louis Stevenson"	"1999-11-13"	"INFIS"	85	"301        "
"307        "	"Anne Rice"	"2000-10-04"	"INFIS"	78.2	"302        "
"308        "	"Bram Stocker"	"2000-11-08"	"INFIS"	88	"302        "
"309        "	"Marry Shelley"	"1999-08-30"	"INFIS"	91.7	"303        "
"2010       "	"Peter Benjamin Parker"	"1993-08-27"	"ICBIM"	100	"2008       "
"2011       "	"Peter Kavinsky"	"2003-08-03"	"ICBIM"	70	"2009       "
"2012       "	"Lara Jean"	"2002-04-06"	"ICBIM"	99	"2005       "
"2013       "	"Percy Jackson"	"1993-08-18"	"ICBIM"	75	"2007       "
"2014       "	"Veronica Lodge"	"1994-06-29"	"ICBIM"	60	"2006       "
"1807       "	"Annelise Salem"	"2002-08-06"	"ICIAG"	20	"1812       "
"1808       "	"Victor Bagliano"	"2000-07-14"	"ICIAG"	90.2	
"1809       "	"Leandro Peres"	"2001-09-12"	"ICIAG"	60	
"1810       "	"Marina Barcelos"	"2002-10-14"	"ICIAG"	70	
"1811       "	"Gabriel Hugo Borges"	"1999-12-14"	"ICIAG"	40.5	"1813       "
"950        "	"Gustavo Duarte Gomides"	"2002-12-12"	"ESTES"	85.5	"904        "
"951        "	"Rodrigo Alves da Silva"	"1990-05-20"	"ESTES"	75.2	"900        "
"952        "	"Julia Echeverria"	"1999-09-05"	"ESTES"	90.8	"902        "
"953        "	"Guilherme Duarte"	"1998-10-15"	"ESTES"	800	"904        "
"954        "	"Rodrigo da Silva"	"2000-01-01"	"ESTES"	60.2	"900        "
"12021GEO001"	"Rafael Henrique Guimarães"	"2003-03-14"	"FACIP"	88.4	"501        "
"12021GEO002"	"Felipe Langer"	"2000-04-01"	"FACIP"	86.7	"501        "
"12021GEO003"	"Lucas Daniel Cunha"	"2002-12-28"	"FACIP"	84.2	"502        "
"12021GEO004"	"Laura Rezende Teixeira Santos"	"2003-08-13"	"FACIP"	91.3	"503        "
"12021GEO005"	"Mariana Serrano Guimaraes"	"1998-01-06"	"FACIP"	92.1	"504        "
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FEELT"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FEELT"	68.1	"102        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FEELT"	56.9	"103        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FEELT"	81.4	"104        "
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FEELT"	47.5	"105        "
"221BSI251ST"	"Henrique Corrêa de Oliveira"	"2000-01-26"	"FEELT"	75.7	"10000000010"
"222BCC201ST"	"Gabriel de Araujo"	"2000-04-09"	"FEELT"	72.3	"10000000011"
"189BSI255ST"	"Luisa Gomes Ferreira"	"2000-02-07"	"FEELT"	78.3	"10000000001"
"221BSI255ST"	"Gabriela Pereira"	"2000-07-07"	"FEELT"	71.3	"10000000000"
"189BSI232ST"	"Gabriel Alves"	"2000-09-19"	"FEELT"	68.3	"10000000100"
"199        "	"Alexandre Borba Chiqueta"	"1999-05-14"	"FEELT"	80.58	"100        "
"198        "	"Flávio Fernandes"	"1998-08-02"	"FEELT"	83.01	"100        "
"197        "	"Gabrel Toledo"	"1983-07-02"	"FEELT"	85	"102        "
"196        "	"Nicolas Paolinelli"	"1995-03-26"	"FEELT"	79.64	"100        "
"195        "	"Matheus Brasileiro Aguiar"	"1990-09-17"	"FEELT"	77.98	"104        "
*/
DELETE FROM faculdade WHERE sigla = 'FEQ';

--
ALTER TABLE ONLY universidade.disciplina
    ADD CONSTRAINT fk_faculdade FOREIGN KEY (fac_disc) REFERENCES universidade.faculdade(sigla)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM disciplina;

UPDATE faculdade SET sigla = 'FEELT' WHERE sigla = 'FACOM';
/*
"GEDU43"	"Comportamento Motor "	"FAEDU"	90
"GMV003"	"Bioquímica 1"	"FAMEV"	75
"GMV007"	"Bioquímica 2"	"FAMEV"	75
"GMV005"	"Fundamentos de Anatomia Veterinária"	"FAMEV"	75
"GMV006"	"Anatomia dos Animais Domésticos"	"FAMEV"	75
"GMV001"	"Citologia, Histologia e Embriologia"	"FAMEV"	75
"1410  "	"Filosofia Geral: Problemas Metafísicos"	"IFILO"	60
"1411  "	"História da Filosofia Medieval"	"IFILO"	30
"1412  "	"Ética"	"IFILO"	90
"1413  "	"Psicologia da Educação"	"IFILO"	60
"1414  "	"Didática Geral"	"IFILO"	60
"1415  "	"Etica II"	"IFILO"	90
"1416  "	"Didática Geral II"	"IFILO"	60
"GAV001"	"Historia da Arte I"	"IARTE"	60
"GAV007"	"Historia da Arte II"	"IARTE"	60
"GAV013"	"Arte Contemporanea I"	"IARTE"	60
"GAV019"	"Arte Contemporanea II"	"IARTE"	60
"GAV010"	"Arte Computacional"	"IARTE"	60
"31505 "	"Avaliação de Impactos Ambiental para Biólogos"	"INBIO"	60
"39030 "	"Biologia e Cultura - (PROINTER III)"	"INBIO"	60
"31104 "	"Construção do Conhecimento Científico"	"INBIO"	30
"31602 "	"Evolução"	"INBIO"	60
"31407 "	"Profissão Biólogo"	"INBIO"	30
"FADIR3"	"Teoria do Direito"	"FADIR"	60
"FADIR4"	"Direito Digital"	"FADIR"	30
"FADIR5"	"Direito do Trabalho 1"	"FADIR"	60
"FADIR6"	"Direito do Trabalho 2"	"FADIR"	30
"FADIR7"	"Direito Financeiro"	"FADIR"	30
"311   "	"Física Básica II"	"INFIS"	90
"312   "	"Física Básica III"	"INFIS"	90
"313   "	"Geometrica Analítica"	"INFIS"	60
"314   "	"Algoritmos e Programação de Computadores"	"INFIS"	60
"2000  "	"Analises Clinicas"	"ICBIM"	40
"2001  "	"Imunologia"	"ICBIM"	30
"2002  "	"Genetica"	"ICBIM"	20
"2003  "	"Microbiologia"	"ICBIM"	30
"2004  "	"Biossegurança"	"ICBIM"	40
"1801  "	"Construções Rurais"	"ICIAG"	60
"1802  "	"Adubos e Adubação"	"ICIAG"	60
"1803  "	"Manejo e Conservação do Solo e da Água"	"ICIAG"	60
"1804  "	"Irrigação e Drenagem"	"ICIAG"	75
"1805  "	"Agrometeorologia"	"ICIAG"	60
"ESTES1"	"Fundamentos em Enfermagem"	"ESTES"	75
"ESTES2"	"Saúde Coletiva I"	"ESTES"	45
"ESTES3"	"Saúde Coletiva II"	"ESTES"	30
"ESTES4"	"Enfermagem Médica"	"ESTES"	60
"ESTES5"	"Psicologia e Ética"	"ESTES"	45
"GGO001"	"Geologia 1"	"FACIP"	60
"GGO002"	"Climatologia 1"	"FACIP"	60
"GGO003"	"Teoria e método em Geografia"	"FACIP"	60
"GGO004"	"Cartografia"	"FACIP"	60
"GGO005"	"PIPE 1"	"FACIP"	60
"GGO011"	"Geologia 2"	"FACIP"	60
"GGO012"	"Climatologia 2"	"FACIP"	60
"MAT201"	"Fundamentos de Matemática Elementar I"	"FAMAT"	90
"MAT211"	"Fundamentos de Matemática Elementar II"	"FAMAT"	90
"MAT212"	"Cálculo Diferencial e Integral I"	"FAMAT"	90
"MAT213"	"Cálculo Diferencial e Integral II"	"FAMAT"	90
"MAT214"	"Geometria Analitica"	"FAMAT"	90
"GOG001"	"Unidade de Constituição do Organismo"	"FOUFU"	210
"GOG002"	"Unidade de Funcionamento do Organismo I"	"FOUFU"	120
"GOG003"	"Un. de Reabilitação Integral do Ap. Estomatognático I"	"FOUFU"	60
"GOG004"	"Unidade de Investigação Científica I (UIC1)"	"FOUFU"	45
"GOG005"	"Unidade de Saúde Humana I (USH1)"	"FOUFU"	30
"410   "	"Metodologia do Ensino de Ciência"	"ESTES"	120
"411   "	"Estágio Supervisionado I"	"ESTES"	150
"412   "	"Construção do Discurso Escrito"	"ESTES"	60
"413   "	"Metodologia do Ensino da Língua Portuguesa"	"ESTES"	120
"414   "	"Filosofia da Educação"	"ESTES"	60
"GEDU31"	"Fisiologia do Exercício"	"FAEDU"	90
"GEDU32"	"Teoria e Prática do Treinamento I"	"FAEDU"	60
"GEDU41"	"Ritmo e Expressão"	"FAEDU"	60
"GEDU42"	"Teoria e Prática do Treinamento II"	"FAEDU"	60
"7777  "	"Física Básica I"	"INFIS"	90
"GBC045"	"Programação Procedimental"	"FEELT"	90
"GBC023"	"Algoritmo e Estrutura de Dados 1"	"FEELT"	90
"GBC024"	"Algoritmo e Estrutura de Dados 2"	"FEELT"	70
"GBC034"	"Programação Orientada a Objetos"	"FEELT"	60
"GBC012"	"Lógica"	"FEELT"	60
"BCC002"	"Lógica para Programação"	"FEELT"	60
"BCC003"	"Cálculo 1"	"FEELT"	60
"BCC005"	"Arquitetura e Organização de Computadores"	"FEELT"	60
"GBC043"	"Sistemas de Banco de Dados"	"FEELT"	90
"GSI023"	"Redes de computadores"	"FEELT"	60
"GSI034"	"Projeto e desenvolvimento 1"	"FEELT"	60
"GSI030"	"Engenharia de Software"	"FEELT"	60
"GSI027"	"Otimização"	"FEELT"	60
*/
DELETE FROM faculdade WHERE sigla = 'FEELT';
/*
ERROR:  update or delete on table "faculdade" violates foreign key constraint "fk_faculdade" on table "estudante"
*/
--
ALTER TABLE ONLY universidade.frequenta
    ADD CONSTRAINT fk_frequenta_turma FOREIGN KEY (id_turma) REFERENCES universidade.turma(id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;
	
SELECT * FROM turma;
UPDATE turma SET id = 9999 WHERE id = 920;
/*
921	"1B"	1	2022	"ESTES1"	"4K   "	205
922	"1A"	1	2022	"ESTES2"	"4K   "	206
923	"1A"	1	2022	"ESTES3"	"4K   "	207
924	"1A"	2	2022	"ESTES4"	"4K   "	206
925	"1A"	2	2022	"ESTES5"	"4K   "	207
511	"33"	1	2022	"GGO002"	"3K   "	101
512	"33"	2	2022	"GGO012"	"3K   "	101
513	"31"	1	2021	"GGO001"	"3K   "	102
514	"31"	2	2021	"GGO011"	"3K   "	102
515	"29"	2	2020	"GGO012"	"3K   "	103
1300	"A "	1	2022	"GMV003"	"1BCG "	101
1301	"B "	1	2022	"GMV007"	"1BCG "	102
1302	"C "	1	2022	"GMV005"	"1BCG "	103
1303	"D "	1	2022	"GMV006"	"1BCG "	103
1304	"E "	1	2022	"GMV001"	"1BCG "	102
1305	"F "	1	2022	"GMV005"	"1BCG "	103
1720	"C "	1	2022	"31505 "	"8C   "	119
1721	"D "	1	2022	"31505 "	"8C   "	119
1722	"C "	1	2022	"39030 "	"2D   "	13
1723	"C "	1	2022	"31104 "	"8C   "	121
1724	"C "	1	2022	"31602 "	"8C   "	322
1725	"C "	1	2022	"31407 "	"8C   "	123
1417	"A "	1	2022	"1410  "	"1U   "	204
1418	"A "	1	2022	"1411  "	"5O-A "	206
1419	"A "	1	2022	"1412  "	"5O-A "	206
1420	"A "	2	2022	"1413  "	"5O-A "	207
1421	"A "	2	2022	"1414  "	"1U   "	204
1422	"B "	2	2022	"1414  "	"1U   "	204
10	"55"	1	2015	"GAV001"	"5S   "	207
20	"57"	2	2016	"GAV007"	"5S   "	205
30	"59"	1	2017	"GAV013"	"5S   "	208
40	"61"	2	2018	"GAV019"	"5S   "	207
50	"63"	1	2019	"GAV010"	"5S   "	205
218	"A "	1	2018	"MAT201"	"1F   "	215
219	"B "	2	2019	"MAT211"	"1F   "	216
220	"C "	1	2020	"MAT212"	"1F   "	217
221	"D "	2	2021	"MAT213"	"1F   "	215
222	"E "	2	2022	"MAT214"	"1F   "	216
223	"F "	2	2022	"MAT214"	"1F   "	216
1	"01"	1	2022	"GBC043"	"1BBSI"	127
2	"02"	2	2022	"GBC043"	"1BBSI"	127
3	"03"	2	2022	"GSI023"	"1BBSI"	128
4	"04"	2	2022	"GSI034"	"1BBSI"	129
5	"05"	2	2022	"GSI027"	"1BBSI"	128
1500	"17"	1	2022	"GOG001"	"UMU4L"	39
1501	"17"	1	2021	"GOG001"	"UMU4L"	39
1502	"18"	2	2021	"GOG002"	"UMU3L"	38
1503	"19"	2	2022	"GOG003"	"UMU4L"	39
1504	"20"	1	2023	"GOG004"	"UMU1L"	37
430	"65"	2	2020	"410   "	"1G   "	101
431	"66"	1	2020	"410   "	"1G   "	101
432	"67"	2	2020	"411   "	"1G   "	102
433	"68"	1	2021	"412   "	"1G   "	103
434	"69"	2	2021	"413   "	"1G   "	104
400	"00"	2	1982	"GEDU31"	"1A   "	490
401	"01"	1	1983	"GEDU32"	"1A   "	490
402	"02"	2	1983	"GEDU41"	"1A   "	491
403	"03"	2	1990	"GEDU42"	"1A   "	491
404	"04"	2	1995	"GEDU43"	"1A   "	492
405	"05"	2	1995	"GEDU43"	"1A   "	492
155	"63"	2	2020	"GBC034"	"1B   "	204
154	"64"	1	2021	"GBC034"	"1B   "	203
153	"65"	2	2021	"GBC024"	"5R   "	103
152	"66"	1	2022	"GBC023"	"5R   "	103
151	"67"	2	2022	"GBC045"		
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
652	"D2"	1	2021	"FADIR5"	"3D   "	104
653	"D3"	2	2022	"FADIR6"		
654	"D4"	1	2022	"FADIR6"		
315	"A1"	2	2020	"310   "	"1X   "	2
316	"A2"	2	2020	"310   "	"1X   "	2
317	"B1"	1	2020	"311   "	"1X   "	3
318	"C1"	1	2021	"312   "	"1X   "	1
319	"D1"	1	2021	"313   "	"1X   "	1
320	"E1"	2	2021	"314   "	"1X   "	1
2015	"A "	1	2022	"2000  "	"2A   "	1
2016	"B "	1	2022	"2001  "	"2A   "	2
2017	"C "	1	2022	"2002  "	"2A   "	3
2018	"D "	1	2022	"2003  "	"2A   "	4
2019	"E "	1	2022	"2004  "	"2A   "	5
2020	"F "	1	2022	"2004  "	"2A   "	6
1817	"01"	1	2021	"1801  "	"2E   "	201
1818	"02"	2	2021	"1801  "	"2E   "	201
1819	"03"	1	2022	"1803  "	"2E   "	201
1820	"04"	2	2022	"1804  "	"2E   "	202
1821	"05"	1	2023	"1802  "	"2E   "	202
1111	"06"	1	2023	"1805  "	"2E   "	203
9999	"1A"	1	2022	"ESTES1"	"4K   "	205
*/
--	
ALTER TABLE ONLY universidade.horario_aula
    ADD CONSTRAINT fk_horario_aula FOREIGN KEY (id_hora) REFERENCES universidade.horario(id_hora)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;
	
SELECT * FROM horario_aula;
UPDATE horario SET id_hora = 'z' WHERE id_hora = 'a';
/*
"2"	"i"	155
"2"	"j"	155
"2"	"d"	154
"2"	"f"	154
"4"	"b"	153
"6"	"c"	152
"6"	"e"	152
"4"	"f"	151
"4"	"g"	151
"2"	"b"	651
"3"	"b"	651
"3"	"c"	651
"3"	"d"	651
"5"	"e"	652
"2"	"f"	315
"3"	"m"	316
"4"	"f"	318
"6"	"f"	320
"2"	"f"	2019
"3"	"b"	2017
"4"	"k"	2016
"5"	"g"	2018
"6"	"d"	2015
"2"	"b"	1818
"4"	"f"	1819
"4"	"g"	1820
"6"	"b"	1821
"2"	"c"	922
"3"	"c"	923
"4"	"c"	925
"3"	"c"	512
"4"	"e"	513
"5"	"g"	514
"6"	"i"	515
"4"	"d"	1302
"4"	"d"	1305
"5"	"q"	1303
"6"	"l"	1301
"2"	"b"	1720
"4"	"g"	1725
"6"	"l"	1722
"6"	"m"	1722
"2"	"b"	1418
"3"	"c"	1419
"4"	"b"	1421
"3"	"m"	30
"4"	"p"	40
"5"	"o"	50
"3"	"e"	219
"4"	"c"	220
"5"	"p"	221
"6"	"i"	222
"3"	"b"	2
"4"	"c"	3
"5"	"d"	4
"6"	"e"	5
"2"	"b"	1501
"4"	"k"	1502
"4"	"k"	1503
"2"	"g"	431
"2"	"g"	433
"3"	"b"	401
"4"	"c"	402
"5"	"d"	403
"6"	"e"	404
"4"	"z"	153
"2"	"z"	650
"3"	"z"	317
"5"	"z"	319
"2"	"z"	1817
"2"	"z"	920
"3"	"z"	921
"4"	"z"	924
"2"	"z"	511
"2"	"z"	1720
"2"	"z"	1417
"4"	"z"	1420
"2"	"z"	20
"2"	"z"	218
"2"	"z"	1
"2"	"z"	430
"2"	"z"	432
"2"	"z"	434
"2"	"z"	400
*/
DELETE FROM horario WHERE id_hora = 'z';
/*
ERROR:  update or delete on table "horario" violates foreign key constraint "fk_horario_aula" on table "horario_aula"
*/
--	
ALTER TABLE ONLY universidade.pre_requisito
    ADD CONSTRAINT fk_pre_requisito FOREIGN KEY (cod_pre) REFERENCES universidade.disciplina(codigo)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM pre_requisito;
UPDATE disciplina SET codigo = '9999' WHERE codigo= 'MAT201';
/*
"GBC023"	"GBC045"
"GBC024"	"GBC023"
"GMV007"	"GMV003"
"GMV006"	"GMV005"
"1415  "	"1412  "
"1416  "	"1414  "
"GAV007"	"GAV001"
"GAV019"	"GAV013"
"FADIR4"	"FADIR3"
"FADIR6"	"FADIR5"
"311   "	"310   "
"312   "	"311   "
"2001  "	"2000  "
"2003  "	"2002  "
"1805  "	"1804  "
"1805  "	"1803  "
"ESTES4"	"ESTES1"
"ESTES3"	"ESTES2"
"GGO011"	"GGO001"
"GGO012"	"GGO002"
"MAT213"	"MAT212"
"GSI034"	"GBC043"
"GOG005"	"GOG001"
"GEDU42"	"GEDU32"
"GEDU43"	"GEDU31"
"MAT211"	"9999  "
*/
DELETE FROM disciplina WHERE codigo = '9999';
/*
ERROR:  update or delete on table "disciplina" violates foreign key constraint "fk_disciplina" on table "turma"
*/
--	
ALTER TABLE ONLY universidade.ensina
    ADD CONSTRAINT fk_prof_ensina FOREIGN KEY (id_prof) REFERENCES universidade.professor(id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM ensina;
UPDATE professor SET id = '6666' WHERE nome = 'Camila Mariana Ruiz';
/*
"100        "	155
"101        "	151
"102        "	154
"103        "	152
"104        "	153
"601        "	650
"601        "	651
"602        "	650
"602        "	652
"603        "	653
"603        "	652
"603        "	654
"604        "	652
"604        "	653
"604        "	654
"620        "	651
"620        "	652
"620        "	654
"300        "	315
"300        "	317
"301        "	316
"302        "	318
"303        "	319
"304        "	320
"2005       "	2015
"2006       "	2016
"2007       "	2017
"2008       "	2018
"2009       "	2019
"1812       "	1817
"1812       "	1818
"1813       "	1819
"1814       "	1820
"1815       "	1821
"900        "	920
"901        "	921
"902        "	922
"902        "	923
"903        "	924
"904        "	925
"500        "	511
"501        "	512
"502        "	513
"503        "	514
"504        "	515
"1300       "	1300
"1301       "	1300
"1302       "	1301
"1303       "	1302
"1304       "	1300
"1700       "	1720
"1701       "	1722
"1701       "	1723
"1704       "	1725
"1702       "	1721
"1400       "	1417
"1401       "	1419
"1402       "	1417
"1403       "	1418
"1404       "	1419
"1600       "	10
"1605       "	20
"1610       "	30
"1605       "	40
"1620       "	50
"200        "	218
"201        "	219
"203        "	221
"204        "	222
"204        "	223
"10000000000"	2
"10000000001"	3
"10000000010"	4
"10000000011"	5
"10000000100"	3
"1500       "	1500
"1501       "	1501
"400        "	430
"401        "	431
"402        "	432
"403        "	433
"404        "	434
"420        "	400
"421        "	401
"422        "	402
"423        "	403
"424        "	405
"1816       "	0
"6666       "	220
*/

DELETE FROM professor WHERE nome = 'Camila Mariana Ruiz';
/*
ERROR:  update or delete on table "professor" violates foreign key constraint "fk_prof_ensina" on table "ensina"
*/
--
ALTER TABLE ONLY universidade.turma
    ADD CONSTRAINT fk_sala FOREIGN KEY (predio_s, n_sala) REFERENCES universidade.sala(predio, numero)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM turma;
UPDATE sala SET numero = 456 WHERE numero = 205;
/*
922	"1A"	1	2022	"ESTES2"	"4K   "	206
923	"1A"	1	2022	"ESTES3"	"4K   "	207
924	"1A"	2	2022	"ESTES4"	"4K   "	206
925	"1A"	2	2022	"ESTES5"	"4K   "	207
511	"33"	1	2022	"GGO002"	"3K   "	101
512	"33"	2	2022	"GGO012"	"3K   "	101
513	"31"	1	2021	"GGO001"	"3K   "	102
514	"31"	2	2021	"GGO011"	"3K   "	102
515	"29"	2	2020	"GGO012"	"3K   "	103
1300	"A "	1	2022	"GMV003"	"1BCG "	101
1301	"B "	1	2022	"GMV007"	"1BCG "	102
1302	"C "	1	2022	"GMV005"	"1BCG "	103
1303	"D "	1	2022	"GMV006"	"1BCG "	103
1304	"E "	1	2022	"GMV001"	"1BCG "	102
1305	"F "	1	2022	"GMV005"	"1BCG "	103
1720	"C "	1	2022	"31505 "	"8C   "	119
1721	"D "	1	2022	"31505 "	"8C   "	119
1722	"C "	1	2022	"39030 "	"2D   "	13
1723	"C "	1	2022	"31104 "	"8C   "	121
1724	"C "	1	2022	"31602 "	"8C   "	322
1725	"C "	1	2022	"31407 "	"8C   "	123
1417	"A "	1	2022	"1410  "	"1U   "	204
1418	"A "	1	2022	"1411  "	"5O-A "	206
1419	"A "	1	2022	"1412  "	"5O-A "	206
1420	"A "	2	2022	"1413  "	"5O-A "	207
1421	"A "	2	2022	"1414  "	"1U   "	204
1422	"B "	2	2022	"1414  "	"1U   "	204
10	"55"	1	2015	"GAV001"	"5S   "	207
30	"59"	1	2017	"GAV013"	"5S   "	208
40	"61"	2	2018	"GAV019"	"5S   "	207
218	"A "	1	2018	"MAT201"	"1F   "	215
219	"B "	2	2019	"MAT211"	"1F   "	216
220	"C "	1	2020	"MAT212"	"1F   "	217
221	"D "	2	2021	"MAT213"	"1F   "	215
222	"E "	2	2022	"MAT214"	"1F   "	216
223	"F "	2	2022	"MAT214"	"1F   "	216
1	"01"	1	2022	"GBC043"	"1BBSI"	127
2	"02"	2	2022	"GBC043"	"1BBSI"	127
3	"03"	2	2022	"GSI023"	"1BBSI"	128
4	"04"	2	2022	"GSI034"	"1BBSI"	129
5	"05"	2	2022	"GSI027"	"1BBSI"	128
1500	"17"	1	2022	"GOG001"	"UMU4L"	39
1501	"17"	1	2021	"GOG001"	"UMU4L"	39
1502	"18"	2	2021	"GOG002"	"UMU3L"	38
1503	"19"	2	2022	"GOG003"	"UMU4L"	39
1504	"20"	1	2023	"GOG004"	"UMU1L"	37
430	"65"	2	2020	"410   "	"1G   "	101
431	"66"	1	2020	"410   "	"1G   "	101
432	"67"	2	2020	"411   "	"1G   "	102
433	"68"	1	2021	"412   "	"1G   "	103
434	"69"	2	2021	"413   "	"1G   "	104
400	"00"	2	1982	"GEDU31"	"1A   "	490
401	"01"	1	1983	"GEDU32"	"1A   "	490
402	"02"	2	1983	"GEDU41"	"1A   "	491
403	"03"	2	1990	"GEDU42"	"1A   "	491
404	"04"	2	1995	"GEDU43"	"1A   "	492
405	"05"	2	1995	"GEDU43"	"1A   "	492
155	"63"	2	2020	"GBC034"	"1B   "	204
154	"64"	1	2021	"GBC034"	"1B   "	203
153	"65"	2	2021	"GBC024"	"5R   "	103
152	"66"	1	2022	"GBC023"	"5R   "	103
151	"67"	2	2022	"GBC045"		
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
652	"D2"	1	2021	"FADIR5"	"3D   "	104
653	"D3"	2	2022	"FADIR6"		
654	"D4"	1	2022	"FADIR6"		
315	"A1"	2	2020	"310   "	"1X   "	2
316	"A2"	2	2020	"310   "	"1X   "	2
317	"B1"	1	2020	"311   "	"1X   "	3
318	"C1"	1	2021	"312   "	"1X   "	1
319	"D1"	1	2021	"313   "	"1X   "	1
320	"E1"	2	2021	"314   "	"1X   "	1
2015	"A "	1	2022	"2000  "	"2A   "	1
2016	"B "	1	2022	"2001  "	"2A   "	2
2017	"C "	1	2022	"2002  "	"2A   "	3
2018	"D "	1	2022	"2003  "	"2A   "	4
2019	"E "	1	2022	"2004  "	"2A   "	5
2020	"F "	1	2022	"2004  "	"2A   "	6
1817	"01"	1	2021	"1801  "	"2E   "	201
1818	"02"	2	2021	"1801  "	"2E   "	201
1819	"03"	1	2022	"1803  "	"2E   "	201
1820	"04"	2	2022	"1804  "	"2E   "	202
1821	"05"	1	2023	"1802  "	"2E   "	202
920	"1A"	1	2022	"ESTES1"	"4K   "	456
921	"1B"	1	2022	"ESTES1"	"4K   "	456
20	"57"	2	2016	"GAV007"	"5S   "	456
50	"63"	1	2019	"GAV010"	"5S   "	456
*/
DELETE FROM sala WHERE numero = 456;
/*
ERROR:  update or delete on table "sala" violates foreign key constraint "fk_sala" on table "turma"
*/
--
ALTER TABLE ONLY universidade.horario_aula
    ADD CONSTRAINT fk_semana_aula FOREIGN KEY (id_sem) REFERENCES universidade.semana(id_sem)
	ON UPDATE CASCADE
	ON DELETE NO ACTION;

SELECT * FROM horario_aula;
UPDATE semana SET id_sem = '0' WHERE descricao = 'Domingo';
/*
"2"	"i"	155
"2"	"j"	155
"2"	"d"	154
"2"	"f"	154
"4"	"a"	153
"4"	"b"	153
"6"	"c"	152
"6"	"e"	152
"4"	"f"	151
"4"	"g"	151
"2"	"a"	650
"2"	"b"	651
"3"	"b"	651
"3"	"c"	651
"3"	"d"	651
"5"	"e"	652
"2"	"f"	315
"3"	"m"	316
"3"	"a"	317
"4"	"f"	318
"5"	"a"	319
"6"	"f"	320
"2"	"f"	2019
"3"	"b"	2017
"4"	"k"	2016
"5"	"g"	2018
"6"	"d"	2015
"2"	"a"	1817
"2"	"b"	1818
"4"	"f"	1819
"4"	"g"	1820
"6"	"b"	1821
"2"	"a"	920
"3"	"a"	921
"2"	"c"	922
"3"	"c"	923
"4"	"a"	924
"4"	"c"	925
"2"	"a"	511
"3"	"c"	512
"4"	"e"	513
"5"	"g"	514
"6"	"i"	515
"4"	"d"	1302
"4"	"d"	1305
"5"	"q"	1303
"6"	"l"	1301
"2"	"a"	1720
"2"	"b"	1720
"4"	"g"	1725
"6"	"l"	1722
"6"	"m"	1722
"2"	"a"	1417
"2"	"b"	1418
"3"	"c"	1419
"4"	"a"	1420
"4"	"b"	1421
"2"	"a"	20
"3"	"m"	30
"4"	"p"	40
"5"	"o"	50
"2"	"a"	218
"3"	"e"	219
"4"	"c"	220
"5"	"p"	221
"6"	"i"	222
"2"	"a"	1
"3"	"b"	2
"4"	"c"	3
"5"	"d"	4
"6"	"e"	5
"2"	"b"	1501
"4"	"k"	1502
"4"	"k"	1503
"2"	"a"	430
"2"	"g"	431
"2"	"a"	432
"2"	"g"	433
"2"	"a"	434
"2"	"a"	400
"3"	"b"	401
"4"	"c"	402
"5"	"d"	403
"6"	"e"	404
"0"	"a"	1300
"0"	"c"	10
"0"	"a"	1500
*/
DELETE FROM semana WHERE id_sem = '0';
/*
ERROR:  update or delete on table "semana" violates foreign key constraint "fk_semana_aula" on table "horario_aula"
*/
--
ALTER TABLE ONLY universidade.estudante
    ADD CONSTRAINT fk_tutor FOREIGN KEY (tutor) REFERENCES universidade.professor(id)
	ON UPDATE CASCADE
	ON DELETE SET NULL;

SELECT * FROM estudante;
UPDATE professor SET id = '4444' WHERE nome = 'André Backes';
/*
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	68.1	"102        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	81.4	"104        "
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FACOM"	47.5	"105        "
"1710       "	"Jonas Caravalho"	"1990-09-12"	"INBIO"	70	"1700       "
"1711       "	"Luna da Conceição"	"1987-07-19"	"INBIO"	60.2	
"1712       "	"Ana Silveira"	"2003-07-22"	"INBIO"	80.9	"1703       "
"1713       "	"Guilherme da Cunha"	"2000-12-02"	"INBIO"	66.6	"1701       "
"1714       "	"Davi Lucca Duarte"	"1974-09-25"	"INBIO"	55.3	"1700       "
"221BSI251ST"	"Henrique Corrêa de Oliveira"	"2000-01-26"	"FACOM"	75.7	"10000000010"
"222BCC201ST"	"Gabriel de Araujo"	"2000-04-09"	"FACOM"	72.3	"10000000011"
"189BSI255ST"	"Luisa Gomes Ferreira"	"2000-02-07"	"FACOM"	78.3	"10000000001"
"221BSI255ST"	"Gabriela Pereira"	"2000-07-07"	"FACOM"	71.3	"10000000000"
"189BSI232ST"	"Gabriel Alves"	"2000-09-19"	"FACOM"	68.3	"10000000100"
"205        "	"Joao Vitor Correia"	"2000-03-05"	"FAMAT"	70	"204        "
"206        "	"Marina Silva Gomes"	"2002-08-17"	"FAMAT"	85	"203        "
"207        "	"Maria Julia Oliveira"	"1999-11-02"	"FAMAT"	90	"202        "
"208        "	"Vicente Araujo Mendes"	"1995-04-14"	"FAMAT"	80	"200        "
"209        "	"Alexandre Oliveira Rodrigues"	"2001-05-20"	"FAMAT"	65	"201        "
"1500       "	"Vinicius Ribeiro"	"1993-01-06"	"FOUFU"	100	"1500       "
"1501       "	"César Bertolin"	"1993-01-06"	"FOUFU"	50	"1501       "
"1502       "	"Bruno José"	"1900-01-06"	"FOUFU"	100	"1502       "
"1503       "	"Elaine Maria"	"1989-01-06"	"FOUFU"	60	"1503       "
"1504       "	"Carlos Silva"	"1993-01-06"	"FOUFU"	70	"1504       "
"12021BAV001"	"Isabella Melo Sousa"	"2000-03-11"	"IARTE"	8	"1600       "
"12021BAV016"	"Jose Almeida Azevedo"	"2002-05-21"	"IARTE"	7	"1605       "
"12021BAV029"	"Aline Oliveira Araujo"	"2001-08-15"	"IARTE"	8	"1600       "
"12021BAV040"	"Andre Silva Martins"	"2000-09-03"	"IARTE"	7	"1610       "
"12021BAV020"	"Lavinia Sousa Carvalho"	"2002-10-18"	"IARTE"	8	"1600       "
"420        "	"Victor Guilherme Oliveira Santos"	"1998-11-20"	"ESTES"	96.3	"400        "
"421        "	"Sara Pelegrineti de José"	"1974-01-01"	"ESTES"	99.7	"401        "
"422        "	"Davi Rui Pasquim"	"2002-04-17"	"ESTES"	76.8	"402        "
"423        "	"Diego Ruas"	"1995-12-20"	"ESTES"	85.9	"403        "
"424        "	"Pedro Tiene Silva"	"2003-05-22"	"ESTES"	63.8	"404        "
"444        "	"Jason Manmoa"	"1962-03-06"	"FAEDU"	67.5	"420        "
"445        "	"Scott Pilgrim"	"1964-04-04"	"FAEDU"	88.3	"421        "
"446        "	"Naruto Uzumaki"	"1967-12-11"	"FAEDU"	59	"421        "
"447        "	"Frederico Krueger"	"1968-03-20"	"FAEDU"	78.5	"423        "
"448        "	"Jason Thirtenn"	"1968-03-20"	"FAEDU"	98.5	"423        "
"1405       "	"Aline Ferreira Magalhaes"	"2000-06-04"	"IFILO"	70	"1400       "
"1406       "	"Cristiano Bueno de Almeida"	"2002-07-13"	"IFILO"	88.9	"1400       "
"1407       "	"Derli Luis Arantes Junior"	"2001-12-20"	"IFILO"	77	"1403       "
"1408       "	"Gladston Marcelo Pereira do Vale"	"2000-05-11"	"IFILO"	80.2	"1403       "
"1409       "	"Kamila Stephany Alves Santos"	"2005-07-30"	"IFILO"	66	"1402       "
"199        "	"Alexandre Borba Chiqueta"	"1999-05-14"	"FACOM"	80.58	"100        "
"198        "	"Flávio Fernandes"	"1998-08-02"	"FACOM"	83.01	"100        "
"197        "	"Gabrel Toledo"	"1983-07-02"	"FACOM"	85	"102        "
"196        "	"Nicolas Paolinelli"	"1995-03-26"	"FACOM"	79.64	"100        "
"195        "	"Matheus Brasileiro Aguiar"	"1990-09-17"	"FACOM"	77.98	"104        "
"1300       "	"João Augusto Silva"	"2000-09-09"	"FAMEV"	80	
"1301       "	"Pedro Nunes"	"2001-12-09"	"FAMEV"	90	"1300       "
"1302       "	"Augusto Pereira"	"1999-01-28"	"FAMEV"	73	
"1303       "	"Maria Ferreira"	"2000-02-02"	"FAMEV"	95	"1304       "
"1304       "	"Ana Paula Freitas"	"2002-10-18"	"FAMEV"	89	
"605        "	"Elaine Ribeiro de Faria Paiva"	"1998-01-26"	"FADIR"	89	"603        "
"606        "	"Fernando Souza"	"1999-03-12"	"FADIR"	67.25	"603        "
"607        "	"Rafael Silva"	"2002-12-01"	"FADIR"	78.55	"604        "
"608        "	"João Marcos Ramos"	"2001-05-12"	"FADIR"	87.9	"604        "
"609        "	"Marcos Estefam"	"2000-07-15"	"FADIR"	75.15	"604        "
"305        "	"Neil Gaiman"	"2000-11-10"	"INFIS"	90.5	"300        "
"306        "	"Robert Louis Stevenson"	"1999-11-13"	"INFIS"	85	"301        "
"307        "	"Anne Rice"	"2000-10-04"	"INFIS"	78.2	"302        "
"308        "	"Bram Stocker"	"2000-11-08"	"INFIS"	88	"302        "
"309        "	"Marry Shelley"	"1999-08-30"	"INFIS"	91.7	"303        "
"2010       "	"Peter Benjamin Parker"	"1993-08-27"	"ICBIM"	100	"2008       "
"2011       "	"Peter Kavinsky"	"2003-08-03"	"ICBIM"	70	"2009       "
"2012       "	"Lara Jean"	"2002-04-06"	"ICBIM"	99	"2005       "
"2013       "	"Percy Jackson"	"1993-08-18"	"ICBIM"	75	"2007       "
"2014       "	"Veronica Lodge"	"1994-06-29"	"ICBIM"	60	"2006       "
"1807       "	"Annelise Salem"	"2002-08-06"	"ICIAG"	20	"1812       "
"1808       "	"Victor Bagliano"	"2000-07-14"	"ICIAG"	90.2	
"1809       "	"Leandro Peres"	"2001-09-12"	"ICIAG"	60	
"1810       "	"Marina Barcelos"	"2002-10-14"	"ICIAG"	70	
"1811       "	"Gabriel Hugo Borges"	"1999-12-14"	"ICIAG"	40.5	"1813       "
"950        "	"Gustavo Duarte Gomides"	"2002-12-12"	"ESTES"	85.5	"904        "
"951        "	"Rodrigo Alves da Silva"	"1990-05-20"	"ESTES"	75.2	"900        "
"952        "	"Julia Echeverria"	"1999-09-05"	"ESTES"	90.8	"902        "
"953        "	"Guilherme Duarte"	"1998-10-15"	"ESTES"	800	"904        "
"954        "	"Rodrigo da Silva"	"2000-01-01"	"ESTES"	60.2	"900        "
"12021GEO001"	"Rafael Henrique Guimarães"	"2003-03-14"	"FACIP"	88.4	"501        "
"12021GEO002"	"Felipe Langer"	"2000-04-01"	"FACIP"	86.7	"501        "
"12021GEO003"	"Lucas Daniel Cunha"	"2002-12-28"	"FACIP"	84.2	"502        "
"12021GEO004"	"Laura Rezende Teixeira Santos"	"2003-08-13"	"FACIP"	91.3	"503        "
"12021GEO005"	"Mariana Serrano Guimaraes"	"1998-01-06"	"FACIP"	92.1	"504        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	56.9	"4444       "
*/
DELETE FROM professor WHERE nome = 'André Backes';
/*
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	68.1	"102        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	81.4	"104        "
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FACOM"	47.5	"105        "
"1710       "	"Jonas Caravalho"	"1990-09-12"	"INBIO"	70	"1700       "
"1711       "	"Luna da Conceição"	"1987-07-19"	"INBIO"	60.2	
"1712       "	"Ana Silveira"	"2003-07-22"	"INBIO"	80.9	"1703       "
"1713       "	"Guilherme da Cunha"	"2000-12-02"	"INBIO"	66.6	"1701       "
"1714       "	"Davi Lucca Duarte"	"1974-09-25"	"INBIO"	55.3	"1700       "
"221BSI251ST"	"Henrique Corrêa de Oliveira"	"2000-01-26"	"FACOM"	75.7	"10000000010"
"222BCC201ST"	"Gabriel de Araujo"	"2000-04-09"	"FACOM"	72.3	"10000000011"
"189BSI255ST"	"Luisa Gomes Ferreira"	"2000-02-07"	"FACOM"	78.3	"10000000001"
"221BSI255ST"	"Gabriela Pereira"	"2000-07-07"	"FACOM"	71.3	"10000000000"
"189BSI232ST"	"Gabriel Alves"	"2000-09-19"	"FACOM"	68.3	"10000000100"
"205        "	"Joao Vitor Correia"	"2000-03-05"	"FAMAT"	70	"204        "
"206        "	"Marina Silva Gomes"	"2002-08-17"	"FAMAT"	85	"203        "
"207        "	"Maria Julia Oliveira"	"1999-11-02"	"FAMAT"	90	"202        "
"208        "	"Vicente Araujo Mendes"	"1995-04-14"	"FAMAT"	80	"200        "
"209        "	"Alexandre Oliveira Rodrigues"	"2001-05-20"	"FAMAT"	65	"201        "
"1500       "	"Vinicius Ribeiro"	"1993-01-06"	"FOUFU"	100	"1500       "
"1501       "	"César Bertolin"	"1993-01-06"	"FOUFU"	50	"1501       "
"1502       "	"Bruno José"	"1900-01-06"	"FOUFU"	100	"1502       "
"1503       "	"Elaine Maria"	"1989-01-06"	"FOUFU"	60	"1503       "
"1504       "	"Carlos Silva"	"1993-01-06"	"FOUFU"	70	"1504       "
"12021BAV001"	"Isabella Melo Sousa"	"2000-03-11"	"IARTE"	8	"1600       "
"12021BAV016"	"Jose Almeida Azevedo"	"2002-05-21"	"IARTE"	7	"1605       "
"12021BAV029"	"Aline Oliveira Araujo"	"2001-08-15"	"IARTE"	8	"1600       "
"12021BAV040"	"Andre Silva Martins"	"2000-09-03"	"IARTE"	7	"1610       "
"12021BAV020"	"Lavinia Sousa Carvalho"	"2002-10-18"	"IARTE"	8	"1600       "
"420        "	"Victor Guilherme Oliveira Santos"	"1998-11-20"	"ESTES"	96.3	"400        "
"421        "	"Sara Pelegrineti de José"	"1974-01-01"	"ESTES"	99.7	"401        "
"422        "	"Davi Rui Pasquim"	"2002-04-17"	"ESTES"	76.8	"402        "
"423        "	"Diego Ruas"	"1995-12-20"	"ESTES"	85.9	"403        "
"424        "	"Pedro Tiene Silva"	"2003-05-22"	"ESTES"	63.8	"404        "
"444        "	"Jason Manmoa"	"1962-03-06"	"FAEDU"	67.5	"420        "
"445        "	"Scott Pilgrim"	"1964-04-04"	"FAEDU"	88.3	"421        "
"446        "	"Naruto Uzumaki"	"1967-12-11"	"FAEDU"	59	"421        "
"447        "	"Frederico Krueger"	"1968-03-20"	"FAEDU"	78.5	"423        "
"448        "	"Jason Thirtenn"	"1968-03-20"	"FAEDU"	98.5	"423        "
"1405       "	"Aline Ferreira Magalhaes"	"2000-06-04"	"IFILO"	70	"1400       "
"1406       "	"Cristiano Bueno de Almeida"	"2002-07-13"	"IFILO"	88.9	"1400       "
"1407       "	"Derli Luis Arantes Junior"	"2001-12-20"	"IFILO"	77	"1403       "
"1408       "	"Gladston Marcelo Pereira do Vale"	"2000-05-11"	"IFILO"	80.2	"1403       "
"1409       "	"Kamila Stephany Alves Santos"	"2005-07-30"	"IFILO"	66	"1402       "
"199        "	"Alexandre Borba Chiqueta"	"1999-05-14"	"FACOM"	80.58	"100        "
"198        "	"Flávio Fernandes"	"1998-08-02"	"FACOM"	83.01	"100        "
"197        "	"Gabrel Toledo"	"1983-07-02"	"FACOM"	85	"102        "
"196        "	"Nicolas Paolinelli"	"1995-03-26"	"FACOM"	79.64	"100        "
"195        "	"Matheus Brasileiro Aguiar"	"1990-09-17"	"FACOM"	77.98	"104        "
"1300       "	"João Augusto Silva"	"2000-09-09"	"FAMEV"	80	
"1301       "	"Pedro Nunes"	"2001-12-09"	"FAMEV"	90	"1300       "
"1302       "	"Augusto Pereira"	"1999-01-28"	"FAMEV"	73	
"1303       "	"Maria Ferreira"	"2000-02-02"	"FAMEV"	95	"1304       "
"1304       "	"Ana Paula Freitas"	"2002-10-18"	"FAMEV"	89	
"605        "	"Elaine Ribeiro de Faria Paiva"	"1998-01-26"	"FADIR"	89	"603        "
"606        "	"Fernando Souza"	"1999-03-12"	"FADIR"	67.25	"603        "
"607        "	"Rafael Silva"	"2002-12-01"	"FADIR"	78.55	"604        "
"608        "	"João Marcos Ramos"	"2001-05-12"	"FADIR"	87.9	"604        "
"609        "	"Marcos Estefam"	"2000-07-15"	"FADIR"	75.15	"604        "
"305        "	"Neil Gaiman"	"2000-11-10"	"INFIS"	90.5	"300        "
"306        "	"Robert Louis Stevenson"	"1999-11-13"	"INFIS"	85	"301        "
"307        "	"Anne Rice"	"2000-10-04"	"INFIS"	78.2	"302        "
"308        "	"Bram Stocker"	"2000-11-08"	"INFIS"	88	"302        "
"309        "	"Marry Shelley"	"1999-08-30"	"INFIS"	91.7	"303        "
"2010       "	"Peter Benjamin Parker"	"1993-08-27"	"ICBIM"	100	"2008       "
"2011       "	"Peter Kavinsky"	"2003-08-03"	"ICBIM"	70	"2009       "
"2012       "	"Lara Jean"	"2002-04-06"	"ICBIM"	99	"2005       "
"2013       "	"Percy Jackson"	"1993-08-18"	"ICBIM"	75	"2007       "
"2014       "	"Veronica Lodge"	"1994-06-29"	"ICBIM"	60	"2006       "
"1807       "	"Annelise Salem"	"2002-08-06"	"ICIAG"	20	"1812       "
"1808       "	"Victor Bagliano"	"2000-07-14"	"ICIAG"	90.2	
"1809       "	"Leandro Peres"	"2001-09-12"	"ICIAG"	60	
"1810       "	"Marina Barcelos"	"2002-10-14"	"ICIAG"	70	
"1811       "	"Gabriel Hugo Borges"	"1999-12-14"	"ICIAG"	40.5	"1813       "
"950        "	"Gustavo Duarte Gomides"	"2002-12-12"	"ESTES"	85.5	"904        "
"951        "	"Rodrigo Alves da Silva"	"1990-05-20"	"ESTES"	75.2	"900        "
"952        "	"Julia Echeverria"	"1999-09-05"	"ESTES"	90.8	"902        "
"953        "	"Guilherme Duarte"	"1998-10-15"	"ESTES"	800	"904        "
"954        "	"Rodrigo da Silva"	"2000-01-01"	"ESTES"	60.2	"900        "
"12021GEO001"	"Rafael Henrique Guimarães"	"2003-03-14"	"FACIP"	88.4	"501        "
"12021GEO002"	"Felipe Langer"	"2000-04-01"	"FACIP"	86.7	"501        "
"12021GEO003"	"Lucas Daniel Cunha"	"2002-12-28"	"FACIP"	84.2	"502        "
"12021GEO004"	"Laura Rezende Teixeira Santos"	"2003-08-13"	"FACIP"	91.3	"503        "
"12021GEO005"	"Mariana Serrano Guimaraes"	"1998-01-06"	"FACIP"	92.1	"504        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	56.9	
*/


--Inserindo Valores
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GEDU43', 'Comportamento Motor ', 'FAEDU', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GBC045', 'Programação Procedimental', 'FACOM', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GBC023', 'Algoritmo e Estrutura de Dados 1', 'FACOM', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GBC024', 'Algoritmo e Estrutura de Dados 2', 'FACOM', 70);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GBC034', 'Programação Orientada a Objetos', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GBC012', 'Lógica', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('BCC002', 'Lógica para Programação', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('BCC003', 'Cálculo 1', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('BCC005', 'Arquitetura e Organização de Computadores', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GMV003', 'Bioquímica 1', 'FAMEV', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GMV007', 'Bioquímica 2', 'FAMEV', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GMV005', 'Fundamentos de Anatomia Veterinária', 'FAMEV', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GMV006', 'Anatomia dos Animais Domésticos', 'FAMEV', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GMV001', 'Citologia, Histologia e Embriologia', 'FAMEV', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1410  ', 'Filosofia Geral: Problemas Metafísicos', 'IFILO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1411  ', 'História da Filosofia Medieval', 'IFILO', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1412  ', 'Ética', 'IFILO', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1413  ', 'Psicologia da Educação', 'IFILO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1414  ', 'Didática Geral', 'IFILO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1415  ', 'Etica II', 'IFILO', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1416  ', 'Didática Geral II', 'IFILO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GAV001', 'Historia da Arte I', 'IARTE', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GAV007', 'Historia da Arte II', 'IARTE', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GAV013', 'Arte Contemporanea I', 'IARTE', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GAV019', 'Arte Contemporanea II', 'IARTE', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GAV010', 'Arte Computacional', 'IARTE', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('31505 ', 'Avaliação de Impactos Ambiental para Biólogos', 'INBIO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('39030 ', 'Biologia e Cultura - (PROINTER III)', 'INBIO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('31104 ', 'Construção do Conhecimento Científico', 'INBIO', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('31602 ', 'Evolução', 'INBIO', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('31407 ', 'Profissão Biólogo', 'INBIO', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('FADIR3', 'Teoria do Direito', 'FADIR', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('FADIR4', 'Direito Digital', 'FADIR', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('FADIR5', 'Direito do Trabalho 1', 'FADIR', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('FADIR6', 'Direito do Trabalho 2', 'FADIR', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('FADIR7', 'Direito Financeiro', 'FADIR', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('310   ', 'Física Básica I', 'INFIS', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('311   ', 'Física Básica II', 'INFIS', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('312   ', 'Física Básica III', 'INFIS', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('313   ', 'Geometrica Analítica', 'INFIS', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('314   ', 'Algoritmos e Programação de Computadores', 'INFIS', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('2000  ', 'Analises Clinicas', 'ICBIM', 40);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('2001  ', 'Imunologia', 'ICBIM', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('2002  ', 'Genetica', 'ICBIM', 20);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('2003  ', 'Microbiologia', 'ICBIM', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('2004  ', 'Biossegurança', 'ICBIM', 40);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1801  ', 'Construções Rurais', 'ICIAG', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1802  ', 'Adubos e Adubação', 'ICIAG', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1803  ', 'Manejo e Conservação do Solo e da Água', 'ICIAG', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1804  ', 'Irrigação e Drenagem', 'ICIAG', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('1805  ', 'Agrometeorologia', 'ICIAG', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('ESTES1', 'Fundamentos em Enfermagem', 'ESTES', 75);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('ESTES2', 'Saúde Coletiva I', 'ESTES', 45);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('ESTES3', 'Saúde Coletiva II', 'ESTES', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('ESTES4', 'Enfermagem Médica', 'ESTES', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('ESTES5', 'Psicologia e Ética', 'ESTES', 45);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO001', 'Geologia 1', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO002', 'Climatologia 1', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO003', 'Teoria e método em Geografia', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO004', 'Cartografia', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO005', 'PIPE 1', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO011', 'Geologia 2', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GGO012', 'Climatologia 2', 'FACIP', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('MAT201', 'Fundamentos de Matemática Elementar I', 'FAMAT', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('MAT211', 'Fundamentos de Matemática Elementar II', 'FAMAT', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('MAT212', 'Cálculo Diferencial e Integral I', 'FAMAT', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('MAT213', 'Cálculo Diferencial e Integral II', 'FAMAT', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('MAT214', 'Geometria Analitica', 'FAMAT', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GBC043', 'Sistemas de Banco de Dados', 'FACOM', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GSI023', 'Redes de computadores', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GSI034', 'Projeto e desenvolvimento 1', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GSI030', 'Engenharia de Software', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GSI027', 'Otimização', 'FACOM', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GOG001', 'Unidade de Constituição do Organismo', 'FOUFU', 210);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GOG002', 'Unidade de Funcionamento do Organismo I', 'FOUFU', 120);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GOG003', 'Un. de Reabilitação Integral do Ap. Estomatognático I', 'FOUFU', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GOG004', 'Unidade de Investigação Científica I (UIC1)', 'FOUFU', 45);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GOG005', 'Unidade de Saúde Humana I (USH1)', 'FOUFU', 30);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('410   ', 'Metodologia do Ensino de Ciência', 'ESTES', 120);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('411   ', 'Estágio Supervisionado I', 'ESTES', 150);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('412   ', 'Construção do Discurso Escrito', 'ESTES', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('413   ', 'Metodologia do Ensino da Língua Portuguesa', 'ESTES', 120);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('414   ', 'Filosofia da Educação', 'ESTES', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GEDU31', 'Fisiologia do Exercício', 'FAEDU', 90);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GEDU32', 'Teoria e Prática do Treinamento I', 'FAEDU', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GEDU41', 'Ritmo e Expressão', 'FAEDU', 60);
INSERT INTO universidade.disciplina (codigo, nome, fac_disc, ch) VALUES ('GEDU42', 'Teoria e Prática do Treinamento II', 'FAEDU', 60);


--
-- TOC entry 3081 (class 0 OID 41736)
-- Dependencies: 211
-- Data for Name: ensina; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('100        ', 155);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('101        ', 151);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('102        ', 154);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('103        ', 152);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('104        ', 153);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('601        ', 650);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('601        ', 651);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('602        ', 650);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('602        ', 652);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('603        ', 653);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('603        ', 652);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('603        ', 654);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('604        ', 652);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('604        ', 653);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('604        ', 654);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('620        ', 651);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('620        ', 652);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('620        ', 654);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('300        ', 315);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('300        ', 317);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('301        ', 316);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('302        ', 318);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('303        ', 319);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('304        ', 320);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('2005       ', 2015);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('2006       ', 2016);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('2007       ', 2017);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('2008       ', 2018);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('2009       ', 2019);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1812       ', 1817);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1812       ', 1818);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1813       ', 1819);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1814       ', 1820);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1815       ', 1821);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1816       ', 1822);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('900        ', 920);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('901        ', 921);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('902        ', 922);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('902        ', 923);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('903        ', 924);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('904        ', 925);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('500        ', 511);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('501        ', 512);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('502        ', 513);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('503        ', 514);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('504        ', 515);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1300       ', 1300);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1301       ', 1300);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1302       ', 1301);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1303       ', 1302);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1304       ', 1300);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1700       ', 1720);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1701       ', 1722);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1701       ', 1723);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1704       ', 1725);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1702       ', 1721);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1400       ', 1417);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1401       ', 1419);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1402       ', 1417);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1403       ', 1418);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1404       ', 1419);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1600       ', 10);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1605       ', 20);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1610       ', 30);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1605       ', 40);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1620       ', 50);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('200        ', 218);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('201        ', 219);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('202        ', 220);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('203        ', 221);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('204        ', 222);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('204        ', 223);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('10000000000', 2);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('10000000001', 3);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('10000000010', 4);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('10000000011', 5);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('10000000100', 3);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1500       ', 1500);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('1501       ', 1501);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('400        ', 430);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('401        ', 431);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('402        ', 432);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('403        ', 433);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('404        ', 434);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('420        ', 400);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('421        ', 401);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('422        ', 402);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('423        ', 403);
INSERT INTO universidade.ensina (id_prof, id_turma) VALUES ('424        ', 405);


--
-- TOC entry 3076 (class 0 OID 41674)
-- Dependencies: 206
-- Data for Name: estudante; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('106        ', 'Pedro Henrique Silva', '2001-05-02', 'FACOM', 75.3, '101        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('107        ', 'Gabriel Borges Júnior', '2002-01-09', 'FACOM', 68.1, '102        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('108        ', 'Amanda Gomes de Oliveira', '2000-03-07', 'FACOM', 56.9, '103        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('109        ', 'Jorge Antônio Santos', '1999-08-03', 'FACOM', 81.4, '104        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('110        ', 'Bruna Tobias Pinto', '2001-07-04', 'FACOM', 47.5, '105        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1710       ', 'Jonas Caravalho', '1990-09-12', 'INBIO', 70, '1700       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1711       ', 'Luna da Conceição', '1987-07-19', 'INBIO', 60.2, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1712       ', 'Ana Silveira', '2003-07-22', 'INBIO', 80.9, '1703       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1713       ', 'Guilherme da Cunha', '2000-12-02', 'INBIO', 66.6, '1701       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1714       ', 'Davi Lucca Duarte', '1974-09-25', 'INBIO', 55.3, '1700       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('221BSI251ST', 'Henrique Corrêa de Oliveira', '2000-01-26', 'FACOM', 75.7, '10000000010');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('222BCC201ST', 'Gabriel de Araujo', '2000-04-09', 'FACOM', 72.3, '10000000011');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('189BSI255ST', 'Luisa Gomes Ferreira', '2000-02-07', 'FACOM', 78.3, '10000000001');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('221BSI255ST', 'Gabriela Pereira', '2000-07-07', 'FACOM', 71.3, '10000000000');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('189BSI232ST', 'Gabriel Alves', '2000-09-19', 'FACOM', 68.3, '10000000100');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('205        ', 'Joao Vitor Correia', '2000-03-05', 'FAMAT', 70, '204        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('206        ', 'Marina Silva Gomes', '2002-08-17', 'FAMAT', 85, '203        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('207        ', 'Maria Julia Oliveira', '1999-11-02', 'FAMAT', 90, '202        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('208        ', 'Vicente Araujo Mendes', '1995-04-14', 'FAMAT', 80, '200        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('209        ', 'Alexandre Oliveira Rodrigues', '2001-05-20', 'FAMAT', 65, '201        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1500       ', 'Vinicius Ribeiro', '1993-01-06', 'FOUFU', 100, '1500       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1501       ', 'César Bertolin', '1993-01-06', 'FOUFU', 50, '1501       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1502       ', 'Bruno José', '1900-01-06', 'FOUFU', 100, '1502       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1503       ', 'Elaine Maria', '1989-01-06', 'FOUFU', 60, '1503       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1504       ', 'Carlos Silva', '1993-01-06', 'FOUFU', 70, '1504       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021BAV001', 'Isabella Melo Sousa', '2000-03-11', 'IARTE', 8, '1600       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021BAV016', 'Jose Almeida Azevedo', '2002-05-21', 'IARTE', 7, '1605       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021BAV029', 'Aline Oliveira Araujo', '2001-08-15', 'IARTE', 8, '1600       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021BAV040', 'Andre Silva Martins', '2000-09-03', 'IARTE', 7, '1610       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021BAV020', 'Lavinia Sousa Carvalho', '2002-10-18', 'IARTE', 8, '1600       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('420        ', 'Victor Guilherme Oliveira Santos', '1998-11-20', 'ESTES', 96.3, '400        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('421        ', 'Sara Pelegrineti de José', '1974-01-01', 'ESTES', 99.7, '401        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('422        ', 'Davi Rui Pasquim', '2002-04-17', 'ESTES', 76.8, '402        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('423        ', 'Diego Ruas', '1995-12-20', 'ESTES', 85.9, '403        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('424        ', 'Pedro Tiene Silva', '2003-05-22', 'ESTES', 63.8, '404        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('444        ', 'Jason Manmoa', '1962-03-06', 'FAEDU', 67.5, '420        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('445        ', 'Scott Pilgrim', '1964-04-04', 'FAEDU', 88.3, '421        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('446        ', 'Naruto Uzumaki', '1967-12-11', 'FAEDU', 59, '421        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('447        ', 'Frederico Krueger', '1968-03-20', 'FAEDU', 78.5, '423        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('448        ', 'Jason Thirtenn', '1968-03-20', 'FAEDU', 98.5, '423        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1405       ', 'Aline Ferreira Magalhaes', '2000-06-04', 'IFILO', 70, '1400       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1406       ', 'Cristiano Bueno de Almeida', '2002-07-13', 'IFILO', 88.9, '1400       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1407       ', 'Derli Luis Arantes Junior', '2001-12-20', 'IFILO', 77, '1403       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1408       ', 'Gladston Marcelo Pereira do Vale', '2000-05-11', 'IFILO', 80.2, '1403       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1409       ', 'Kamila Stephany Alves Santos', '2005-07-30', 'IFILO', 66, '1402       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('199        ', 'Alexandre Borba Chiqueta', '1999-05-14', 'FACOM', 80.58, '100        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('198        ', 'Flávio Fernandes', '1998-08-02', 'FACOM', 83.01, '100        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('197        ', 'Gabrel Toledo', '1983-07-02', 'FACOM', 85, '102        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('196        ', 'Nicolas Paolinelli', '1995-03-26', 'FACOM', 79.64, '100        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('195        ', 'Matheus Brasileiro Aguiar', '1990-09-17', 'FACOM', 77.98, '104        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1300       ', 'João Augusto Silva', '2000-09-09', 'FAMEV', 80, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1301       ', 'Pedro Nunes', '2001-12-09', 'FAMEV', 90, '1300       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1302       ', 'Augusto Pereira', '1999-01-28', 'FAMEV', 73, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1303       ', 'Maria Ferreira', '2000-02-02', 'FAMEV', 95, '1304       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1304       ', 'Ana Paula Freitas', '2002-10-18', 'FAMEV', 89, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('605        ', 'Elaine Ribeiro de Faria Paiva', '1998-01-26', 'FADIR', 89, '603        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('606        ', 'Fernando Souza', '1999-03-12', 'FADIR', 67.25, '603        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('607        ', 'Rafael Silva', '2002-12-01', 'FADIR', 78.55, '604        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('608        ', 'João Marcos Ramos', '2001-05-12', 'FADIR', 87.9, '604        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('609        ', 'Marcos Estefam', '2000-07-15', 'FADIR', 75.15, '604        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('305        ', 'Neil Gaiman', '2000-11-10', 'INFIS', 90.5, '300        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('306        ', 'Robert Louis Stevenson', '1999-11-13', 'INFIS', 85, '301        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('307        ', 'Anne Rice', '2000-10-04', 'INFIS', 78.2, '302        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('308        ', 'Bram Stocker', '2000-11-08', 'INFIS', 88, '302        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('309        ', 'Marry Shelley', '1999-08-30', 'INFIS', 91.7, '303        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('2010       ', 'Peter Benjamin Parker', '1993-08-27', 'ICBIM', 100, '2008       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('2011       ', 'Peter Kavinsky', '2003-08-03', 'ICBIM', 70, '2009       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('2012       ', 'Lara Jean', '2002-04-06', 'ICBIM', 99, '2005       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('2013       ', 'Percy Jackson', '1993-08-18', 'ICBIM', 75, '2007       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('2014       ', 'Veronica Lodge', '1994-06-29', 'ICBIM', 60, '2006       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1807       ', 'Annelise Salem', '2002-08-06', 'ICIAG', 20, '1812       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1808       ', 'Victor Bagliano', '2000-07-14', 'ICIAG', 90.2, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1809       ', 'Leandro Peres', '2001-09-12', 'ICIAG', 60, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1810       ', 'Marina Barcelos', '2002-10-14', 'ICIAG', 70, NULL);
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('1811       ', 'Gabriel Hugo Borges', '1999-12-14', 'ICIAG', 40.5, '1813       ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('950        ', 'Gustavo Duarte Gomides', '2002-12-12', 'ESTES', 85.5, '904        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('951        ', 'Rodrigo Alves da Silva', '1990-05-20', 'ESTES', 75.2, '900        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('952        ', 'Julia Echeverria', '1999-09-05', 'ESTES', 90.8, '902        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('953        ', 'Guilherme Duarte', '1998-10-15', 'ESTES', 800, '904        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('954        ', 'Rodrigo da Silva', '2000-01-01', 'ESTES', 60.2, '900        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021GEO001', 'Rafael Henrique Guimarães', '2003-03-14', 'FACIP', 88.4, '501        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021GEO002', 'Felipe Langer', '2000-04-01', 'FACIP', 86.7, '501        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021GEO003', 'Lucas Daniel Cunha', '2002-12-28', 'FACIP', 84.2, '502        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021GEO004', 'Laura Rezende Teixeira Santos', '2003-08-13', 'FACIP', 91.3, '503        ');
INSERT INTO universidade.estudante (id, nome, datanasc, fac_est, cra, tutor) VALUES ('12021GEO005', 'Mariana Serrano Guimaraes', '1998-01-06', 'FACIP', 92.1, '504        ');


--
-- TOC entry 3074 (class 0 OID 41659)
-- Dependencies: 204
-- Data for Name: faculdade; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FACOM', 'Faculdade da Computação', '1B   ', 10000.50);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FADIR', 'Faculdade de Direito', '3D   ', 200000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('INFIS', 'Instituto de Física', '1X   ', 37500000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('ICBIM', 'Instituto de Ciências Biomédicas', '2A   ', 200000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('ICIAG', 'Instituto de Ciências Agrárias', '2E   ', 500000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('ESTES', 'Escola Técnica de Saúde', '4K   ', 1244416.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FACIP', 'Faculdade de Ciencias Integradas de Pontal', '3K   ', 1000000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FAMEV', 'Faculdade de Medicina Veterinária', '1BCG ', 13000000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('INBIO', 'Instituto de Biologia', '2D28 ', 52413.09);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('IFILO', 'Instituto de Filosofia', '1U   ', 8000000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('IARTE', 'Instituto de Artes', '5S   ', 1500000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FAMAT', 'Faculdade de Matematica', '1F   ', 37500000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FECIV', 'Faculdade de Engenharia Civil', '1C   ', 6000.90);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FEELT', 'Faculdade de Engenharia Elétrica', '1E   ', 370000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FOUFU', 'Faculdade de Odontologia', 'UMU4L', 1200000.00);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FAEDU', 'Faculdade de Educação Física', '1A   ', 250500.50);
INSERT INTO universidade.faculdade (sigla, nome, predio, orcamento) VALUES ('FAMEC', 'Faculdade de Engenharia Mecânica', '1DCG ', 0.50);


--
-- TOC entry 3082 (class 0 OID 41751)
-- Dependencies: 212
-- Data for Name: frequenta; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1304       ', 1300, 95);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1710       ', 1720, 55.2);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1711       ', 1724, 60.1);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1711       ', 1720, 70.6);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1714       ', 1723, 40);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1712       ', 1722, 55.2);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1713       ', 1725, 10);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1405       ', 1417, 79);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1406       ', 1417, 70);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1407       ', 1418, 68);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1408       ', 1419, 45);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1409       ', 1419, 90);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021BAV001', 10, 60);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021BAV016', 20, 65);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021BAV029', 30, 70);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021BAV040', 40, 75);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021BAV020', 50, 80);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('205        ', 218, 80);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('206        ', 219, 85);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('207        ', 220, 74);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('208        ', 221, 80);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('209        ', 222, 69);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('221BSI251ST', 1, 75.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('222BCC201ST', 2, 67.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('189BSI255ST', 3, 70.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('221BSI255ST', 4, 80.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('189BSI232ST', 5, 60.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1501       ', 1501, 10);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1503       ', 1503, 8);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('420        ', 430, 78.5);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('421        ', 431, 10);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('422        ', 432, 86.7);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('423        ', 433, 96.4);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('424        ', 434, 96);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('444        ', 400, 70);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('445        ', 401, 10);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('446        ', 402, 68);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('447        ', 404, 84);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('448        ', 404, 92);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('199        ', 152, 87);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('198        ', 152, 93);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('197        ', 154, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('196        ', 155, 80);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('195        ', 151, 68);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('605        ', 650, 70.15);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('605        ', 651, 63.6);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('605        ', 652, 76.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('605        ', 653, 85.5);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('606        ', 651, 84.1);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('606        ', 650, 81.8);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('606        ', 652, 87.99);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('606        ', 653, 75.5);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('606        ', 654, 61.1);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('607        ', 652, 74.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('607        ', 651, 61.8);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('607        ', 653, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('607        ', 654, 87.4);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('607        ', 650, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('608        ', 653, 67.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('608        ', 650, 61.76);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('608        ', 651, 78.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('608        ', 652, 83.1);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('608        ', 654, 90.76);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('609        ', 654, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('609        ', 650, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('609        ', 651, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('609        ', 652, 70.92);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('609        ', 653, 67.54);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('305        ', 315, 9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('306        ', 316, 8);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('307        ', 317, 9.5);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('308        ', 318, 7);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('308        ', 320, 8.6);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('309        ', 319, 9.2);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('2013       ', 2015, 65);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('2010       ', 2015, 99);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('2014       ', 2019, 60);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('2012       ', 2016, 98);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('2011       ', 2017, 70);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1807       ', 1817, 10);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1808       ', 1817, 80);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1809       ', 1818, 15);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1810       ', 1819, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1811       ', 1820, NULL);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('950        ', 920, 92.2);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('950        ', 922, 80.9);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('951        ', 921, 75.5);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('952        ', 923, 61);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('953        ', 924, 55.2);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('954        ', 925, 10);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021GEO001', 511, 85);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021GEO002', 512, 58);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021GEO003', 513, 61);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021GEO004', 514, 86);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('12021GEO005', 515, 90);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1300       ', 1300, 80);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1301       ', 1300, 70);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1302       ', 1301, 90);
INSERT INTO universidade.frequenta (id_est, id_turma, nota) VALUES ('1303       ', 1302, 90);


--
-- TOC entry 3083 (class 0 OID 41766)
-- Dependencies: 213
-- Data for Name: horario; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('a', '07:10:00', '08:00:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('b', '08:00:00', '08:50:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('c', '08:50:00', '09:40:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('d', '09:50:00', '10:40:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('e', '10:40:00', '11:30:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('q', '11:30:00', '12:20:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('f', '13:10:00', '14:00:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('g', '14:00:00', '14:50:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('h', '14:50:00', '15:40:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('i', '16:00:00', '16:50:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('j', '16:50:00', '17:40:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('k', '17:40:00', '18:30:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('l', '18:10:00', '19:00:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('m', '19:00:00', '19:50:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('n', '19:50:00', '20:40:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('o', '20:50:00', '21:40:00');
INSERT INTO universidade.horario (id_hora, hora_inicio, hora_fim) VALUES ('p', '21:40:00', '22:30:00');


--
-- TOC entry 3085 (class 0 OID 41776)
-- Dependencies: 215
-- Data for Name: horario_aula; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'i', 155);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'j', 155);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'd', 154);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'f', 154);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'a', 153);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'b', 153);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'c', 152);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'e', 152);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'f', 151);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'g', 151);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 650);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'b', 651);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'b', 651);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'c', 651);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'd', 651);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'e', 652);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'f', 315);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'm', 316);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'a', 317);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'f', 318);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'a', 319);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'f', 320);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'f', 2019);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'b', 2017);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'k', 2016);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'g', 2018);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'd', 2015);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 1817);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'b', 1818);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'f', 1819);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'g', 1820);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'b', 1821);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'c', 1822);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 920);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'a', 921);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'c', 922);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'c', 923);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'a', 924);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'c', 925);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 511);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'c', 512);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'e', 513);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'g', 514);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'i', 515);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('1', 'a', 1300);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'd', 1302);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'd', 1305);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'q', 1303);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'l', 1301);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 1720);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'b', 1720);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'g', 1725);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'l', 1722);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'm', 1722);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 1417);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'b', 1418);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'c', 1419);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'a', 1420);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'b', 1421);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('1', 'c', 10);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 20);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'm', 30);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'p', 40);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'o', 50);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 218);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'e', 219);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'c', 220);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'p', 221);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'i', 222);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 1);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'b', 2);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'c', 3);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'd', 4);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'e', 5);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('1', 'a', 1500);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'b', 1501);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'k', 1502);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'k', 1503);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 430);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'g', 431);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 432);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'g', 433);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 434);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('2', 'a', 400);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('3', 'b', 401);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('4', 'c', 402);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('5', 'd', 403);
INSERT INTO universidade.horario_aula (id_sem, id_hora, id_turma) VALUES ('6', 'e', 404);


--
-- TOC entry 3078 (class 0 OID 41699)
-- Dependencies: 208
-- Data for Name: pre_requisito; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GBC023', 'GBC045');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GBC024', 'GBC023');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GMV007', 'GMV003');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GMV006', 'GMV005');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('1415  ', '1412  ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('1416  ', '1414  ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GAV007', 'GAV001');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GAV019', 'GAV013');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('FADIR4', 'FADIR3');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('FADIR6', 'FADIR5');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('311   ', '310   ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('312   ', '311   ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('2001  ', '2000  ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('2003  ', '2002  ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('1805  ', '1804  ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('1805  ', '1803  ');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('ESTES4', 'ESTES1');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('ESTES3', 'ESTES2');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GGO011', 'GGO001');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GGO012', 'GGO002');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('MAT211', 'MAT201');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('MAT213', 'MAT212');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GSI034', 'GBC043');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GOG005', 'GOG001');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GEDU42', 'GEDU32');
INSERT INTO universidade.pre_requisito (cod_disc, cod_pre) VALUES ('GEDU43', 'GEDU31');


--
-- TOC entry 3075 (class 0 OID 41664)
-- Dependencies: 205
-- Data for Name: professor; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('100        ', 'Gina Maira', 'FACOM', '2000-02-27');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('101        ', 'Marcelo Keese Albertini', 'FACOM', '2013-03-07');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('102        ', 'Rivalino Matias Júnior', 'FACOM', '2003-02-05');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('103        ', 'André Backes', 'FACOM', '20015-06-02');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('104        ', 'Bruno Augusto Nassif Travençolo', 'FACOM', '2018-01-09');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('105        ', 'Luiz Gustavo Almeida Martins', 'FACOM', '2008-05-04');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1700       ', 'Ailton Gonçalves Rodrigues Junior', 'INBIO', '2021-10-12');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1701       ', 'Ariádine Cristine de Almeida', 'INBIO', '2013-01-02');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1702       ', 'Giuliano Buzá Jacobucci', 'INBIO', '2005-08-05');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1703       ', 'Jeamylle Nilin Gonçalves', 'INBIO', '2019-02-28');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1704       ', 'Cassiano Aimberê Dorneles Welker', 'INBIO', '2016-06-07');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('200        ', 'Admilson Lopes dos Santos', 'FAMAT', '2013-12-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('201        ', 'Adriana Rodrigues da Silva', 'FAMAT', '2010-03-26');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('202        ', 'Camila Mariana Ruiz', 'FAMAT', '2022-05-30');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('203        ', 'Fernando Rodrigo Rafaeli', 'FAMAT', '2014-06-03');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('204        ', 'Taciana Oliveira Souza', 'FAMAT', '2013-11-12');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('10000000000', 'Jean Ponciano', 'FACOM', '2005-10-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('10000000001', 'Elaine Ribeiro', 'FACOM', '2005-09-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('10000000010', 'Alexsandro Soares', 'FACOM', '2005-08-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('10000000011', 'Pedro Frosi', 'FACOM', '2000-10-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('10000000100', 'Marcia Aparecida Fernandes', 'FACOM', '2005-01-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1500       ', 'Adriano Mota Loyola', 'FOUFU', '1988-12-01');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1501       ', 'Alessandra Maia de Castro Prado', 'FOUFU', '2010-03-26');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1502       ', 'Álex Moreira Herval', 'FOUFU', '2019-06-18');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1503       ', 'Ana Paula Turrioni Hidalgo', 'FOUFU', '2015-12-01');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1504       ', 'Ana Paula de Lima Oliveira', 'FOUFU', '2014-04-01');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1600       ', 'Belchior de Sousa', 'IARTE', '2019-10-25');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1605       ', 'Elsieni Coelho da Silva', 'IARTE', '2021-05-20');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1610       ', 'Gastao da Cunha Frota', 'IARTE', '2012-06-15');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1615       ', 'Nikoleta Tzvetanova Kerinska', 'IARTE', '2018-08-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1620       ', 'Renato Palumbo Doria', 'IARTE', '2020-11-05');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('400        ', 'Adriana Pastorello Buim Arena', 'ESTES', '2004-08-02');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('401        ', 'Aldeci Cacique Calixto', 'ESTES', '2000-05-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('402        ', 'Aléxia Pádua Franco', 'ESTES', '2008-10-11');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('403        ', 'Ana Beatriz da Silva Duarte', 'ESTES', '2014-12-06');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('404        ', 'Andrea Maturano Longarezi', 'ESTES', '1998-05-08');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('420        ', 'Jailson Mendes', 'FAEDU', '1982-02-02');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('421        ', 'Gabriel Jesus', 'FAEDU', '1982-03-04');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('422        ', 'Luciano Hulk', 'FAEDU', '1983-10-11');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('423        ', 'João Guilherme', 'FAEDU', '1990-11-11');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('424        ', 'Péricles Mendes', 'FAEDU', '1985-09-07');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1400       ', 'Alcino Eduardo Bonella', 'IFILO', '2009-12-30');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1401       ', 'Alexandre Guimarães Tadeu de Soares', 'IFILO', '2003-11-01');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1402       ', 'Ana Maria Said', 'IFILO', '2009-01-30');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1403       ', 'Anselmo Tadeu Ferreira', 'IFILO', '2010-06-09');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1404       ', 'Dennys Garcia Xavier', 'IFILO', '2011-11-05');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1300       ', 'Kelly Aparecida Geraldo Yoneyama Tudini', 'FAMEV', '2000-09-09');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1301       ', 'Lucas de Assis Ribeiro', 'FAMEV', '2005-07-26');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1302       ', 'Natália Mundim Tôrres', 'FAMEV', '2007-07-09');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1303       ', 'Tiago Wilson Patriarca Mineo ', 'FAMEV', '2004-10-07');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1304       ', 'Neide Maria da Silva ', 'FAMEV', '2000-12-09');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('601        ', 'Alexandre Garrido da Silva', 'FADIR', '2010-08-15');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('602        ', 'Beatriz Corrêa Camargo', 'FADIR', '2015-03-21');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('603        ', 'Daniela de Melo Crosara', 'FADIR', '2022-08-03');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('604        ', 'Fernando Rodrigues Martins', 'FADIR', '2002-01-26');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('620        ', 'Gustavo de Carvalho Marin', 'FADIR', '2006-08-11');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('300        ', 'Ademir Cavalheiro', 'INFIS', '2007-12-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('301        ', 'Adevailton Bernardo dos Santos', 'INFIS', '2003-11-07');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('302        ', 'Alessandra Riposati Arantes', 'INFIS', '2012-01-12');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('303        ', 'Djalmir Nestor Messias', 'INFIS', '2003-11-07');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('304        ', 'Marcel Novaes', 'INFIS', '2012-01-12');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('2005       ', 'Alberto da Silva Morais', 'ICBIM', '2008-11-11');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('2006       ', 'Carlos Hernrique Gomes', 'ICBIM', '2019-01-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('2007       ', 'Daniela Cristina de Oliveira', 'ICBIM', '2010-03-05');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('2008       ', 'Disney Oliver', 'ICBIM', '2019-01-01');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('2009       ', 'Henrique Tomaz Gonzaga', 'ICBIM', '2020-09-09');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1812       ', 'Jamil Salem', 'ICIAG', '1969-08-14');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1813       ', 'Julia Vingadora', 'ICIAG', '2004-06-06');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1814       ', 'Roberto Carlos', 'ICIAG', '1971-10-08');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1815       ', 'Cláudio Assembly', 'ICIAG', '1969-12-01');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('1816       ', 'Elaine Java', 'ICIAG', '2000-09-11');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('900        ', 'Lilian Rodrigues Sant’ Anna Campos', 'ESTES', '2019-07-24');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('901        ', 'Clelia Regina Cafer', 'ESTES', '2008-02-20');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('902        ', 'Marisa Aparecida Elias', 'ESTES', '2017-06-13');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('903        ', 'Barbara Dias Rezende Gontijo', 'ESTES', '2014-06-04');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('904        ', 'Tatiana Carneiro de Resende', 'ESTES', '2010-01-26');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('500        ', 'Alessandro Gomes Enoque', 'FACIP', '2010-05-10');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('501        ', 'Alex Fernando Borges', 'FACIP', '2012-02-22');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('502        ', 'Alexandre Alves Alvenha', 'FACIP', '2020-10-02');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('503        ', 'Alexandre Cacheffo', 'FACIP', '2000-11-15');
INSERT INTO universidade.professor (id, nome, fac_prof, admissao) VALUES ('504        ', 'Alexandre Calzavara Yoshida', 'FACIP', '2016-06-17');


--
-- TOC entry 3079 (class 0 OID 41714)
-- Dependencies: 209
-- Data for Name: sala; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1B   ', 204, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1B   ', 203, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('5R   ', 103, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('3D   ', 102, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('3D   ', 104, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('3D   ', 106, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1X   ', 1, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1X   ', 2, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1X   ', 3, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2A   ', 1, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2A   ', 2, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2A   ', 3, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2A   ', 4, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2A   ', 5, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2A   ', 6, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2E   ', 201, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2E   ', 202, 30);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2E   ', 203, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('4K   ', 205, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('4K   ', 206, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('4K   ', 207, 30);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('3K   ', 101, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('3K   ', 102, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('3K   ', 103, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1BCG ', 101, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1BCG ', 102, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1BCG ', 103, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('8C   ', 119, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('2D   ', 13, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('8C   ', 121, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('8C   ', 322, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('8C   ', 123, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1U   ', 204, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('5O-A ', 206, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('5O-A ', 207, 60);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('5S   ', 207, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('5S   ', 205, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('5S   ', 208, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1F   ', 215, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1F   ', 216, 75);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1F   ', 217, 45);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1BBSI', 127, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1BBSI', 128, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1BBSI', 129, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('UMU4L', 39, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('UMU3L', 38, 70);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('UMU1L', 37, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1G   ', 101, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1G   ', 102, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1G   ', 103, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1G   ', 104, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1G   ', 105, 50);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1A   ', 490, 55);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1A   ', 491, 40);
INSERT INTO universidade.sala (predio, numero, capacidade) VALUES ('1A   ', 492, 50);


--
-- TOC entry 3084 (class 0 OID 41771)
-- Dependencies: 214
-- Data for Name: semana; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.semana (id_sem, descricao) VALUES ('1', 'Domingo');
INSERT INTO universidade.semana (id_sem, descricao) VALUES ('2', 'Segunda');
INSERT INTO universidade.semana (id_sem, descricao) VALUES ('3', 'Terça');
INSERT INTO universidade.semana (id_sem, descricao) VALUES ('4', 'Quarta');
INSERT INTO universidade.semana (id_sem, descricao) VALUES ('5', 'Quinta');
INSERT INTO universidade.semana (id_sem, descricao) VALUES ('6', 'Sexta');
INSERT INTO universidade.semana (id_sem, descricao) VALUES ('7', 'Sábado');


--
-- TOC entry 3080 (class 0 OID 41719)
-- Dependencies: 210
-- Data for Name: turma; Type: TABLE DATA; Schema: universidade; Owner: postgres
--

INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1822, '06', 1, 2023, '1805  ', '2E   ', 203);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (920, '1A', 1, 2022, 'ESTES1', '4K   ', 205);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (921, '1B', 1, 2022, 'ESTES1', '4K   ', 205);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (922, '1A', 1, 2022, 'ESTES2', '4K   ', 206);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (923, '1A', 1, 2022, 'ESTES3', '4K   ', 207);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (924, '1A', 2, 2022, 'ESTES4', '4K   ', 206);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (925, '1A', 2, 2022, 'ESTES5', '4K   ', 207);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (511, '33', 1, 2022, 'GGO002', '3K   ', 101);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (512, '33', 2, 2022, 'GGO012', '3K   ', 101);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (513, '31', 1, 2021, 'GGO001', '3K   ', 102);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (514, '31', 2, 2021, 'GGO011', '3K   ', 102);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (515, '29', 2, 2020, 'GGO012', '3K   ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1300, 'A ', 1, 2022, 'GMV003', '1BCG ', 101);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1301, 'B ', 1, 2022, 'GMV007', '1BCG ', 102);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1302, 'C ', 1, 2022, 'GMV005', '1BCG ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1303, 'D ', 1, 2022, 'GMV006', '1BCG ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1304, 'E ', 1, 2022, 'GMV001', '1BCG ', 102);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1305, 'F ', 1, 2022, 'GMV005', '1BCG ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1720, 'C ', 1, 2022, '31505 ', '8C   ', 119);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1721, 'D ', 1, 2022, '31505 ', '8C   ', 119);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1722, 'C ', 1, 2022, '39030 ', '2D   ', 13);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1723, 'C ', 1, 2022, '31104 ', '8C   ', 121);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1724, 'C ', 1, 2022, '31602 ', '8C   ', 322);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1725, 'C ', 1, 2022, '31407 ', '8C   ', 123);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1417, 'A ', 1, 2022, '1410  ', '1U   ', 204);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1418, 'A ', 1, 2022, '1411  ', '5O-A ', 206);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1419, 'A ', 1, 2022, '1412  ', '5O-A ', 206);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1420, 'A ', 2, 2022, '1413  ', '5O-A ', 207);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1421, 'A ', 2, 2022, '1414  ', '1U   ', 204);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1422, 'B ', 2, 2022, '1414  ', '1U   ', 204);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (10, '55', 1, 2015, 'GAV001', '5S   ', 207);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (20, '57', 2, 2016, 'GAV007', '5S   ', 205);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (30, '59', 1, 2017, 'GAV013', '5S   ', 208);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (40, '61', 2, 2018, 'GAV019', '5S   ', 207);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (50, '63', 1, 2019, 'GAV010', '5S   ', 205);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (218, 'A ', 1, 2018, 'MAT201', '1F   ', 215);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (219, 'B ', 2, 2019, 'MAT211', '1F   ', 216);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (220, 'C ', 1, 2020, 'MAT212', '1F   ', 217);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (221, 'D ', 2, 2021, 'MAT213', '1F   ', 215);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (222, 'E ', 2, 2022, 'MAT214', '1F   ', 216);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (223, 'F ', 2, 2022, 'MAT214', '1F   ', 216);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1, '01', 1, 2022, 'GBC043', '1BBSI', 127);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2, '02', 2, 2022, 'GBC043', '1BBSI', 127);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (3, '03', 2, 2022, 'GSI023', '1BBSI', 128);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (4, '04', 2, 2022, 'GSI034', '1BBSI', 129);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (5, '05', 2, 2022, 'GSI027', '1BBSI', 128);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1500, '17', 1, 2022, 'GOG001', 'UMU4L', 39);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1501, '17', 1, 2021, 'GOG001', 'UMU4L', 39);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1502, '18', 2, 2021, 'GOG002', 'UMU3L', 38);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1503, '19', 2, 2022, 'GOG003', 'UMU4L', 39);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1504, '20', 1, 2023, 'GOG004', 'UMU1L', 37);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (430, '65', 2, 2020, '410   ', '1G   ', 101);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (431, '66', 1, 2020, '410   ', '1G   ', 101);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (432, '67', 2, 2020, '411   ', '1G   ', 102);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (433, '68', 1, 2021, '412   ', '1G   ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (434, '69', 2, 2021, '413   ', '1G   ', 104);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (400, '00', 2, 1982, 'GEDU31', '1A   ', 490);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (401, '01', 1, 1983, 'GEDU32', '1A   ', 490);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (402, '02', 2, 1983, 'GEDU41', '1A   ', 491);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (403, '03', 2, 1990, 'GEDU42', '1A   ', 491);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (404, '04', 2, 1995, 'GEDU43', '1A   ', 492);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (405, '05', 2, 1995, 'GEDU43', '1A   ', 492);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (155, '63', 2, 2020, 'GBC034', '1B   ', 204);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (154, '64', 1, 2021, 'GBC034', '1B   ', 203);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (153, '65', 2, 2021, 'GBC024', '5R   ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (152, '66', 1, 2022, 'GBC023', '5R   ', 103);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (151, '67', 2, 2022, 'GBC045', NULL, NULL);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (650, 'D1', 2, 2022, 'FADIR3', '3D   ', 102);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (651, 'D1', 2, 2020, 'FADIR4', '3D   ', 104);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (652, 'D2', 1, 2021, 'FADIR5', '3D   ', 104);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (653, 'D3', 2, 2022, 'FADIR6', NULL, NULL);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (654, 'D4', 1, 2022, 'FADIR6', NULL, NULL);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (315, 'A1', 2, 2020, '310   ', '1X   ', 2);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (316, 'A2', 2, 2020, '310   ', '1X   ', 2);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (317, 'B1', 1, 2020, '311   ', '1X   ', 3);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (318, 'C1', 1, 2021, '312   ', '1X   ', 1);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (319, 'D1', 1, 2021, '313   ', '1X   ', 1);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (320, 'E1', 2, 2021, '314   ', '1X   ', 1);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2015, 'A ', 1, 2022, '2000  ', '2A   ', 1);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2016, 'B ', 1, 2022, '2001  ', '2A   ', 2);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2017, 'C ', 1, 2022, '2002  ', '2A   ', 3);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2018, 'D ', 1, 2022, '2003  ', '2A   ', 4);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2019, 'E ', 1, 2022, '2004  ', '2A   ', 5);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (2020, 'F ', 1, 2022, '2004  ', '2A   ', 6);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1817, '01', 1, 2021, '1801  ', '2E   ', 201);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1818, '02', 2, 2021, '1801  ', '2E   ', 201);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1819, '03', 1, 2022, '1803  ', '2E   ', 201);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1820, '04', 2, 2022, '1804  ', '2E   ', 202);
INSERT INTO universidade.turma (id, turma, semestre, ano, cod_disc, predio_s, n_sala) VALUES (1821, '05', 1, 2023, '1802  ', '2E   ', 202);
