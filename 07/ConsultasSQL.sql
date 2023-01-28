/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;

--1)
SELECT 2+2;
--Resultado: 4

SELECT 'A';
--Resultado: A

SELECT 50>3
--Resultado: true

SELECT '11/10/20 '
--Resultado: 11/10/20

SELECT '11/10/2020' - '11/10/2030' 
--Resultado: Não é possível executar o comando. Operações de subtração não podem ser usadas com tipo de dado date.

--2)
SELECT 2+2 AS soma
--Resultado: Operação igual a 4 e nome da coluna = 'soma'

SELECT 'A' as letra
--Resultado: Operação igual a A e coluna = 'letra'

SELECT 50 > 3 as resultado
--Resultado: Operação igual a true e coluna = 'resultado'

SELECT '11/10/2020'
--Resultado: É retornado um tipo text

--3)
/*Mostra todos os estudantes*/
SELECT* FROM estudante;
/*
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	68.1	"102        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	56.9	"103        "
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
*/

/*Mostra todas as salas*/
SELECT* FROM sala;
/*
"1B   "	204	80
"1B   "	203	80
"5R   "	103	90
"3D   "	102	60
"3D   "	104	40
"3D   "	106	60
"1X   "	1	60
"1X   "	2	60
"1X   "	3	60
"2A   "	1	50
"2A   "	2	50
"2A   "	3	50
"2A   "	4	50
"2A   "	5	50
"2A   "	6	50
"2E   "	201	50
"2E   "	202	30
"2E   "	203	40
"4K   "	205	40
"4K   "	206	60
"4K   "	207	30
"3K   "	101	50
"3K   "	102	50
"3K   "	103	50
"1BCG "	101	50
"1BCG "	102	40
"1BCG "	103	90
"8C   "	119	60
"2D   "	13	50
"8C   "	121	60
"8C   "	322	40
"8C   "	123	60
"1U   "	204	60
"5O-A "	206	60
"5O-A "	207	60
"5S   "	207	40
"5S   "	205	40
"5S   "	208	40
"1F   "	215	70
"1F   "	216	75
"1F   "	217	45
"1BBSI"	127	90
"1BBSI"	128	90
"1BBSI"	129	90
"UMU4L"	39	100
"UMU3L"	38	80
"UMU1L"	37	50
"1G   "	101	50
"1G   "	102	50
"1G   "	103	50
"1G   "	104	50
"1G   "	105	50
"1A   "	490	55
"1A   "	491	40
"1A   "	492	50
*/


/*Mostra todas as disciplinas*/
SELECT* FROM disciplina;
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
"310   "	"Física Básica I"	"INFIS"	90
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
*/

--4)
--a)
SELECT nome,datanasc FROM estudante;
/*
"Pedro Henrique Silva"	"2001-05-02"
"Gabriel Borges Júnior"	"2002-01-09"
"Amanda Gomes de Oliveira"	"2000-03-07"
"Jorge Antônio Santos"	"1999-08-03"
"Bruna Tobias Pinto"	"2001-07-04"
"Jonas Caravalho"	"1990-09-12"
"Luna da Conceição"	"1987-07-19"
"Ana Silveira"	"2003-07-22"
"Guilherme da Cunha"	"2000-12-02"
"Davi Lucca Duarte"	"1974-09-25"
"Henrique Corrêa de Oliveira"	"2000-01-26"
"Gabriel de Araujo"	"2000-04-09"
"Luisa Gomes Ferreira"	"2000-02-07"
"Gabriela Pereira"	"2000-07-07"
"Gabriel Alves"	"2000-09-19"
"Joao Vitor Correia"	"2000-03-05"
"Marina Silva Gomes"	"2002-08-17"
"Maria Julia Oliveira"	"1999-11-02"
"Vicente Araujo Mendes"	"1995-04-14"
"Alexandre Oliveira Rodrigues"	"2001-05-20"
"Vinicius Ribeiro"	"1993-01-06"
"César Bertolin"	"1993-01-06"
"Bruno José"	"1900-01-06"
"Elaine Maria"	"1989-01-06"
"Carlos Silva"	"1993-01-06"
"Isabella Melo Sousa"	"2000-03-11"
"Jose Almeida Azevedo"	"2002-05-21"
"Aline Oliveira Araujo"	"2001-08-15"
"Andre Silva Martins"	"2000-09-03"
"Lavinia Sousa Carvalho"	"2002-10-18"
"Victor Guilherme Oliveira Santos"	"1998-11-20"
"Sara Pelegrineti de José"	"1974-01-01"
"Davi Rui Pasquim"	"2002-04-17"
"Diego Ruas"	"1995-12-20"
"Pedro Tiene Silva"	"2003-05-22"
"Jason Manmoa"	"1962-03-06"
"Scott Pilgrim"	"1964-04-04"
"Naruto Uzumaki"	"1967-12-11"
"Frederico Krueger"	"1968-03-20"
"Jason Thirtenn"	"1968-03-20"
"Aline Ferreira Magalhaes"	"2000-06-04"
"Cristiano Bueno de Almeida"	"2002-07-13"
"Derli Luis Arantes Junior"	"2001-12-20"
"Gladston Marcelo Pereira do Vale"	"2000-05-11"
"Kamila Stephany Alves Santos"	"2005-07-30"
"Alexandre Borba Chiqueta"	"1999-05-14"
"Flávio Fernandes"	"1998-08-02"
"Gabrel Toledo"	"1983-07-02"
"Nicolas Paolinelli"	"1995-03-26"
"Matheus Brasileiro Aguiar"	"1990-09-17"
"João Augusto Silva"	"2000-09-09"
"Pedro Nunes"	"2001-12-09"
"Augusto Pereira"	"1999-01-28"
"Maria Ferreira"	"2000-02-02"
"Ana Paula Freitas"	"2002-10-18"
"Elaine Ribeiro de Faria Paiva"	"1998-01-26"
"Fernando Souza"	"1999-03-12"
"Rafael Silva"	"2002-12-01"
"João Marcos Ramos"	"2001-05-12"
"Marcos Estefam"	"2000-07-15"
"Neil Gaiman"	"2000-11-10"
"Robert Louis Stevenson"	"1999-11-13"
"Anne Rice"	"2000-10-04"
"Bram Stocker"	"2000-11-08"
"Marry Shelley"	"1999-08-30"
"Peter Benjamin Parker"	"1993-08-27"
"Peter Kavinsky"	"2003-08-03"
"Lara Jean"	"2002-04-06"
"Percy Jackson"	"1993-08-18"
"Veronica Lodge"	"1994-06-29"
"Annelise Salem"	"2002-08-06"
"Victor Bagliano"	"2000-07-14"
"Leandro Peres"	"2001-09-12"
"Marina Barcelos"	"2002-10-14"
"Gabriel Hugo Borges"	"1999-12-14"
"Gustavo Duarte Gomides"	"2002-12-12"
"Rodrigo Alves da Silva"	"1990-05-20"
"Julia Echeverria"	"1999-09-05"
"Guilherme Duarte"	"1998-10-15"
"Rodrigo da Silva"	"2000-01-01"
"Rafael Henrique Guimarães"	"2003-03-14"
"Felipe Langer"	"2000-04-01"
"Lucas Daniel Cunha"	"2002-12-28"
"Laura Rezende Teixeira Santos"	"2003-08-13"
"Mariana Serrano Guimaraes"	"1998-01-06"
*/

--b)
SELECT nome FROM faculdade;
/*
"Faculdade da Computação"
"Faculdade de Direito"
"Instituto de Física"
"Instituto de Ciências Biomédicas"
"Instituto de Ciências Agrárias"
"Escola Técnica de Saúde"
"Faculdade de Ciencias Integradas de Pontal"
"Faculdade de Medicina Veterinária"
"Instituto de Biologia"
"Instituto de Filosofia"
"Instituto de Artes"
"Faculdade de Matematica"
"Faculdade de Engenharia Civil"
"Faculdade de Engenharia Elétrica"
"Faculdade de Odontologia"
"Faculdade de Educação Física"
"Faculdade de Engenharia Mecânica"
*/

--c)
SELECT hora_inicio FROM horario;
/*
"07:10:00"
"08:00:00"
"08:50:00"
"09:50:00"
"10:40:00"
"11:30:00"
"13:10:00"
"14:00:00"
"14:50:00"
"16:00:00"
"16:50:00"
"17:40:00"
"18:10:00"
"19:00:00"
"19:50:00"
"20:50:00"
"21:40:00"
*/

--5)
--a)
SELECT nome,ch AS carga FROM disciplina;
/*
"Comportamento Motor "	90
"Programação Procedimental"	90
"Algoritmo e Estrutura de Dados 1"	90
"Algoritmo e Estrutura de Dados 2"	70
"Programação Orientada a Objetos"	60
"Lógica"	60
"Lógica para Programação"	60
"Cálculo 1"	60
"Arquitetura e Organização de Computadores"	60
"Bioquímica 1"	75
"Bioquímica 2"	75
"Fundamentos de Anatomia Veterinária"	75
"Anatomia dos Animais Domésticos"	75
"Citologia, Histologia e Embriologia"	75
"Filosofia Geral: Problemas Metafísicos"	60
"História da Filosofia Medieval"	30
"Ética"	90
"Psicologia da Educação"	60
"Didática Geral"	60
"Etica II"	90
"Didática Geral II"	60
"Historia da Arte I"	60
"Historia da Arte II"	60
"Arte Contemporanea I"	60
"Arte Contemporanea II"	60
"Arte Computacional"	60
"Avaliação de Impactos Ambiental para Biólogos"	60
"Biologia e Cultura - (PROINTER III)"	60
"Construção do Conhecimento Científico"	30
"Evolução"	60
"Profissão Biólogo"	30
"Teoria do Direito"	60
"Direito Digital"	30
"Direito do Trabalho 1"	60
"Direito do Trabalho 2"	30
"Direito Financeiro"	30
"Física Básica I"	90
"Física Básica II"	90
"Física Básica III"	90
"Geometrica Analítica"	60
"Algoritmos e Programação de Computadores"	60
"Analises Clinicas"	40
"Imunologia"	30
"Genetica"	20
"Microbiologia"	30
"Biossegurança"	40
"Construções Rurais"	60
"Adubos e Adubação"	60
"Manejo e Conservação do Solo e da Água"	60
"Irrigação e Drenagem"	75
"Agrometeorologia"	60
"Fundamentos em Enfermagem"	75
"Saúde Coletiva I"	45
"Saúde Coletiva II"	30
"Enfermagem Médica"	60
"Psicologia e Ética"	45
"Geologia 1"	60
"Climatologia 1"	60
"Teoria e método em Geografia"	60
"Cartografia"	60
"PIPE 1"	60
"Geologia 2"	60
"Climatologia 2"	60
"Fundamentos de Matemática Elementar I"	90
"Fundamentos de Matemática Elementar II"	90
"Cálculo Diferencial e Integral I"	90
"Cálculo Diferencial e Integral II"	90
"Geometria Analitica"	90
"Sistemas de Banco de Dados"	90
"Redes de computadores"	60
"Projeto e desenvolvimento 1"	60
"Engenharia de Software"	60
"Otimização"	60
"Unidade de Constituição do Organismo"	210
"Unidade de Funcionamento do Organismo I"	120
"Un. de Reabilitação Integral do Ap. Estomatognático I"	60
"Unidade de Investigação Científica I (UIC1)"	45
"Unidade de Saúde Humana I (USH1)"	30
"Metodologia do Ensino de Ciência"	120
"Estágio Supervisionado I"	150
"Construção do Discurso Escrito"	60
"Metodologia do Ensino da Língua Portuguesa"	120
"Filosofia da Educação"	60
"Fisiologia do Exercício"	90
"Teoria e Prática do Treinamento I"	60
"Ritmo e Expressão"	60
"Teoria e Prática do Treinamento II"	60
*/

--b)
SELECT nome,ch/15 AS carga_horaria FROM disciplina;
/*"Comportamento Motor "	6
"Programação Procedimental"	6
"Algoritmo e Estrutura de Dados 1"	6
"Algoritmo e Estrutura de Dados 2"	4
"Programação Orientada a Objetos"	4
"Lógica"	4
"Lógica para Programação"	4
"Cálculo 1"	4
"Arquitetura e Organização de Computadores"	4
"Bioquímica 1"	5
"Bioquímica 2"	5
"Fundamentos de Anatomia Veterinária"	5
"Anatomia dos Animais Domésticos"	5
"Citologia, Histologia e Embriologia"	5
"Filosofia Geral: Problemas Metafísicos"	4
"História da Filosofia Medieval"	2
"Ética"	6
"Psicologia da Educação"	4
"Didática Geral"	4
"Etica II"	6
"Didática Geral II"	4
"Historia da Arte I"	4
"Historia da Arte II"	4
"Arte Contemporanea I"	4
"Arte Contemporanea II"	4
"Arte Computacional"	4
"Avaliação de Impactos Ambiental para Biólogos"	4
"Biologia e Cultura - (PROINTER III)"	4
"Construção do Conhecimento Científico"	2
"Evolução"	4
"Profissão Biólogo"	2
"Teoria do Direito"	4
"Direito Digital"	2
"Direito do Trabalho 1"	4
"Direito do Trabalho 2"	2
"Direito Financeiro"	2
"Física Básica I"	6
"Física Básica II"	6
"Física Básica III"	6
"Geometrica Analítica"	4
"Algoritmos e Programação de Computadores"	4
"Analises Clinicas"	2
"Imunologia"	2
"Genetica"	1
"Microbiologia"	2
"Biossegurança"	2
"Construções Rurais"	4
"Adubos e Adubação"	4
"Manejo e Conservação do Solo e da Água"	4
"Irrigação e Drenagem"	5
"Agrometeorologia"	4
"Fundamentos em Enfermagem"	5
"Saúde Coletiva I"	3
"Saúde Coletiva II"	2
"Enfermagem Médica"	4
"Psicologia e Ética"	3
"Geologia 1"	4
"Climatologia 1"	4
"Teoria e método em Geografia"	4
"Cartografia"	4
"PIPE 1"	4
"Geologia 2"	4
"Climatologia 2"	4
"Fundamentos de Matemática Elementar I"	6
"Fundamentos de Matemática Elementar II"	6
"Cálculo Diferencial e Integral I"	6
"Cálculo Diferencial e Integral II"	6
"Geometria Analitica"	6
"Sistemas de Banco de Dados"	6
"Redes de computadores"	4
"Projeto e desenvolvimento 1"	4
"Engenharia de Software"	4
"Otimização"	4
"Unidade de Constituição do Organismo"	14
"Unidade de Funcionamento do Organismo I"	8
"Un. de Reabilitação Integral do Ap. Estomatognático I"	4
"Unidade de Investigação Científica I (UIC1)"	3
"Unidade de Saúde Humana I (USH1)"	2
"Metodologia do Ensino de Ciência"	8
"Estágio Supervisionado I"	10
"Construção do Discurso Escrito"	4
"Metodologia do Ensino da Língua Portuguesa"	8
"Filosofia da Educação"	4
"Fisiologia do Exercício"	6
"Teoria e Prática do Treinamento I"	4
"Ritmo e Expressão"	4
"Teoria e Prática do Treinamento II"	4
*/

--c)
SELECT  sigla AS cod,
		nome AS nome_faculdade,
		predio AS local,
		orcamento AS orcamento
		FROM faculdade;
/*
"FACOM"	"Faculdade da Computação"	"1B   "	10000.50
"FADIR"	"Faculdade de Direito"	"3D   "	200000.00
"INFIS"	"Instituto de Física"	"1X   "	37500000.00
"ICBIM"	"Instituto de Ciências Biomédicas"	"2A   "	200000.00
"ICIAG"	"Instituto de Ciências Agrárias"	"2E   "	500000.00
"ESTES"	"Escola Técnica de Saúde"	"4K   "	1244416.00
"FACIP"	"Faculdade de Ciencias Integradas de Pontal"	"3K   "	1000000.00
"FAMEV"	"Faculdade de Medicina Veterinária"	"1BCG "	13000000.00
"INBIO"	"Instituto de Biologia"	"2D28 "	52413.09
"IFILO"	"Instituto de Filosofia"	"1U   "	8000000.00
"IARTE"	"Instituto de Artes"	"5S   "	1500000.00
"FAMAT"	"Faculdade de Matematica"	"1F   "	37500000.00
"FECIV"	"Faculdade de Engenharia Civil"	"1C   "	6000.90
"FEELT"	"Faculdade de Engenharia Elétrica"	"1E   "	370000.00
"FOUFU"	"Faculdade de Odontologia"	"UMU4L"	1200000.00
"FAEDU"	"Faculdade de Educação Física"	"1A   "	250500.50
"FAMEC"	"Faculdade de Engenharia Mecânica"	"1DCG "	0.50
*/

--d)
SELECT nome,age(current_date, datanasc) AS idade FROM estudante;
/*"Pedro Henrique Silva"	"21 years 6 mons 22 days"
"Gabriel Borges Júnior"	"20 years 10 mons 15 days"
"Amanda Gomes de Oliveira"	"22 years 8 mons 17 days"
"Jorge Antônio Santos"	"23 years 3 mons 21 days"
"Bruna Tobias Pinto"	"21 years 4 mons 20 days"
"Jonas Caravalho"	"32 years 2 mons 12 days"
"Luna da Conceição"	"35 years 4 mons 5 days"
"Ana Silveira"	"19 years 4 mons 2 days"
"Guilherme da Cunha"	"21 years 11 mons 22 days"
"Davi Lucca Duarte"	"48 years 1 mon 29 days"
"Henrique Corrêa de Oliveira"	"22 years 9 mons 29 days"
"Gabriel de Araujo"	"22 years 7 mons 15 days"
"Luisa Gomes Ferreira"	"22 years 9 mons 17 days"
"Gabriela Pereira"	"22 years 4 mons 17 days"
"Gabriel Alves"	"22 years 2 mons 5 days"
"Joao Vitor Correia"	"22 years 8 mons 19 days"
"Marina Silva Gomes"	"20 years 3 mons 7 days"
"Maria Julia Oliveira"	"23 years 22 days"
"Vicente Araujo Mendes"	"27 years 7 mons 10 days"
"Alexandre Oliveira Rodrigues"	"21 years 6 mons 4 days"
"Vinicius Ribeiro"	"29 years 10 mons 18 days"
"César Bertolin"	"29 years 10 mons 18 days"
"Bruno José"	"122 years 10 mons 18 days"
"Elaine Maria"	"33 years 10 mons 18 days"
"Carlos Silva"	"29 years 10 mons 18 days"
"Isabella Melo Sousa"	"22 years 8 mons 13 days"
"Jose Almeida Azevedo"	"20 years 6 mons 3 days"
"Aline Oliveira Araujo"	"21 years 3 mons 9 days"
"Andre Silva Martins"	"22 years 2 mons 21 days"
"Lavinia Sousa Carvalho"	"20 years 1 mon 6 days"
"Victor Guilherme Oliveira Santos"	"24 years 4 days"
"Sara Pelegrineti de José"	"48 years 10 mons 23 days"
"Davi Rui Pasquim"	"20 years 7 mons 7 days"
"Diego Ruas"	"26 years 11 mons 4 days"
"Pedro Tiene Silva"	"19 years 6 mons 2 days"
"Jason Manmoa"	"60 years 8 mons 18 days"
"Scott Pilgrim"	"58 years 7 mons 20 days"
"Naruto Uzumaki"	"54 years 11 mons 13 days"
"Frederico Krueger"	"54 years 8 mons 4 days"
"Jason Thirtenn"	"54 years 8 mons 4 days"
"Aline Ferreira Magalhaes"	"22 years 5 mons 20 days"
"Cristiano Bueno de Almeida"	"20 years 4 mons 11 days"
"Derli Luis Arantes Junior"	"20 years 11 mons 4 days"
"Gladston Marcelo Pereira do Vale"	"22 years 6 mons 13 days"
"Kamila Stephany Alves Santos"	"17 years 3 mons 25 days"
"Alexandre Borba Chiqueta"	"23 years 6 mons 10 days"
"Flávio Fernandes"	"24 years 3 mons 22 days"
"Gabrel Toledo"	"39 years 4 mons 22 days"
"Nicolas Paolinelli"	"27 years 7 mons 29 days"
"Matheus Brasileiro Aguiar"	"32 years 2 mons 7 days"
"João Augusto Silva"	"22 years 2 mons 15 days"
"Pedro Nunes"	"20 years 11 mons 15 days"
"Augusto Pereira"	"23 years 9 mons 27 days"
"Maria Ferreira"	"22 years 9 mons 22 days"
"Ana Paula Freitas"	"20 years 1 mon 6 days"
"Elaine Ribeiro de Faria Paiva"	"24 years 9 mons 29 days"
"Fernando Souza"	"23 years 8 mons 12 days"
"Rafael Silva"	"19 years 11 mons 23 days"
"João Marcos Ramos"	"21 years 6 mons 12 days"
"Marcos Estefam"	"22 years 4 mons 9 days"
"Neil Gaiman"	"22 years 14 days"
"Robert Louis Stevenson"	"23 years 11 days"
"Anne Rice"	"22 years 1 mon 20 days"
"Bram Stocker"	"22 years 16 days"
"Marry Shelley"	"23 years 2 mons 25 days"
"Peter Benjamin Parker"	"29 years 2 mons 28 days"
"Peter Kavinsky"	"19 years 3 mons 21 days"
"Lara Jean"	"20 years 7 mons 18 days"
"Percy Jackson"	"29 years 3 mons 6 days"
"Veronica Lodge"	"28 years 4 mons 25 days"
"Annelise Salem"	"20 years 3 mons 18 days"
"Victor Bagliano"	"22 years 4 mons 10 days"
"Leandro Peres"	"21 years 2 mons 12 days"
"Marina Barcelos"	"20 years 1 mon 10 days"
"Gabriel Hugo Borges"	"22 years 11 mons 10 days"
"Gustavo Duarte Gomides"	"19 years 11 mons 12 days"
"Rodrigo Alves da Silva"	"32 years 6 mons 4 days"
"Julia Echeverria"	"23 years 2 mons 19 days"
"Guilherme Duarte"	"24 years 1 mon 9 days"
"Rodrigo da Silva"	"22 years 10 mons 23 days"
"Rafael Henrique Guimarães"	"19 years 8 mons 10 days"
"Felipe Langer"	"22 years 7 mons 23 days"
"Lucas Daniel Cunha"	"19 years 10 mons 27 days"
"Laura Rezende Teixeira Santos"	"19 years 3 mons 11 days"
"Mariana Serrano Guimaraes"	"24 years 10 mons 18 days"
*/

--6)
--6)
--a)
	SELECT nome FROM faculdade WHERE predio ='1F';
	--"Faculdade de Matematica"
--b)
	SELECT nome FROM estudante WHERE cra > 60;
	/*
	"Pedro Henrique Silva"
	"Gabriel Borges Júnior"
	"Jorge Antônio Santos"
	"Jonas Caravalho"
	"Luna da Conceição"
	"Ana Silveira"
	"Guilherme da Cunha"
	"Henrique Corrêa de Oliveira"
	"Gabriel de Araujo"
	"Luisa Gomes Ferreira"
	"Gabriela Pereira"
	"Gabriel Alves"
	"Joao Vitor Correia"
	"Marina Silva Gomes"
	"Maria Julia Oliveira"
	"Vicente Araujo Mendes"
	"Alexandre Oliveira Rodrigues"
	"Vinicius Ribeiro"
	"Bruno José"
	"Carlos Silva"
	"Victor Guilherme Oliveira Santos"
	"Sara Pelegrineti de José"
	"Davi Rui Pasquim"
	"Diego Ruas"
	"Pedro Tiene Silva"
	"Jason Manmoa"
	"Scott Pilgrim"
	"Frederico Krueger"
	"Jason Thirtenn"
	"Aline Ferreira Magalhaes"
	"Cristiano Bueno de Almeida"
	"Derli Luis Arantes Junior"
	"Gladston Marcelo Pereira do Vale"
	"Kamila Stephany Alves Santos"
	"Alexandre Borba Chiqueta"
	"Flávio Fernandes"
	"Gabrel Toledo"
	"Nicolas Paolinelli"
	"Matheus Brasileiro Aguiar"
	"João Augusto Silva"
	"Pedro Nunes"
	"Augusto Pereira"
	"Maria Ferreira"
	"Ana Paula Freitas"
	"Elaine Ribeiro de Faria Paiva"
	"Fernando Souza"
	"Rafael Silva"
	"João Marcos Ramos"
	"Marcos Estefam"
	"Neil Gaiman"
	"Robert Louis Stevenson"
	"Anne Rice"
	"Bram Stocker"
	"Marry Shelley"
	"Peter Benjamin Parker"
	"Peter Kavinsky"
	"Lara Jean"
	"Percy Jackson"
	"Victor Bagliano"
	"Marina Barcelos"
	"Gustavo Duarte Gomides"
	"Rodrigo Alves da Silva"
	"Julia Echeverria"
	"Guilherme Duarte"
	"Rodrigo da Silva"
	"Rafael Henrique Guimarães"
	"Felipe Langer"
	"Lucas Daniel Cunha"
	"Laura Rezende Teixeira Santos"
	"Mariana Serrano Guimaraes"
	*/
--c)
	SELECT turma FROM turma WHERE semestre = 2;
	/*
	"1A"
	"1A"
	"33"
	"31"
	"29"
	"A "
	"A "
	"B "
	"57"
	"61"
	"B "
	"02"
	"03"
	"04"
	"05"
	"65"
	"67"
	"69"
	"00"
	"02"
	"03"
	"04"
	"05"
	"63"
	"65"
	"67"
	"D1"
	"D1"
	"D3"
	"A1"
	"A2"
	*/
--d)
	SELECT EXTRACT (month FROM datanasc) AS mes, EXTRACT (DAY FROM datanasc) AS dia FROM estudante WHERE nome = 'Jason Manmoa';
	--3	6
--e)
	SELECT nome FROM disciplina WHERE UPPER(nome) LIKE 'S%';
	/*
	"Saúde Coletiva I"
	"Saúde Coletiva II"
	"Sistemas de Banco de Dados"
	*/
--f)
	SELECT *,  EXTRACT ( year from AGE(datanasc))FROM estudante WHERE datanasc >= now() - interval '20 years';
	/*
	"1712       "	"Ana Silveira"	"2003-07-22"	"INBIO"	80.9	"1703       "	19
	"424        "	"Pedro Tiene Silva"	"2003-05-22"	"ESTES"	63.8	"404        "	19
	"1409       "	"Kamila Stephany Alves Santos"	"2005-07-30"	"IFILO"	66	"1402       "	17
	"607        "	"Rafael Silva"	"2002-12-01"	"FADIR"	78.55	"604        "	19
	"2011       "	"Peter Kavinsky"	"2003-08-03"	"ICBIM"	70	"2009       "	19
	"950        "	"Gustavo Duarte Gomides"	"2002-12-12"	"ESTES"	85.5	"904        "	19
	"12021GEO001"	"Rafael Henrique Guimarães"	"2003-03-14"	"FACIP"	88.4	"501        "	19
	"12021GEO003"	"Lucas Daniel Cunha"	"2002-12-28"	"FACIP"	84.2	"502        "	19
	"12021GEO004"	"Laura Rezende Teixeira Santos"	"2003-08-13"	"FACIP"	91.3	"503        "	19
	*/
--g)
	SELECT nome FROM estudante WHERE tutor is NULL;
	/*
	"Luna da Conceição"
	"João Augusto Silva"
	"Augusto Pereira"
	"Ana Paula Freitas"
	"Victor Bagliano"
	"Leandro Peres"
	"Marina Barcelos"
	*/
--h) 
	SELECT nome FROM estudante WHERE tutor is NOT NULL;
	/*
	"Pedro Henrique Silva"
	"Gabriel Borges Júnior"
	"Amanda Gomes de Oliveira"
	"Jorge Antônio Santos"
	"Bruna Tobias Pinto"
	"Jonas Caravalho"
	"Ana Silveira"
	"Guilherme da Cunha"
	"Davi Lucca Duarte"
	"Henrique Corrêa de Oliveira"
	"Gabriel de Araujo"
	"Luisa Gomes Ferreira"
	"Gabriela Pereira"
	"Gabriel Alves"
	"Joao Vitor Correia"
	"Marina Silva Gomes"
	"Maria Julia Oliveira"
	"Vicente Araujo Mendes"
	"Alexandre Oliveira Rodrigues"
	"Vinicius Ribeiro"
	"César Bertolin"
	"Bruno José"
	"Elaine Maria"
	"Carlos Silva"
	"Isabella Melo Sousa"
	"Jose Almeida Azevedo"
	"Aline Oliveira Araujo"
	"Andre Silva Martins"
	"Lavinia Sousa Carvalho"
	"Victor Guilherme Oliveira Santos"
	"Sara Pelegrineti de José"
	"Davi Rui Pasquim"
	"Diego Ruas"
	"Pedro Tiene Silva"
	"Jason Manmoa"
	"Scott Pilgrim"
	"Naruto Uzumaki"
	"Frederico Krueger"
	"Jason Thirtenn"
	"Aline Ferreira Magalhaes"
	"Cristiano Bueno de Almeida"
	"Derli Luis Arantes Junior"
	"Gladston Marcelo Pereira do Vale"
	"Kamila Stephany Alves Santos"
	"Alexandre Borba Chiqueta"
	"Flávio Fernandes"
	"Gabrel Toledo"
	"Nicolas Paolinelli"
	"Matheus Brasileiro Aguiar"
	"Pedro Nunes"
	"Maria Ferreira"
	"Elaine Ribeiro de Faria Paiva"
	"Fernando Souza"
	"Rafael Silva"
	"João Marcos Ramos"
	"Marcos Estefam"
	"Neil Gaiman"
	"Robert Louis Stevenson"
	"Anne Rice"
	"Bram Stocker"
	"Marry Shelley"
	"Peter Benjamin Parker"
	"Peter Kavinsky"
	"Lara Jean"
	"Percy Jackson"
	"Veronica Lodge"
	"Annelise Salem"
	"Gabriel Hugo Borges"
	"Gustavo Duarte Gomides"
	"Rodrigo Alves da Silva"
	"Julia Echeverria"
	"Guilherme Duarte"
	"Rodrigo da Silva"
	"Rafael Henrique Guimarães"
	"Felipe Langer"
	"Lucas Daniel Cunha"
	"Laura Rezende Teixeira Santos"
	"Mariana Serrano Guimaraes"
	*/
--i)
	SELECT * FROM turma WHERE ano >= 2000;
	/*
	"06"
	"1A"
	"1B"
	"1A"
	"1A"
	"1A"
	"1A"
	"33"
	"33"
	"31"
	"31"
	"29"
	"A "
	"B "
	"C "
	"D "
	"E "
	"F "
	"C "
	"D "
	"C "
	"C "
	"C "
	"C "
	"A "
	"A "
	"A "
	"A "
	"A "
	"B "
	"55"
	"57"
	"59"
	"61"
	"63"
	"A "
	"B "
	"C "
	"D "
	"E "
	"F "
	"01"
	"02"
	"03"
	"04"
	"05"
	"17"
	"17"
	"18"
	"19"
	"20"
	"65"
	"66"
	"67"
	"68"
	"69"
	"63"
	"64"
	"65"
	"66"
	"67"
	"D1"
	"D1"
	"D2"
	"D3"
	"D4"
	"A1"
	"A2"
	"B1"
	"C1"
	"D1"
	"E1"
	"A "
	"B "
	"C "
	"D "
	"E "
	"F "
	"01"
	"02"
	"03"
	"04"
	"05"
	*/
--j)
	 SELECT nome,datanasc FROM estudante WHERE EXTRACT(year FROM datanasc) BETWEEN 1985 AND 1995;
	 /*
	"Jonas Caravalho" "1990-09-12"
	"Luna da Conceição"	"1987-07-19"
	"Vicente Araujo Mendes"	"1995-04-14"
	"Vinicius Ribeiro"	"1993-01-06"
	"César Bertolin"	"1993-01-06"
	"Elaine Maria"	"1989-01-06"
	"Carlos Silva"	"1993-01-06"
	"Diego Ruas"	"1995-12-20"
	"Nicolas Paolinelli"	"1995-03-26"
	"Matheus Brasileiro Aguiar"	"1990-09-17"
	"Peter Benjamin Parker"	"1993-08-27"
	"Percy Jackson"	"1993-08-18"
	"Veronica Lodge"	"1994-06-29"
	"Rodrigo Alves da Silva"	"1990-05-20"
	*/

	--k)
		SELECT nome FROM professor WHERE nome BETWEEN 'Carlos' AND 'Maria' ORDER BY nome ASC;
		/*
		"Carlos Hernrique Gomes"
		"Cassiano Aimberê Dorneles Welker"
		"Cláudio Assembly"
		"Clelia Regina Cafer"
		"Daniela Cristina de Oliveira"
		"Daniela de Melo Crosara"
		"Dennys Garcia Xavier"
		"Disney Oliver"
		"Djalmir Nestor Messias"
		"Elaine Java"
		"Elaine Ribeiro"
		"Elsieni Coelho da Silva"
		"Fernando Rodrigo Rafaeli"
		"Fernando Rodrigues Martins"
		"Gabriel Jesus"
		"Gastao da Cunha Frota"
		"Gina Maira"
		"Giuliano Buzá Jacobucci"
		"Gustavo de Carvalho Marin"
		"Henrique Tomaz Gonzaga"
		"Jailson Mendes"
		"Jamil Salem"
		"Jeamylle Nilin Gonçalves"
		"Jean Ponciano"
		"João Guilherme"
		"Julia Vingadora"
		"Kelly Aparecida Geraldo Yoneyama Tudini"
		"Lilian Rodrigues Sant’ Anna Campos"
		"Lucas de Assis Ribeiro"
		"Luciano Hulk"
		"Luiz Gustavo Almeida Martins"
		"Marcel Novaes"
		"Marcelo Keese Albertini"
		"Marcia Aparecida Fernandes"
		*/
	--l) 
		SELECT nome FROM disciplina WHERE UPPER(fac_disc) IN('FADIR','FAMAT','FEMEC');
		/*
		"Teoria do Direito"
		"Direito Digital"
		"Direito do Trabalho 1"
		"Direito do Trabalho 2"
		"Direito Financeiro"
		"Fundamentos de Matemática Elementar I"
		"Fundamentos de Matemática Elementar II"
		"Cálculo Diferencial e Integral I"
		"Cálculo Diferencial e Integral II"
		"Geometria Analitica"
		*/
--n)
	SELECT semestre FROM turma WHERE semestre NOT IN (1, 2);
	/*
	20232
	3
	4
	5
	6
	12022
	12021
	22021
	22022
	12023
	3
	4
	4
	20211
	20212
	20221
	20222
	20231
	*/
	
--7)
--a)
	UPDATE disciplina SET nome = UPPER(nome);
/*
"GEDU43"	"COMPORTAMENTO MOTOR "	"FAEDU"	90
"GBC045"	"PROGRAMAÇÃO PROCEDIMENTAL"	"FACOM"	90
"GBC023"	"ALGORITMO E ESTRUTURA DE DADOS 1"	"FACOM"	90
"GBC024"	"ALGORITMO E ESTRUTURA DE DADOS 2"	"FACOM"	70
"GBC034"	"PROGRAMAÇÃO ORIENTADA A OBJETOS"	"FACOM"	60
"GBC012"	"LÓGICA"	"FACOM"	60
"BCC002"	"LÓGICA PARA PROGRAMAÇÃO"	"FACOM"	60
"BCC003"	"CÁLCULO 1"	"FACOM"	60
"BCC005"	"ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES"	"FACOM"	60
"GMV003"	"BIOQUÍMICA 1"	"FAMEV"	75
"GMV007"	"BIOQUÍMICA 2"	"FAMEV"	75
"GMV005"	"FUNDAMENTOS DE ANATOMIA VETERINÁRIA"	"FAMEV"	75
"GMV006"	"ANATOMIA DOS ANIMAIS DOMÉSTICOS"	"FAMEV"	75
"GMV001"	"CITOLOGIA, HISTOLOGIA E EMBRIOLOGIA"	"FAMEV"	75
"1410  "	"FILOSOFIA GERAL: PROBLEMAS METAFÍSICOS"	"IFILO"	60
"1411  "	"HISTÓRIA DA FILOSOFIA MEDIEVAL"	"IFILO"	30
"1412  "	"ÉTICA"	"IFILO"	90
"1413  "	"PSICOLOGIA DA EDUCAÇÃO"	"IFILO"	60
"1414  "	"DIDÁTICA GERAL"	"IFILO"	60
"1415  "	"ETICA II"	"IFILO"	90
"1416  "	"DIDÁTICA GERAL II"	"IFILO"	60
"GAV001"	"HISTORIA DA ARTE I"	"IARTE"	60
"GAV007"	"HISTORIA DA ARTE II"	"IARTE"	60
"GAV013"	"ARTE CONTEMPORANEA I"	"IARTE"	60
"GAV019"	"ARTE CONTEMPORANEA II"	"IARTE"	60
"GAV010"	"ARTE COMPUTACIONAL"	"IARTE"	60
"31505 "	"AVALIAÇÃO DE IMPACTOS AMBIENTAL PARA BIÓLOGOS"	"INBIO"	60
"39030 "	"BIOLOGIA E CULTURA - (PROINTER III)"	"INBIO"	60
"31104 "	"CONSTRUÇÃO DO CONHECIMENTO CIENTÍFICO"	"INBIO"	30
"31602 "	"EVOLUÇÃO"	"INBIO"	60
"31407 "	"PROFISSÃO BIÓLOGO"	"INBIO"	30
"FADIR3"	"TEORIA DO DIREITO"	"FADIR"	60
"FADIR4"	"DIREITO DIGITAL"	"FADIR"	30
"FADIR5"	"DIREITO DO TRABALHO 1"	"FADIR"	60
"FADIR6"	"DIREITO DO TRABALHO 2"	"FADIR"	30
"FADIR7"	"DIREITO FINANCEIRO"	"FADIR"	30
"310   "	"FÍSICA BÁSICA I"	"INFIS"	90
"311   "	"FÍSICA BÁSICA II"	"INFIS"	90
"312   "	"FÍSICA BÁSICA III"	"INFIS"	90
"313   "	"GEOMETRICA ANALÍTICA"	"INFIS"	60
"314   "	"ALGORITMOS E PROGRAMAÇÃO DE COMPUTADORES"	"INFIS"	60
"2000  "	"ANALISES CLINICAS"	"ICBIM"	40
"2001  "	"IMUNOLOGIA"	"ICBIM"	30
"2002  "	"GENETICA"	"ICBIM"	20
"2003  "	"MICROBIOLOGIA"	"ICBIM"	30
"2004  "	"BIOSSEGURANÇA"	"ICBIM"	40
"1801  "	"CONSTRUÇÕES RURAIS"	"ICIAG"	60
"1802  "	"ADUBOS E ADUBAÇÃO"	"ICIAG"	60
"1803  "	"MANEJO E CONSERVAÇÃO DO SOLO E DA ÁGUA"	"ICIAG"	60
"1804  "	"IRRIGAÇÃO E DRENAGEM"	"ICIAG"	75
"1805  "	"AGROMETEOROLOGIA"	"ICIAG"	60
"ESTES1"	"FUNDAMENTOS EM ENFERMAGEM"	"ESTES"	75
"ESTES2"	"SAÚDE COLETIVA I"	"ESTES"	45
"ESTES3"	"SAÚDE COLETIVA II"	"ESTES"	30
"ESTES4"	"ENFERMAGEM MÉDICA"	"ESTES"	60
"ESTES5"	"PSICOLOGIA E ÉTICA"	"ESTES"	45
"GGO001"	"GEOLOGIA 1"	"FACIP"	60
"GGO002"	"CLIMATOLOGIA 1"	"FACIP"	60
"GGO003"	"TEORIA E MÉTODO EM GEOGRAFIA"	"FACIP"	60
"GGO004"	"CARTOGRAFIA"	"FACIP"	60
"GGO005"	"PIPE 1"	"FACIP"	60
"GGO011"	"GEOLOGIA 2"	"FACIP"	60
"GGO012"	"CLIMATOLOGIA 2"	"FACIP"	60
"MAT201"	"FUNDAMENTOS DE MATEMÁTICA ELEMENTAR I"	"FAMAT"	90
"MAT211"	"FUNDAMENTOS DE MATEMÁTICA ELEMENTAR II"	"FAMAT"	90
"MAT212"	"CÁLCULO DIFERENCIAL E INTEGRAL I"	"FAMAT"	90
"MAT213"	"CÁLCULO DIFERENCIAL E INTEGRAL II"	"FAMAT"	90
"MAT214"	"GEOMETRIA ANALITICA"	"FAMAT"	90
"GBC043"	"SISTEMAS DE BANCO DE DADOS"	"FACOM"	90
"GSI023"	"REDES DE COMPUTADORES"	"FACOM"	60
"GSI034"	"PROJETO E DESENVOLVIMENTO 1"	"FACOM"	60
"GSI030"	"ENGENHARIA DE SOFTWARE"	"FACOM"	60
"GSI027"	"OTIMIZAÇÃO"	"FACOM"	60
"GOG001"	"UNIDADE DE CONSTITUIÇÃO DO ORGANISMO"	"FOUFU"	210
"GOG002"	"UNIDADE DE FUNCIONAMENTO DO ORGANISMO I"	"FOUFU"	120
"GOG003"	"UN. DE REABILITAÇÃO INTEGRAL DO AP. ESTOMATOGNÁTICO I"	"FOUFU"	60
"GOG004"	"UNIDADE DE INVESTIGAÇÃO CIENTÍFICA I (UIC1)"	"FOUFU"	45
"GOG005"	"UNIDADE DE SAÚDE HUMANA I (USH1)"	"FOUFU"	30
"410   "	"METODOLOGIA DO ENSINO DE CIÊNCIA"	"ESTES"	120
"411   "	"ESTÁGIO SUPERVISIONADO I"	"ESTES"	150
"414   "	"FILOSOFIA DA EDUCAÇÃO"	"ESTES"	60
"412   "	"CONSTRUÇÃO DO DISCURSO ESCRITO"	"ESTES"	60
"413   "	"METODOLOGIA DO ENSINO DA LÍNGUA PORTUGUESA"	"ESTES"	120
"GEDU31"	"FISIOLOGIA DO EXERCÍCIO"	"FAEDU"	90
"GEDU32"	"TEORIA E PRÁTICA DO TREINAMENTO I"	"FAEDU"	60
"GEDU41"	"RITMO E EXPRESSÃO"	"FAEDU"	60
"GEDU42"	"TEORIA E PRÁTICA DO TREINAMENTO II"	"FAEDU"	60
*/

--b)
	UPDATE estudante SET cra = cra * 1.10;
	SELECT * FROM estudante;
/*
"id"	"nome"	"datanasc"	"fac_est"	"cra"	"tutor"
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	82.83	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	74.909996	"102        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	62.59	"103        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	89.54	"104        "
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FACOM"	52.25	"105        "
"206        "	"Marina Silva Gomes"	"2002-08-17"	"FAMAT"	93.5	"203        "
"207        "	"Maria Julia Oliveira"	"1999-11-02"	"FAMAT"	99	"202        "
"208        "	"Vicente Araujo Mendes"	"1995-04-14"	"FAMAT"	88	"200        "
"209        "	"Alexandre Oliveira Rodrigues"	"2001-05-20"	"FAMAT"	71.5	"201        "
"1500       "	"Vinicius Ribeiro"	"1993-01-06"	"FOUFU"	110	"1500       "
"1501       "	"César Bertolin"	"1993-01-06"	"FOUFU"	55	"1501       "
"1502       "	"Bruno José"	"1900-01-06"	"FOUFU"	110	"1502       "
"1503       "	"Elaine Maria"	"1989-01-06"	"FOUFU"	66	"1503       "
"1504       "	"Carlos Silva"	"1993-01-06"	"FOUFU"	77	"1504       "
"12021BAV001"	"Isabella Melo Sousa"	"2000-03-11"	"IARTE"	8.799999	"1600       "
"12021BAV016"	"Jose Almeida Azevedo"	"2002-05-21"	"IARTE"	7.7	"1605       "
"197        "	"Gabrel Toledo"	"1983-07-02"	"FACOM"	93.5	"102        "
"196        "	"Nicolas Paolinelli"	"1995-03-26"	"FACOM"	87.604	"100        "
"195        "	"Matheus Brasileiro Aguiar"	"1990-09-17"	"FACOM"	85.778	"104        "
"1300       "	"João Augusto Silva"	"2000-09-09"	"FAMEV"	88	
"1301       "	"Pedro Nunes"	"2001-12-09"	"FAMEV"	99	"1300       "
"1302       "	"Augusto Pereira"	"1999-01-28"	"FAMEV"	80.3	
"1303       "	"Maria Ferreira"	"2000-02-02"	"FAMEV"	104.5	"1304       "
"1304       "	"Ana Paula Freitas"	"2002-10-18"	"FAMEV"	97.9	
"605        "	"Elaine Ribeiro de Faria Paiva"	"1998-01-26"	"FADIR"	97.9	"603        "
"606        "	"Fernando Souza"	"1999-03-12"	"FADIR"	73.975	"603        "
"607        "	"Rafael Silva"	"2002-12-01"	"FADIR"	86.40501	"604        "
"608        "	"João Marcos Ramos"	"2001-05-12"	"FADIR"	96.69	"604        "
"609        "	"Marcos Estefam"	"2000-07-15"	"FADIR"	82.665	"604        "
"305        "	"Neil Gaiman"	"2000-11-10"	"INFIS"	99.55	"300        "
"306        "	"Robert Louis Stevenson"	"1999-11-13"	"INFIS"	93.5	"301        "
"307        "	"Anne Rice"	"2000-10-04"	"INFIS"	86.02	"302        "
"308        "	"Bram Stocker"	"2000-11-08"	"INFIS"	96.8	"302        "
"309        "	"Marry Shelley"	"1999-08-30"	"INFIS"	100.869995	"303        "
"2010       "	"Peter Benjamin Parker"	"1993-08-27"	"ICBIM"	110	"2008       "
"2011       "	"Peter Kavinsky"	"2003-08-03"	"ICBIM"	77	"2009       "
"2012       "	"Lara Jean"	"2002-04-06"	"ICBIM"	108.9	"2005       "
"2013       "	"Percy Jackson"	"1993-08-18"	"ICBIM"	82.5	"2007       "
"2014       "	"Veronica Lodge"	"1994-06-29"	"ICBIM"	66	"2006       "
"1807       "	"Annelise Salem"	"2002-08-06"	"ICIAG"	22	"1812       "
"1808       "	"Victor Bagliano"	"2000-07-14"	"ICIAG"	99.21999	
"1809       "	"Leandro Peres"	"2001-09-12"	"ICIAG"	66	
"1810       "	"Marina Barcelos"	"2002-10-14"	"ICIAG"	77	
"1811       "	"Gabriel Hugo Borges"	"1999-12-14"	"ICIAG"	44.55	"1813       "
"950        "	"Gustavo Duarte Gomides"	"2002-12-12"	"ESTES"	94.05	"904        "
"951        "	"Rodrigo Alves da Silva"	"1990-05-20"	"ESTES"	82.71999	"900        "
"952        "	"Julia Echeverria"	"1999-09-05"	"ESTES"	99.880005	"902        "
"953        "	"Guilherme Duarte"	"1998-10-15"	"ESTES"	880	"904        "
"954        "	"Rodrigo da Silva"	"2000-01-01"	"ESTES"	66.22	"900        "
"12021GEO001"	"Rafael Henrique Guimarães"	"2003-03-14"	"FACIP"	97.240005	"501        "
"12021GEO002"	"Felipe Langer"	"2000-04-01"	"FACIP"	95.369995	"501        "
"12021GEO003"	"Lucas Daniel Cunha"	"2002-12-28"	"FACIP"	92.619995	"502        "
"12021GEO004"	"Laura Rezende Teixeira Santos"	"2003-08-13"	"FACIP"	100.43	"503        "
"12021GEO005"	"Mariana Serrano Guimaraes"	"1998-01-06"	"FACIP"	101.31	"504        "
"1710       "	"Jonas Caravalho"	"1990-09-12"	"INBIO"	77	"1700       "
"1711       "	"Luna da Conceição"	"1987-07-19"	"INBIO"	66.22	
"1712       "	"Ana Silveira"	"2003-07-22"	"INBIO"	88.990005	"1703       "
"1713       "	"Guilherme da Cunha"	"2000-12-02"	"INBIO"	73.259995	"1701       "
"1714       "	"Davi Lucca Duarte"	"1974-09-25"	"INBIO"	60.829994	"1700       "
"221BSI251ST"	"Henrique Corrêa de Oliveira"	"2000-01-26"	"FACOM"	83.27	"10000000010"
"222BCC201ST"	"Gabriel de Araujo"	"2000-04-09"	"FACOM"	79.53001	"10000000011"
"189BSI255ST"	"Luisa Gomes Ferreira"	"2000-02-07"	"FACOM"	86.130005	"10000000001"
"221BSI255ST"	"Gabriela Pereira"	"2000-07-07"	"FACOM"	78.43	"10000000000"
"189BSI232ST"	"Gabriel Alves"	"2000-09-19"	"FACOM"	75.130005	"10000000100"
"205        "	"Joao Vitor Correia"	"2000-03-05"	"FAMAT"	77	"204        "
"12021BAV029"	"Aline Oliveira Araujo"	"2001-08-15"	"IARTE"	8.799999	"1600       "
"12021BAV040"	"Andre Silva Martins"	"2000-09-03"	"IARTE"	7.7	"1610       "
"12021BAV020"	"Lavinia Sousa Carvalho"	"2002-10-18"	"IARTE"	8.799999	"1600       "
"420        "	"Victor Guilherme Oliveira Santos"	"1998-11-20"	"ESTES"	105.93	"400        "
"421        "	"Sara Pelegrineti de José"	"1974-01-01"	"ESTES"	109.67	"401        "
"422        "	"Davi Rui Pasquim"	"2002-04-17"	"ESTES"	84.48	"402        "
"423        "	"Diego Ruas"	"1995-12-20"	"ESTES"	94.490005	"403        "
"424        "	"Pedro Tiene Silva"	"2003-05-22"	"ESTES"	70.18	"404        "
"444        "	"Jason Manmoa"	"1962-03-06"	"FAEDU"	74.25	"420        "
"445        "	"Scott Pilgrim"	"1964-04-04"	"FAEDU"	97.130005	"421        "
"446        "	"Naruto Uzumaki"	"1967-12-11"	"FAEDU"	64.90001	"421        "
"447        "	"Frederico Krueger"	"1968-03-20"	"FAEDU"	86.34999	"423        "
"448        "	"Jason Thirtenn"	"1968-03-20"	"FAEDU"	108.35	"423        "
"1405       "	"Aline Ferreira Magalhaes"	"2000-06-04"	"IFILO"	77	"1400       "
"1406       "	"Cristiano Bueno de Almeida"	"2002-07-13"	"IFILO"	97.79	"1400       "
"1407       "	"Derli Luis Arantes Junior"	"2001-12-20"	"IFILO"	84.7	"1403       "
"1408       "	"Gladston Marcelo Pereira do Vale"	"2000-05-11"	"IFILO"	88.21999	"1403       "
"1409       "	"Kamila Stephany Alves Santos"	"2005-07-30"	"IFILO"	72.59999	"1402       "
"199        "	"Alexandre Borba Chiqueta"	"1999-05-14"	"FACOM"	88.638	"100        "
"198        "	"Flávio Fernandes"	"1998-08-02"	"FACOM"	91.31101	"100        "
*/


--c)
	UPDATE  estudante SET cra = 100 WHERE cra > 100;
	SELECT cra  FROM estudante;
/*
"cra"
82.83
74.909996
62.59
89.54
52.25
93.5
99
88
71.5
100
100
100
100
100
100
100
100
100
100
100
55
66
77
8.799999
7.7
93.5
87.604
85.778
88
99
80.3
97.9
97.9
73.975
86.40501
96.69
82.665
99.55
93.5
86.02
96.8
77
82.5
66
22
99.21999
66
77
44.55
94.05
82.71999
99.880005
66.22
97.240005
95.369995
92.619995
77
66.22
88.990005
73.259995
60.829994
83.27
79.53001
86.130005
78.43
75.130005
77
8.799999
7.7
8.799999
84.48
94.490005
70.18
74.25
97.130005
64.90001
86.34999
77
97.79
84.7
88.21999
72.59999
88.638
91.31101
100
*/

--d)
	UPDATE estudante SET tutor = NULL WHERE cra < 80;
/*
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	74.909996	
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	62.59	
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FACOM"	52.25	
"209        "	"Alexandre Oliveira Rodrigues"	"2001-05-20"	"FAMAT"	71.5	
"1811       "	"Gabriel Hugo Borges"	"1999-12-14"	"ICIAG"	44.55	
"954        "	"Rodrigo da Silva"	"2000-01-01"	"ESTES"	66.22	
"1710       "	"Jonas Caravalho"	"1990-09-12"	"INBIO"	77	
"1711       "	"Luna da Conceição"	"1987-07-19"	"INBIO"	66.22	
"1713       "	"Guilherme da Cunha"	"2000-12-02"	"INBIO"	73.259995	
"1714       "	"Davi Lucca Duarte"	"1974-09-25"	"INBIO"	60.829994	
"222BCC201ST"	"Gabriel de Araujo"	"2000-04-09"	"FACOM"	79.53001	
"221BSI255ST"	"Gabriela Pereira"	"2000-07-07"	"FACOM"	78.43	
"189BSI232ST"	"Gabriel Alves"	"2000-09-19"	"FACOM"	75.130005	
"205        "	"Joao Vitor Correia"	"2000-03-05"	"FAMAT"	77	
"12021BAV029"	"Aline Oliveira Araujo"	"2001-08-15"	"IARTE"	8.799999	
"12021BAV040"	"Andre Silva Martins"	"2000-09-03"	"IARTE"	7.7	
"12021BAV020"	"Lavinia Sousa Carvalho"	"2002-10-18"	"IARTE"	8.799999	
"424        "	"Pedro Tiene Silva"	"2003-05-22"	"ESTES"	70.18	
"444        "	"Jason Manmoa"	"1962-03-06"	"FAEDU"	74.25	
"446        "	"Naruto Uzumaki"	"1967-12-11"	"FAEDU"	64.90001	
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	82.83	"101        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	89.54	"104        "
"206        "	"Marina Silva Gomes"	"2002-08-17"	"FAMAT"	93.5	"203        "
"207        "	"Maria Julia Oliveira"	"1999-11-02"	"FAMAT"	99	"202        "
"208        "	"Vicente Araujo Mendes"	"1995-04-14"	"FAMAT"	88	"200        "
"1500       "	"Vinicius Ribeiro"	"1993-01-06"	"FOUFU"	100	"1500       "
"1502       "	"Bruno José"	"1900-01-06"	"FOUFU"	100	"1502       "
"1303       "	"Maria Ferreira"	"2000-02-02"	"FAMEV"	100	"1304       "
"309        "	"Marry Shelley"	"1999-08-30"	"INFIS"	100	"303        "
"2010       "	"Peter Benjamin Parker"	"1993-08-27"	"ICBIM"	100	"2008       "
"2012       "	"Lara Jean"	"2002-04-06"	"ICBIM"	100	"2005       "
"953        "	"Guilherme Duarte"	"1998-10-15"	"ESTES"	100	"904        "
"12021GEO004"	"Laura Rezende Teixeira Santos"	"2003-08-13"	"FACIP"	100	"503        "
"12021GEO005"	"Mariana Serrano Guimaraes"	"1998-01-06"	"FACIP"	100	"504        "
"420        "	"Victor Guilherme Oliveira Santos"	"1998-11-20"	"ESTES"	100	"400        "
"421        "	"Sara Pelegrineti de José"	"1974-01-01"	"ESTES"	100	"401        "
"1501       "	"César Bertolin"	"1993-01-06"	"FOUFU"	55	
"1503       "	"Elaine Maria"	"1989-01-06"	"FOUFU"	66	
"1504       "	"Carlos Silva"	"1993-01-06"	"FOUFU"	77	
"12021BAV001"	"Isabella Melo Sousa"	"2000-03-11"	"IARTE"	8.799999	
"12021BAV016"	"Jose Almeida Azevedo"	"2002-05-21"	"IARTE"	7.7	
"606        "	"Fernando Souza"	"1999-03-12"	"FADIR"	73.975	
"2011       "	"Peter Kavinsky"	"2003-08-03"	"ICBIM"	77	
"2014       "	"Veronica Lodge"	"1994-06-29"	"ICBIM"	66	
"1807       "	"Annelise Salem"	"2002-08-06"	"ICIAG"	22	
"1809       "	"Leandro Peres"	"2001-09-12"	"ICIAG"	66	
"1810       "	"Marina Barcelos"	"2002-10-14"	"ICIAG"	77	
"197        "	"Gabrel Toledo"	"1983-07-02"	"FACOM"	93.5	"102        "
"196        "	"Nicolas Paolinelli"	"1995-03-26"	"FACOM"	87.604	"100        "
"195        "	"Matheus Brasileiro Aguiar"	"1990-09-17"	"FACOM"	85.778	"104        "
"1300       "	"João Augusto Silva"	"2000-09-09"	"FAMEV"	88	
"1301       "	"Pedro Nunes"	"2001-12-09"	"FAMEV"	99	"1300       "
"1302       "	"Augusto Pereira"	"1999-01-28"	"FAMEV"	80.3	
"1304       "	"Ana Paula Freitas"	"2002-10-18"	"FAMEV"	97.9	
"605        "	"Elaine Ribeiro de Faria Paiva"	"1998-01-26"	"FADIR"	97.9	"603        "
"607        "	"Rafael Silva"	"2002-12-01"	"FADIR"	86.40501	"604        "
"608        "	"João Marcos Ramos"	"2001-05-12"	"FADIR"	96.69	"604        "
"609        "	"Marcos Estefam"	"2000-07-15"	"FADIR"	82.665	"604        "
"305        "	"Neil Gaiman"	"2000-11-10"	"INFIS"	99.55	"300        "
"306        "	"Robert Louis Stevenson"	"1999-11-13"	"INFIS"	93.5	"301        "
"307        "	"Anne Rice"	"2000-10-04"	"INFIS"	86.02	"302        "
"308        "	"Bram Stocker"	"2000-11-08"	"INFIS"	96.8	"302        "
"2013       "	"Percy Jackson"	"1993-08-18"	"ICBIM"	82.5	"2007       "
"1808       "	"Victor Bagliano"	"2000-07-14"	"ICIAG"	99.21999	
"950        "	"Gustavo Duarte Gomides"	"2002-12-12"	"ESTES"	94.05	"904        "
"951        "	"Rodrigo Alves da Silva"	"1990-05-20"	"ESTES"	82.71999	"900        "
"952        "	"Julia Echeverria"	"1999-09-05"	"ESTES"	99.880005	"902        "
"12021GEO001"	"Rafael Henrique Guimarães"	"2003-03-14"	"FACIP"	97.240005	"501        "
"12021GEO002"	"Felipe Langer"	"2000-04-01"	"FACIP"	95.369995	"501        "
"12021GEO003"	"Lucas Daniel Cunha"	"2002-12-28"	"FACIP"	92.619995	"502        "
"1712       "	"Ana Silveira"	"2003-07-22"	"INBIO"	88.990005	"1703       "
"221BSI251ST"	"Henrique Corrêa de Oliveira"	"2000-01-26"	"FACOM"	83.27	"10000000010"
"189BSI255ST"	"Luisa Gomes Ferreira"	"2000-02-07"	"FACOM"	86.130005	"10000000001"
"422        "	"Davi Rui Pasquim"	"2002-04-17"	"ESTES"	84.48	"402        "
"423        "	"Diego Ruas"	"1995-12-20"	"ESTES"	94.490005	"403        "
"445        "	"Scott Pilgrim"	"1964-04-04"	"FAEDU"	97.130005	"421        "
"447        "	"Frederico Krueger"	"1968-03-20"	"FAEDU"	86.34999	"423        "
"1406       "	"Cristiano Bueno de Almeida"	"2002-07-13"	"IFILO"	97.79	"1400       "
"1407       "	"Derli Luis Arantes Junior"	"2001-12-20"	"IFILO"	84.7	"1403       "
"1408       "	"Gladston Marcelo Pereira do Vale"	"2000-05-11"	"IFILO"	88.21999	"1403       "
"199        "	"Alexandre Borba Chiqueta"	"1999-05-14"	"FACOM"	88.638	"100        "
"198        "	"Flávio Fernandes"	"1998-08-02"	"FACOM"	91.31101	"100        "
"448        "	"Jason Thirtenn"	"1968-03-20"	"FAEDU"	100	"423        "
"1405       "	"Aline Ferreira Magalhaes"	"2000-06-04"	"IFILO"	77	
"1409       "	"Kamila Stephany Alves Santos"	"2005-07-30"	"IFILO"	72.59999	
*/

--e)
	UPDATE professor SET fac_prof= 'FAMAT' WHERE fac_prof = 'FACOM';
	UPDATE estudante SET fac_est= 'FAMAT' WHERE fac_est = 'FACOM';

--8)
--a)
	DELETE FROM pre_requisito;

--b)
	DELETE FROM sala WHERE capacidade < 90;
	SELECT capacidade FROM sala;
	--É apresentado erro, pois é violada a restrição de chave estrangeirada tabela turma.
	
--c)
	UPDATE disciplina SET fac_disc = 'FAMAT' WHERE fac_disc = 'FACOM';
	DELETE FROM faculdade WHERE sigla ='FACOM';
/*
"FADIR"	"Faculdade de Direito"	"3D   "	200000.00
"INFIS"	"Instituto de Física"	"1X   "	37500000.00
"ICBIM"	"Instituto de Ciências Biomédicas"	"2A   "	200000.00
"ICIAG"	"Instituto de Ciências Agrárias"	"2E   "	500000.00
"ESTES"	"Escola Técnica de Saúde"	"4K   "	1244416.00
"FACIP"	"Faculdade de Ciencias Integradas de Pontal"	"3K   "	1000000.00
"FAMEV"	"Faculdade de Medicina Veterinária"	"1BCG "	13000000.00
"INBIO"	"Instituto de Biologia"	"2D28 "	52413.09
"IFILO"	"Instituto de Filosofia"	"1U   "	8000000.00
"IARTE"	"Instituto de Artes"	"5S   "	1500000.00
"FAMAT"	"Faculdade de Matematica"	"1F   "	37500000.00
"FECIV"	"Faculdade de Engenharia Civil"	"1C   "	6000.90
"FEELT"	"Faculdade de Engenharia Elétrica"	"1E   "	370000.00
"FOUFU"	"Faculdade de Odontologia"	"UMU4L"	1200000.00
"FAEDU"	"Faculdade de Educação Física"	"1A   "	250500.50
"FAMEC"	"Faculdade de Engenharia Mecânica"	"1DCG "	0.50
*/

--10)
--a)
	SELECT sigla FROM faculdade WHERE predio = '1F' AND orcamento > 5000.00;
/*
"FAMAT"
*/
	
--b)
	SELECT * FROM estudante WHERE cra > 60 AND fac_est = 'FACOM';
/*
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	68.1	"102        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	81.4	"104        "
"221BSI251ST"	"Henrique Corrêa de Oliveira"	"2000-01-26"	"FACOM"	75.7	"10000000010"
"222BCC201ST"	"Gabriel de Araujo"	"2000-04-09"	"FACOM"	72.3	"10000000011"
"189BSI255ST"	"Luisa Gomes Ferreira"	"2000-02-07"	"FACOM"	78.3	"10000000001"
"221BSI255ST"	"Gabriela Pereira"	"2000-07-07"	"FACOM"	71.3	"10000000000"
"189BSI232ST"	"Gabriel Alves"	"2000-09-19"	"FACOM"	68.3	"10000000100"
"199        "	"Alexandre Borba Chiqueta"	"1999-05-14"	"FACOM"	80.58	"100        "
"198        "	"Flávio Fernandes"	"1998-08-02"	"FACOM"	83.01	"100        "
"197        "	"Gabrel Toledo"	"1983-07-02"	"FACOM"	85	"102        "
"196        "	"Nicolas Paolinelli"	"1995-03-26"	"FACOM"	79.64	"100        "
"195        "	"Matheus Brasileiro Aguiar"	"1990-09-17"	"FACOM"	77.98	"104        "
*/

--c)
	SELECT * FROM turma WHERE semestre = 2 AND cod_disc = 'GBC045';
/*
151	"67"	2	2022	"GBC045"		
*/

--d)
	SELECT datanasc,nome FROM estudante WHERE tutor IS NOT NULL AND cra > 80;
/*
"1999-08-03"	"Jorge Antônio Santos"
"2003-07-22"	"Ana Silveira"
"2002-08-17"	"Marina Silva Gomes"
"1999-11-02"	"Maria Julia Oliveira"
"1993-01-06"	"Vinicius Ribeiro"
"1900-01-06"	"Bruno José"
"1998-11-20"	"Victor Guilherme Oliveira Santos"
"1974-01-01"	"Sara Pelegrineti de José"
"1995-12-20"	"Diego Ruas"
"1964-04-04"	"Scott Pilgrim"
"1968-03-20"	"Jason Thirtenn"
"2002-07-13"	"Cristiano Bueno de Almeida"
"2000-05-11"	"Gladston Marcelo Pereira do Vale"
"1999-05-14"	"Alexandre Borba Chiqueta"
"1998-08-02"	"Flávio Fernandes"
"1983-07-02"	"Gabrel Toledo"
"2001-12-09"	"Pedro Nunes"
"2000-02-02"	"Maria Ferreira"
"1998-01-26"	"Elaine Ribeiro de Faria Paiva"
"2001-05-12"	"João Marcos Ramos"
"2000-11-10"	"Neil Gaiman"
"1999-11-13"	"Robert Louis Stevenson"
"2000-11-08"	"Bram Stocker"
"1999-08-30"	"Marry Shelley"
"1993-08-27"	"Peter Benjamin Parker"
"2002-04-06"	"Lara Jean"
"2002-12-12"	"Gustavo Duarte Gomides"
"1999-09-05"	"Julia Echeverria"
"1998-10-15"	"Guilherme Duarte"
"2003-03-14"	"Rafael Henrique Guimarães"
"2000-04-01"	"Felipe Langer"
"2002-12-28"	"Lucas Daniel Cunha"
"2003-08-13"	"Laura Rezende Teixeira Santos"
"1998-01-06"	"Mariana Serrano Guimaraes"
*/

--e)
	SELECT codigo, nome FROM disciplina WHERE codigo LIKE 'GBC%' AND ch/15 = 4;
/*
"GBC024"	"Algoritmo e Estrutura de Dados 2"
"GBC034"	"Programação Orientada a Objetos"
"GBC012"	"Lógica"
*/

--f)
	SELECT * FROM estudante WHERE tutor is NULL AND cra >= 60;
/*
"1711       "	"Luna da Conceição"	"1987-07-19"	"INBIO"	60.2	
"1300       "	"João Augusto Silva"	"2000-09-09"	"FAMEV"	80	
"1302       "	"Augusto Pereira"	"1999-01-28"	"FAMEV"	73	
"1304       "	"Ana Paula Freitas"	"2002-10-18"	"FAMEV"	89	
"1808       "	"Victor Bagliano"	"2000-07-14"	"ICIAG"	90.2	
"1809       "	"Leandro Peres"	"2001-09-12"	"ICIAG"	60	
"1810       "	"Marina Barcelos"	"2002-10-14"	"ICIAG"	70	
*/