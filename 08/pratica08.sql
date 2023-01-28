/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;


--11)
--a)
	SELECT disciplina.nome, faculdade.nome
	FROM disciplina,faculdade
    WHERE disciplina.fac_disc = faculdade.sigla;
				
/*
"Comportamento Motor "	"Faculdade de Educação Física"
"Programação Procedimental"	"Faculdade da Computação"
"Algoritmo e Estrutura de Dados 1"	"Faculdade da Computação"
"Algoritmo e Estrutura de Dados 2"	"Faculdade da Computação"
"Programação Orientada a Objetos"	"Faculdade da Computação"
"Lógica"	"Faculdade da Computação"
"Lógica para Programação"	"Faculdade da Computação"
"Cálculo 1"	"Faculdade da Computação"
"Arquitetura e Organização de Computadores"	"Faculdade da Computação"
"Bioquímica 1"	"Faculdade de Medicina Veterinária"
"Bioquímica 2"	"Faculdade de Medicina Veterinária"
"Fundamentos de Anatomia Veterinária"	"Faculdade de Medicina Veterinária"
"Anatomia dos Animais Domésticos"	"Faculdade de Medicina Veterinária"
"Citologia, Histologia e Embriologia"	"Faculdade de Medicina Veterinária"
"Filosofia Geral: Problemas Metafísicos"	"Instituto de Filosofia"
"História da Filosofia Medieval"	"Instituto de Filosofia"
"Ética"	"Instituto de Filosofia"
"Psicologia da Educação"	"Instituto de Filosofia"
"Didática Geral"	"Instituto de Filosofia"
"Etica II"	"Instituto de Filosofia"
"Didática Geral II"	"Instituto de Filosofia"
"Historia da Arte I"	"Instituto de Artes"
"Historia da Arte II"	"Instituto de Artes"
"Arte Contemporanea I"	"Instituto de Artes"
"Arte Contemporanea II"	"Instituto de Artes"
"Arte Computacional"	"Instituto de Artes"
"Avaliação de Impactos Ambiental para Biólogos"	"Instituto de Biologia"
"Biologia e Cultura - (PROINTER III)"	"Instituto de Biologia"
"Construção do Conhecimento Científico"	"Instituto de Biologia"
"Evolução"	"Instituto de Biologia"
"Profissão Biólogo"	"Instituto de Biologia"
"Teoria do Direito"	"Faculdade de Direito"
"Direito Digital"	"Faculdade de Direito"
"Direito do Trabalho 1"	"Faculdade de Direito"
"Direito do Trabalho 2"	"Faculdade de Direito"
"Direito Financeiro"	"Faculdade de Direito"
"Física Básica I"	"Instituto de Física"
"Física Básica II"	"Instituto de Física"
"Física Básica III"	"Instituto de Física"
"Geometrica Analítica"	"Instituto de Física"
"Algoritmos e Programação de Computadores"	"Instituto de Física"
"Analises Clinicas"	"Instituto de Ciências Biomédicas"
"Imunologia"	"Instituto de Ciências Biomédicas"
"Genetica"	"Instituto de Ciências Biomédicas"
"Microbiologia"	"Instituto de Ciências Biomédicas"
"Biossegurança"	"Instituto de Ciências Biomédicas"
"Construções Rurais"	"Instituto de Ciências Agrárias"
"Adubos e Adubação"	"Instituto de Ciências Agrárias"
"Manejo e Conservação do Solo e da Água"	"Instituto de Ciências Agrárias"
"Irrigação e Drenagem"	"Instituto de Ciências Agrárias"
"Agrometeorologia"	"Instituto de Ciências Agrárias"
"Fundamentos em Enfermagem"	"Escola Técnica de Saúde"
"Saúde Coletiva I"	"Escola Técnica de Saúde"
"Saúde Coletiva II"	"Escola Técnica de Saúde"
"Enfermagem Médica"	"Escola Técnica de Saúde"
"Psicologia e Ética"	"Escola Técnica de Saúde"
"Geologia 1"	"Faculdade de Ciencias Integradas de Pontal"
"Climatologia 1"	"Faculdade de Ciencias Integradas de Pontal"
"Teoria e método em Geografia"	"Faculdade de Ciencias Integradas de Pontal"
"Cartografia"	"Faculdade de Ciencias Integradas de Pontal"
"PIPE 1"	"Faculdade de Ciencias Integradas de Pontal"
"Geologia 2"	"Faculdade de Ciencias Integradas de Pontal"
"Climatologia 2"	"Faculdade de Ciencias Integradas de Pontal"
"Fundamentos de Matemática Elementar I"	"Faculdade de Matematica"
"Fundamentos de Matemática Elementar II"	"Faculdade de Matematica"
"Cálculo Diferencial e Integral I"	"Faculdade de Matematica"
"Cálculo Diferencial e Integral II"	"Faculdade de Matematica"
"Geometria Analitica"	"Faculdade de Matematica"
"Sistemas de Banco de Dados"	"Faculdade da Computação"
"Redes de computadores"	"Faculdade da Computação"
"Projeto e desenvolvimento 1"	"Faculdade da Computação"
"Engenharia de Software"	"Faculdade da Computação"
"Otimização"	"Faculdade da Computação"
"Unidade de Constituição do Organismo"	"Faculdade de Odontologia"
"Unidade de Funcionamento do Organismo I"	"Faculdade de Odontologia"
"Un. de Reabilitação Integral do Ap. Estomatognático I"	"Faculdade de Odontologia"
"Unidade de Investigação Científica I (UIC1)"	"Faculdade de Odontologia"
"Unidade de Saúde Humana I (USH1)"	"Faculdade de Odontologia"
"Metodologia do Ensino de Ciência"	"Escola Técnica de Saúde"
"Estágio Supervisionado I"	"Escola Técnica de Saúde"
"Construção do Discurso Escrito"	"Escola Técnica de Saúde"
"Metodologia do Ensino da Língua Portuguesa"	"Escola Técnica de Saúde"
"Filosofia da Educação"	"Escola Técnica de Saúde"
"Fisiologia do Exercício"	"Faculdade de Educação Física"
"Teoria e Prática do Treinamento I"	"Faculdade de Educação Física"
"Ritmo e Expressão"	"Faculdade de Educação Física"
"Teoria e Prática do Treinamento II"	"Faculdade de Educação Física"
*/

--b)
SELECT disciplina.nome, turma.id,turma.turma,turma.semestre,turma.ano,turma.cod_disc,turma.predio_s,turma.n_sala
	FROM disciplina,turma
	WHERE disciplina.codigo = turma.cod_disc;
/*
"Agrometeorologia"	1822	"06"	20232	2023	"1805  "	"2E   "	203
"Fundamentos em Enfermagem"	920	"1A"	1	2022	"ESTES1"	"4K   "	205
"Fundamentos em Enfermagem"	921	"1B"	1	2022	"ESTES1"	"4K   "	205
"Saúde Coletiva I"	922	"1A"	1	2022	"ESTES2"	"4K   "	206
"Saúde Coletiva II"	923	"1A"	1	2022	"ESTES3"	"4K   "	207
"Enfermagem Médica"	924	"1A"	2	2022	"ESTES4"	"4K   "	206
"Psicologia e Ética"	925	"1A"	2	2022	"ESTES5"	"4K   "	207
"Climatologia 1"	511	"33"	1	2022	"GGO002"	"3K   "	101
"Climatologia 2"	512	"33"	2	2022	"GGO012"	"3K   "	101
"Geologia 1"	513	"31"	1	2021	"GGO001"	"3K   "	102
"Geologia 2"	514	"31"	2	2021	"GGO011"	"3K   "	102
"Climatologia 2"	515	"29"	2	2020	"GGO012"	"3K   "	103
"Bioquímica 1"	1300	"A "	1	2022	"GMV003"	"1BCG "	101
"Bioquímica 2"	1301	"B "	1	2022	"GMV007"	"1BCG "	102
"Fundamentos de Anatomia Veterinária"	1302	"C "	1	2022	"GMV005"	"1BCG "	103
"Anatomia dos Animais Domésticos"	1303	"D "	1	2022	"GMV006"	"1BCG "	103
"Citologia, Histologia e Embriologia"	1304	"E "	1	2022	"GMV001"	"1BCG "	102
"Fundamentos de Anatomia Veterinária"	1305	"F "	1	2022	"GMV005"	"1BCG "	103
"Avaliação de Impactos Ambiental para Biólogos"	1720	"C "	1	2022	"31505 "	"8C   "	119
"Avaliação de Impactos Ambiental para Biólogos"	1721	"D "	1	2022	"31505 "	"8C   "	119
"Biologia e Cultura - (PROINTER III)"	1722	"C "	1	2022	"39030 "	"2D   "	13
"Construção do Conhecimento Científico"	1723	"C "	1	2022	"31104 "	"8C   "	121
"Evolução"	1724	"C "	1	2022	"31602 "	"8C   "	322
"Profissão Biólogo"	1725	"C "	1	2022	"31407 "	"8C   "	123
"Filosofia Geral: Problemas Metafísicos"	1417	"A "	1	2022	"1410  "	"1U   "	204
"História da Filosofia Medieval"	1418	"A "	1	2022	"1411  "	"5O-A "	206
"Ética"	1419	"A "	1	2022	"1412  "	"5O-A "	206
"Psicologia da Educação"	1420	"A "	2	2022	"1413  "	"5O-A "	207
"Didática Geral"	1421	"A "	2	2022	"1414  "	"1U   "	204
"Didática Geral"	1422	"B "	2	2022	"1414  "	"1U   "	204
"Historia da Arte I"	10	"55"	1	2015	"GAV001"	"5S   "	207
"Historia da Arte II"	20	"57"	2	2016	"GAV007"	"5S   "	205
"Arte Contemporanea I"	30	"59"	1	2017	"GAV013"	"5S   "	208
"Arte Contemporanea II"	40	"61"	2	2018	"GAV019"	"5S   "	207
"Arte Computacional"	50	"63"	1	2019	"GAV010"	"5S   "	205
"Fundamentos de Matemática Elementar I"	218	"A "	1	2018	"MAT201"	"1F   "	215
"Fundamentos de Matemática Elementar II"	219	"B "	2	2019	"MAT211"	"1F   "	216
"Cálculo Diferencial e Integral I"	220	"C "	3	2020	"MAT212"	"1F   "	217
"Cálculo Diferencial e Integral II"	221	"D "	4	2021	"MAT213"	"1F   "	215
"Geometria Analitica"	222	"E "	5	2022	"MAT214"	"1F   "	216
"Geometria Analitica"	223	"F "	6	2022	"MAT214"	"1F   "	216
"Sistemas de Banco de Dados"	1	"01"	1	2022	"GBC043"	"1BBSI"	127
"Sistemas de Banco de Dados"	2	"02"	2	2022	"GBC043"	"1BBSI"	127
"Redes de computadores"	3	"03"	2	2022	"GSI023"	"1BBSI"	128
"Projeto e desenvolvimento 1"	4	"04"	2	2022	"GSI034"	"1BBSI"	129
"Otimização"	5	"05"	2	2022	"GSI027"	"1BBSI"	128
"Unidade de Constituição do Organismo"	1500	"17"	12022	2022	"GOG001"	"UMU4L"	39
"Unidade de Constituição do Organismo"	1501	"17"	12021	2021	"GOG001"	"UMU4L"	39
"Unidade de Funcionamento do Organismo I"	1502	"18"	22021	2021	"GOG002"	"UMU3L"	38
"Un. de Reabilitação Integral do Ap. Estomatognático I"	1503	"19"	22022	2022	"GOG003"	"UMU4L"	39
"Unidade de Investigação Científica I (UIC1)"	1504	"20"	12023	2023	"GOG004"	"UMU1L"	37
"Metodologia do Ensino de Ciência"	430	"65"	2	2020	"410   "	"1G   "	101
"Metodologia do Ensino de Ciência"	431	"66"	1	2020	"410   "	"1G   "	101
"Estágio Supervisionado I"	432	"67"	2	2020	"411   "	"1G   "	102
"Construção do Discurso Escrito"	433	"68"	1	2021	"412   "	"1G   "	103
"Metodologia do Ensino da Língua Portuguesa"	434	"69"	2	2021	"413   "	"1G   "	104
"Fisiologia do Exercício"	400	"00"	2	1982	"GEDU31"	"1A   "	490
"Teoria e Prática do Treinamento I"	401	"01"	1	1983	"GEDU32"	"1A   "	490
"Ritmo e Expressão"	402	"02"	2	1983	"GEDU41"	"1A   "	491
"Teoria e Prática do Treinamento II"	403	"03"	2	1990	"GEDU42"	"1A   "	491
"Comportamento Motor "	404	"04"	2	1995	"GEDU43"	"1A   "	492
"Comportamento Motor "	405	"05"	2	1995	"GEDU43"	"1A   "	492
"Programação Orientada a Objetos"	155	"63"	2	2020	"GBC034"	"1B   "	204
"Programação Orientada a Objetos"	154	"64"	1	2021	"GBC034"	"1B   "	203
"Algoritmo e Estrutura de Dados 2"	153	"65"	2	2021	"GBC024"	"5R   "	103
"Algoritmo e Estrutura de Dados 1"	152	"66"	1	2022	"GBC023"	"5R   "	103
"Programação Procedimental"	151	"67"	2	2022	"GBC045"		
"Teoria do Direito"	650	"D1"	2	2022	"FADIR3"	"3D   "	102
"Direito Digital"	651	"D1"	2	2020	"FADIR4"	"3D   "	104
"Direito do Trabalho 1"	652	"D2"	1	2021	"FADIR5"	"3D   "	104
"Direito do Trabalho 2"	653	"D3"	2	2022	"FADIR6"		
"Direito do Trabalho 2"	654	"D4"	1	2022	"FADIR6"		
"Física Básica I"	315	"A1"	2	2020	"310   "	"1X   "	2
"Física Básica I"	316	"A2"	2	2020	"310   "	"1X   "	2
"Física Básica II"	317	"B1"	3	2020	"311   "	"1X   "	3
"Física Básica III"	318	"C1"	4	2021	"312   "	"1X   "	1
"Geometrica Analítica"	319	"D1"	1	2021	"313   "	"1X   "	1
"Algoritmos e Programação de Computadores"	320	"E1"	4	2021	"314   "	"1X   "	1
"Analises Clinicas"	2015	"A "	1	2022	"2000  "	"2A   "	1
"Imunologia"	2016	"B "	1	2022	"2001  "	"2A   "	2
"Genetica"	2017	"C "	1	2022	"2002  "	"2A   "	3
"Microbiologia"	2018	"D "	1	2022	"2003  "	"2A   "	4
"Biossegurança"	2019	"E "	1	2022	"2004  "	"2A   "	5
"Biossegurança"	2020	"F "	1	2022	"2004  "	"2A   "	6
"Construções Rurais"	1817	"01"	20211	2021	"1801  "	"2E   "	201
"Construções Rurais"	1818	"02"	20212	2021	"1801  "	"2E   "	201
"Manejo e Conservação do Solo e da Água"	1819	"03"	20221	2022	"1803  "	"2E   "	201
"Irrigação e Drenagem"	1820	"04"	20222	2022	"1804  "	"2E   "	202
"Adubos e Adubação"	1821	"05"	20231	2023	"1802  "	"2E   "	202
*/

--c)
SELECT estudante.nome,professor.nome
	FROM estudante,professor
	WHERE estudante.tutor = professor.id;
	
/*
"Pedro Henrique Silva"	"Marcelo Keese Albertini"
"Gabriel Borges Júnior"	"Rivalino Matias Júnior"
"Amanda Gomes de Oliveira"	"André Backes"
"Jorge Antônio Santos"	"Bruno Augusto Nassif Travençolo"
"Bruna Tobias Pinto"	"Luiz Gustavo Almeida Martins"
"Jonas Caravalho"	"Ailton Gonçalves Rodrigues Junior"
"Ana Silveira"	"Jeamylle Nilin Gonçalves"
"Guilherme da Cunha"	"Ariádine Cristine de Almeida"
"Davi Lucca Duarte"	"Ailton Gonçalves Rodrigues Junior"
"Henrique Corrêa de Oliveira"	"Alexsandro Soares"
"Gabriel de Araujo"	"Pedro Frosi"
"Luisa Gomes Ferreira"	"Elaine Ribeiro"
"Gabriela Pereira"	"Jean Ponciano"
"Gabriel Alves"	"Marcia Aparecida Fernandes"
"Joao Vitor Correia"	"Taciana Oliveira Souza"
"Marina Silva Gomes"	"Fernando Rodrigo Rafaeli"
"Maria Julia Oliveira"	"Camila Mariana Ruiz"
"Vicente Araujo Mendes"	"Admilson Lopes dos Santos"
"Alexandre Oliveira Rodrigues"	"Adriana Rodrigues da Silva"
"Vinicius Ribeiro"	"Adriano Mota Loyola"
"César Bertolin"	"Alessandra Maia de Castro Prado"
"Bruno José"	"Álex Moreira Herval"
"Elaine Maria"	"Ana Paula Turrioni Hidalgo"
"Carlos Silva"	"Ana Paula de Lima Oliveira"
"Isabella Melo Sousa"	"Belchior de Sousa"
"Jose Almeida Azevedo"	"Elsieni Coelho da Silva"
"Aline Oliveira Araujo"	"Belchior de Sousa"
"Andre Silva Martins"	"Gastao da Cunha Frota"
"Lavinia Sousa Carvalho"	"Belchior de Sousa"
"Victor Guilherme Oliveira Santos"	"Adriana Pastorello Buim Arena"
"Sara Pelegrineti de José"	"Aldeci Cacique Calixto"
"Davi Rui Pasquim"	"Aléxia Pádua Franco"
"Diego Ruas"	"Ana Beatriz da Silva Duarte"
"Pedro Tiene Silva"	"Andrea Maturano Longarezi"
"Jason Manmoa"	"Jailson Mendes"
"Scott Pilgrim"	"Gabriel Jesus"
"Naruto Uzumaki"	"Gabriel Jesus"
"Frederico Krueger"	"João Guilherme"
"Jason Thirtenn"	"João Guilherme"
"Aline Ferreira Magalhaes"	"Alcino Eduardo Bonella"
"Cristiano Bueno de Almeida"	"Alcino Eduardo Bonella"
"Derli Luis Arantes Junior"	"Anselmo Tadeu Ferreira"
"Gladston Marcelo Pereira do Vale"	"Anselmo Tadeu Ferreira"
"Kamila Stephany Alves Santos"	"Ana Maria Said"
"Alexandre Borba Chiqueta"	"Gina Maira"
"Flávio Fernandes"	"Gina Maira"
"Gabrel Toledo"	"Rivalino Matias Júnior"
"Nicolas Paolinelli"	"Gina Maira"
"Matheus Brasileiro Aguiar"	"Bruno Augusto Nassif Travençolo"
"Pedro Nunes"	"Kelly Aparecida Geraldo Yoneyama Tudini"
"Maria Ferreira"	"Neide Maria da Silva "
"Elaine Ribeiro de Faria Paiva"	"Daniela de Melo Crosara"
"Fernando Souza"	"Daniela de Melo Crosara"
"Rafael Silva"	"Fernando Rodrigues Martins"
"João Marcos Ramos"	"Fernando Rodrigues Martins"
"Marcos Estefam"	"Fernando Rodrigues Martins"
"Neil Gaiman"	"Ademir Cavalheiro"
"Robert Louis Stevenson"	"Adevailton Bernardo dos Santos"
"Anne Rice"	"Alessandra Riposati Arantes"
"Bram Stocker"	"Alessandra Riposati Arantes"
"Marry Shelley"	"Djalmir Nestor Messias"
"Peter Benjamin Parker"	"Disney Oliver"
"Peter Kavinsky"	"Henrique Tomaz Gonzaga"
"Lara Jean"	"Alberto da Silva Morais"
"Percy Jackson"	"Daniela Cristina de Oliveira"
"Veronica Lodge"	"Carlos Hernrique Gomes"
"Annelise Salem"	"Jamil Salem"
"Gabriel Hugo Borges"	"Julia Vingadora"
"Gustavo Duarte Gomides"	"Tatiana Carneiro de Resende"
"Rodrigo Alves da Silva"	"Lilian Rodrigues Sant’ Anna Campos"
"Julia Echeverria"	"Marisa Aparecida Elias"
"Guilherme Duarte"	"Tatiana Carneiro de Resende"
"Rodrigo da Silva"	"Lilian Rodrigues Sant’ Anna Campos"
"Rafael Henrique Guimarães"	"Alex Fernando Borges"
"Felipe Langer"	"Alex Fernando Borges"
"Lucas Daniel Cunha"	"Alexandre Alves Alvenha"
"Laura Rezende Teixeira Santos"	"Alexandre Cacheffo"
"Mariana Serrano Guimaraes"	"Alexandre Calzavara Yoshida"
*/

--d)
SELECT disciplina.nome,turma.semestre,turma.ano
	FROM disciplina,turma
    WHERE disciplina.codigo = turma.cod_disc
	AND turma.semestre = 2
  	AND turma.ano=2022;
/*
"Programação Procedimental"
"Psicologia da Educação"
"Didática Geral"
"Didática Geral"
"Teoria do Direito"
"Direito do Trabalho 2"
"Enfermagem Médica"
"Psicologia e Ética"
"Climatologia 2"
"Sistemas de Banco de Dados"
"Redes de computadores"
"Projeto e desenvolvimento 1"
"Otimização"
*/

--e)
SELECT disciplina.nome, pre_requisito.cod_pre
	FROM disciplina,pre_requisito
	WHERE disciplina.codigo = pre_requisito.cod_disc;
	
/*
"Comportamento Motor "	"GEDU31"
"Algoritmo e Estrutura de Dados 1"	"GBC045"
"Algoritmo e Estrutura de Dados 2"	"GBC023"
"Bioquímica 2"	"GMV003"
"Anatomia dos Animais Domésticos"	"GMV005"
"Etica II"	"1412  "
"Didática Geral II"	"1414  "
"Historia da Arte II"	"GAV001"
"Arte Contemporanea II"	"GAV013"
"Direito Digital"	"FADIR3"
"Direito do Trabalho 2"	"FADIR5"
"Física Básica II"	"310   "
"Física Básica III"	"311   "
"Imunologia"	"2000  "
"Microbiologia"	"2002  "
"Agrometeorologia"	"1803  "
"Agrometeorologia"	"1804  "
"Saúde Coletiva II"	"ESTES2"
"Enfermagem Médica"	"ESTES1"
"Geologia 2"	"GGO001"
"Climatologia 2"	"GGO002"
"Fundamentos de Matemática Elementar II"	"MAT201"
"Cálculo Diferencial e Integral II"	"MAT212"
"Projeto e desenvolvimento 1"	"GBC043"
"Unidade de Saúde Humana I (USH1)"	"GOG001"
"Teoria e Prática do Treinamento II"	"GEDU32"
*/

--f)
SELECT disciplina.nome, pre_requisito.cod_disc
	FROM disciplina,pre_requisito
	WHERE disciplina.codigo = pre_requisito.cod_pre;

/*
"Programação Procedimental"	"GBC023"
"Algoritmo e Estrutura de Dados 1"	"GBC024"
"Bioquímica 1"	"GMV007"
"Fundamentos de Anatomia Veterinária"	"GMV006"
"Ética"	"1415  "
"Didática Geral"	"1416  "
"Historia da Arte I"	"GAV007"
"Arte Contemporanea I"	"GAV019"
"Teoria do Direito"	"FADIR4"
"Direito do Trabalho 1"	"FADIR6"
"Física Básica I"	"311   "
"Física Básica II"	"312   "
"Analises Clinicas"	"2001  "
"Genetica"	"2003  "
"Manejo e Conservação do Solo e da Água"	"1805  "
"Irrigação e Drenagem"	"1805  "
"Fundamentos em Enfermagem"	"ESTES4"
"Saúde Coletiva I"	"ESTES3"
"Geologia 1"	"GGO011"
"Climatologia 1"	"GGO012"
"Fundamentos de Matemática Elementar I"	"MAT211"
"Cálculo Diferencial e Integral I"	"MAT213"
"Sistemas de Banco de Dados"	"GSI034"
"Unidade de Constituição do Organismo"	"GOG005"
"Fisiologia do Exercício"	"GEDU43"
"Teoria e Prática do Treinamento I"	"GEDU42"
*/


--12)
--a)
	SELECT professor.nome as nome_prof,
	disciplina.nome as nome_disc
	FROM professor, ensina, turma, disciplina WHERE 
	ensina.id_turma = turma.id AND
	disciplina.codigo = turma.cod_disc AND
	professor.id = ensina.id_prof;
/*
"Gina Maira"	"Programação Orientada a Objetos"
"Marcelo Keese Albertini"	"Programação Procedimental"
"Rivalino Matias Júnior"	"Programação Orientada a Objetos"
"André Backes"	"Algoritmo e Estrutura de Dados 1"
"Bruno Augusto Nassif Travençolo"	"Algoritmo e Estrutura de Dados 2"
"Alexandre Garrido da Silva"	"Teoria do Direito"
"Alexandre Garrido da Silva"	"Direito Digital"
"Beatriz Corrêa Camargo"	"Teoria do Direito"
"Beatriz Corrêa Camargo"	"Direito do Trabalho 1"
"Daniela de Melo Crosara"	"Direito do Trabalho 2"
"Daniela de Melo Crosara"	"Direito do Trabalho 1"
"Daniela de Melo Crosara"	"Direito do Trabalho 2"
"Fernando Rodrigues Martins"	"Direito do Trabalho 1"
"Fernando Rodrigues Martins"	"Direito do Trabalho 2"
"Fernando Rodrigues Martins"	"Direito do Trabalho 2"
"Gustavo de Carvalho Marin"	"Direito Digital"
"Gustavo de Carvalho Marin"	"Direito do Trabalho 1"
"Gustavo de Carvalho Marin"	"Direito do Trabalho 2"
"Ademir Cavalheiro"	"Física Básica I"
"Ademir Cavalheiro"	"Física Básica II"
"Adevailton Bernardo dos Santos"	"Física Básica I"
"Alessandra Riposati Arantes"	"Física Básica III"
"Djalmir Nestor Messias"	"Geometrica Analítica"
"Marcel Novaes"	"Algoritmos e Programação de Computadores"
"Alberto da Silva Morais"	"Analises Clinicas"
"Carlos Hernrique Gomes"	"Imunologia"
"Daniela Cristina de Oliveira"	"Genetica"
"Disney Oliver"	"Microbiologia"
"Henrique Tomaz Gonzaga"	"Biossegurança"
"Jamil Salem"	"Construções Rurais"
"Jamil Salem"	"Construções Rurais"
"Julia Vingadora"	"Manejo e Conservação do Solo e da Água"
"Roberto Carlos"	"Irrigação e Drenagem"
"Cláudio Assembly"	"Adubos e Adubação"
"Elaine Java"	"Agrometeorologia"
"Lilian Rodrigues Sant’ Anna Campos"	"Fundamentos em Enfermagem"
"Clelia Regina Cafer"	"Fundamentos em Enfermagem"
"Marisa Aparecida Elias"	"Saúde Coletiva I"
"Marisa Aparecida Elias"	"Saúde Coletiva II"
"Barbara Dias Rezende Gontijo"	"Enfermagem Médica"
"Tatiana Carneiro de Resende"	"Psicologia e Ética"
"Alessandro Gomes Enoque"	"Climatologia 1"
"Alex Fernando Borges"	"Climatologia 2"
"Alexandre Alves Alvenha"	"Geologia 1"
"Alexandre Cacheffo"	"Geologia 2"
"Alexandre Calzavara Yoshida"	"Climatologia 2"
"Kelly Aparecida Geraldo Yoneyama Tudini"	"Bioquímica 1"
"Lucas de Assis Ribeiro"	"Bioquímica 1"
"Natália Mundim Tôrres"	"Bioquímica 2"
"Tiago Wilson Patriarca Mineo "	"Fundamentos de Anatomia Veterinária"
"Neide Maria da Silva "	"Bioquímica 1"
"Ailton Gonçalves Rodrigues Junior"	"Avaliação de Impactos Ambiental para Biólogos"
"Ariádine Cristine de Almeida"	"Biologia e Cultura - (PROINTER III)"
"Ariádine Cristine de Almeida"	"Construção do Conhecimento Científico"
"Cassiano Aimberê Dorneles Welker"	"Profissão Biólogo"
"Giuliano Buzá Jacobucci"	"Avaliação de Impactos Ambiental para Biólogos"
"Alcino Eduardo Bonella"	"Filosofia Geral: Problemas Metafísicos"
"Alexandre Guimarães Tadeu de Soares"	"Ética"
"Ana Maria Said"	"Filosofia Geral: Problemas Metafísicos"
"Anselmo Tadeu Ferreira"	"História da Filosofia Medieval"
"Dennys Garcia Xavier"	"Ética"
"Belchior de Sousa"	"Historia da Arte I"
"Elsieni Coelho da Silva"	"Historia da Arte II"
"Gastao da Cunha Frota"	"Arte Contemporanea I"
"Elsieni Coelho da Silva"	"Arte Contemporanea II"
"Renato Palumbo Doria"	"Arte Computacional"
"Admilson Lopes dos Santos"	"Fundamentos de Matemática Elementar I"
"Adriana Rodrigues da Silva"	"Fundamentos de Matemática Elementar II"
"Camila Mariana Ruiz"	"Cálculo Diferencial e Integral I"
"Fernando Rodrigo Rafaeli"	"Cálculo Diferencial e Integral II"
"Taciana Oliveira Souza"	"Geometria Analitica"
"Taciana Oliveira Souza"	"Geometria Analitica"
"Jean Ponciano"	"Sistemas de Banco de Dados"
"Elaine Ribeiro"	"Redes de computadores"
"Alexsandro Soares"	"Projeto e desenvolvimento 1"
"Pedro Frosi"	"Otimização"
"Marcia Aparecida Fernandes"	"Redes de computadores"
"Adriano Mota Loyola"	"Unidade de Constituição do Organismo"
"Alessandra Maia de Castro Prado"	"Unidade de Constituição do Organismo"
"Adriana Pastorello Buim Arena"	"Metodologia do Ensino de Ciência"
"Aldeci Cacique Calixto"	"Metodologia do Ensino de Ciência"
"Aléxia Pádua Franco"	"Estágio Supervisionado I"
"Ana Beatriz da Silva Duarte"	"Construção do Discurso Escrito"
"Andrea Maturano Longarezi"	"Metodologia do Ensino da Língua Portuguesa"
"Jailson Mendes"	"Fisiologia do Exercício"
"Gabriel Jesus"	"Teoria e Prática do Treinamento I"
"Luciano Hulk"	"Ritmo e Expressão"
"João Guilherme"	"Teoria e Prática do Treinamento II"
"Péricles Mendes"	"Comportamento Motor "
*/
	
--b)
	SELECT professor.nome as nome_prof,
	disciplina.nome as nome_disc
	FROM professor, disciplina, turma, ensina
	WHERE ano = 2022 AND
	semestre = 2 AND
	ensina.id_turma = turma.id AND
	ensina.id_prof = professor.id AND
	turma.cod_disc = disciplina.codigo;

/*
"Marcelo Keese Albertini"	"Programação Procedimental"
"Beatriz Corrêa Camargo"	"Teoria do Direito"
"Alexandre Garrido da Silva"	"Teoria do Direito"
"Fernando Rodrigues Martins"	"Direito do Trabalho 2"
"Daniela de Melo Crosara"	"Direito do Trabalho 2"
"Barbara Dias Rezende Gontijo"	"Enfermagem Médica"
"Tatiana Carneiro de Resende"	"Psicologia e Ética"
"Alex Fernando Borges"	"Climatologia 2"
"Jean Ponciano"	"Sistemas de Banco de Dados"
"Marcia Aparecida Fernandes"	"Redes de computadores"
"Elaine Ribeiro"	"Redes de computadores"
"Alexsandro Soares"	"Projeto e desenvolvimento 1"
"Pedro Frosi"	"Otimização"
*/

--c)
	SELECT disciplina.nome as nome_disc
	FROM disciplina, turma, sala
	WHERE capacidade > 10 AND
	disciplina.codigo = turma.cod_disc AND
	turma.predio_s = sala.predio AND
	turma.n_sala = sala.numero;
	
/*
"Comportamento Motor "
"Comportamento Motor "
"Algoritmo e Estrutura de Dados 1"
"Algoritmo e Estrutura de Dados 2"
"Programação Orientada a Objetos"
"Programação Orientada a Objetos"
"Bioquímica 1"
"Bioquímica 2"
"Fundamentos de Anatomia Veterinária"
"Fundamentos de Anatomia Veterinária"
"Anatomia dos Animais Domésticos"
"Citologia, Histologia e Embriologia"
"Filosofia Geral: Problemas Metafísicos"
"História da Filosofia Medieval"
"Ética"
"Psicologia da Educação"
"Didática Geral"
"Didática Geral"
"Historia da Arte I"
"Historia da Arte II"
"Arte Contemporanea I"
"Arte Contemporanea II"
"Arte Computacional"
"Avaliação de Impactos Ambiental para Biólogos"
"Avaliação de Impactos Ambiental para Biólogos"
"Biologia e Cultura - (PROINTER III)"
"Construção do Conhecimento Científico"
"Evolução"
"Profissão Biólogo"
"Teoria do Direito"
"Direito Digital"
"Direito do Trabalho 1"
"Física Básica I"
"Física Básica I"
"Física Básica II"
"Física Básica III"
"Geometrica Analítica"
"Algoritmos e Programação de Computadores"
"Analises Clinicas"
"Imunologia"
"Genetica"
"Microbiologia"
"Biossegurança"
"Biossegurança"
"Construções Rurais"
"Construções Rurais"
"Adubos e Adubação"
"Manejo e Conservação do Solo e da Água"
"Irrigação e Drenagem"
"Agrometeorologia"
"Fundamentos em Enfermagem"
"Fundamentos em Enfermagem"
"Saúde Coletiva I"
"Saúde Coletiva II"
"Enfermagem Médica"
"Psicologia e Ética"
"Geologia 1"
"Climatologia 1"
"Geologia 2"
"Climatologia 2"
"Climatologia 2"
"Fundamentos de Matemática Elementar I"
"Fundamentos de Matemática Elementar II"
"Cálculo Diferencial e Integral I"
"Cálculo Diferencial e Integral II"
"Geometria Analitica"
"Geometria Analitica"
"Sistemas de Banco de Dados"
"Sistemas de Banco de Dados"
"Redes de computadores"
"Projeto e desenvolvimento 1"
"Otimização"
"Unidade de Constituição do Organismo"
"Unidade de Constituição do Organismo"
"Unidade de Funcionamento do Organismo I"
"Un. de Reabilitação Integral do Ap. Estomatognático I"
"Unidade de Investigação Científica I (UIC1)"
"Metodologia do Ensino de Ciência"
"Metodologia do Ensino de Ciência"
"Estágio Supervisionado I"
"Construção do Discurso Escrito"
"Metodologia do Ensino da Língua Portuguesa"
"Fisiologia do Exercício"
"Teoria e Prática do Treinamento I"
"Ritmo e Expressão"
"Teoria e Prática do Treinamento II"
*/

--d)
	SELECT estudante.nome as nome_est,
	fac_est,
	tutor as prof_tutor
	FROM professor, estudante, faculdade 
	WHERE estudante.fac_est = faculdade.sigla AND
	estudante.tutor = professor.id;
/*
"Pedro Henrique Silva"	"FACOM"	"101        "
"Gabriel Borges Júnior"	"FACOM"	"102        "
"Amanda Gomes de Oliveira"	"FACOM"	"103        "
"Jorge Antônio Santos"	"FACOM"	"104        "
"Bruna Tobias Pinto"	"FACOM"	"105        "
"Jonas Caravalho"	"INBIO"	"1700       "
"Ana Silveira"	"INBIO"	"1703       "
"Guilherme da Cunha"	"INBIO"	"1701       "
"Davi Lucca Duarte"	"INBIO"	"1700       "
"Henrique Corrêa de Oliveira"	"FACOM"	"10000000010"
"Gabriel de Araujo"	"FACOM"	"10000000011"
"Luisa Gomes Ferreira"	"FACOM"	"10000000001"
"Gabriela Pereira"	"FACOM"	"10000000000"
"Gabriel Alves"	"FACOM"	"10000000100"
"Joao Vitor Correia"	"FAMAT"	"204        "
"Marina Silva Gomes"	"FAMAT"	"203        "
"Maria Julia Oliveira"	"FAMAT"	"202        "
"Vicente Araujo Mendes"	"FAMAT"	"200        "
"Alexandre Oliveira Rodrigues"	"FAMAT"	"201        "
"Vinicius Ribeiro"	"FOUFU"	"1500       "
"César Bertolin"	"FOUFU"	"1501       "
"Bruno José"	"FOUFU"	"1502       "
"Elaine Maria"	"FOUFU"	"1503       "
"Carlos Silva"	"FOUFU"	"1504       "
"Isabella Melo Sousa"	"IARTE"	"1600       "
"Jose Almeida Azevedo"	"IARTE"	"1605       "
"Aline Oliveira Araujo"	"IARTE"	"1600       "
"Andre Silva Martins"	"IARTE"	"1610       "
"Lavinia Sousa Carvalho"	"IARTE"	"1600       "
"Victor Guilherme Oliveira Santos"	"ESTES"	"400        "
"Sara Pelegrineti de José"	"ESTES"	"401        "
"Davi Rui Pasquim"	"ESTES"	"402        "
"Diego Ruas"	"ESTES"	"403        "
"Pedro Tiene Silva"	"ESTES"	"404        "
"Jason Manmoa"	"FAEDU"	"420        "
"Scott Pilgrim"	"FAEDU"	"421        "
"Naruto Uzumaki"	"FAEDU"	"421        "
"Frederico Krueger"	"FAEDU"	"423        "
"Jason Thirtenn"	"FAEDU"	"423        "
"Aline Ferreira Magalhaes"	"IFILO"	"1400       "
"Cristiano Bueno de Almeida"	"IFILO"	"1400       "
"Derli Luis Arantes Junior"	"IFILO"	"1403       "
"Gladston Marcelo Pereira do Vale"	"IFILO"	"1403       "
"Kamila Stephany Alves Santos"	"IFILO"	"1402       "
"Alexandre Borba Chiqueta"	"FACOM"	"100        "
"Flávio Fernandes"	"FACOM"	"100        "
"Gabrel Toledo"	"FACOM"	"102        "
"Nicolas Paolinelli"	"FACOM"	"100        "
"Matheus Brasileiro Aguiar"	"FACOM"	"104        "
"Pedro Nunes"	"FAMEV"	"1300       "
"Maria Ferreira"	"FAMEV"	"1304       "
"Elaine Ribeiro de Faria Paiva"	"FADIR"	"603        "
"Fernando Souza"	"FADIR"	"603        "
"Rafael Silva"	"FADIR"	"604        "
"João Marcos Ramos"	"FADIR"	"604        "
"Marcos Estefam"	"FADIR"	"604        "
"Neil Gaiman"	"INFIS"	"300        "
"Robert Louis Stevenson"	"INFIS"	"301        "
"Anne Rice"	"INFIS"	"302        "
"Bram Stocker"	"INFIS"	"302        "
"Marry Shelley"	"INFIS"	"303        "
"Peter Benjamin Parker"	"ICBIM"	"2008       "
"Peter Kavinsky"	"ICBIM"	"2009       "
"Lara Jean"	"ICBIM"	"2005       "
"Percy Jackson"	"ICBIM"	"2007       "
"Veronica Lodge"	"ICBIM"	"2006       "
"Annelise Salem"	"ICIAG"	"1812       "
"Gabriel Hugo Borges"	"ICIAG"	"1813       "
"Gustavo Duarte Gomides"	"ESTES"	"904        "
"Rodrigo Alves da Silva"	"ESTES"	"900        "
"Julia Echeverria"	"ESTES"	"902        "
"Guilherme Duarte"	"ESTES"	"904        "
"Rodrigo da Silva"	"ESTES"	"900        "
"Rafael Henrique Guimarães"	"FACIP"	"501        "
"Felipe Langer"	"FACIP"	"501        "
"Lucas Daniel Cunha"	"FACIP"	"502        "
"Laura Rezende Teixeira Santos"	"FACIP"	"503        "
"Mariana Serrano Guimaraes"	"FACIP"	"504        "
*/


--13)
--a)
SELECT disciplina.nome, faculdade.nome
	FROM disciplina
	INNER JOIN faculdade
    ON disciplina.fac_disc = faculdade.sigla;
/*
"Comportamento Motor "	"Faculdade de Educação Física"
"Programação Procedimental"	"Faculdade da Computação"
"Algoritmo e Estrutura de Dados 1"	"Faculdade da Computação"
"Algoritmo e Estrutura de Dados 2"	"Faculdade da Computação"
"Programação Orientada a Objetos"	"Faculdade da Computação"
"Lógica"	"Faculdade da Computação"
"Lógica para Programação"	"Faculdade da Computação"
"Cálculo 1"	"Faculdade da Computação"
"Arquitetura e Organização de Computadores"	"Faculdade da Computação"
"Bioquímica 1"	"Faculdade de Medicina Veterinária"
"Bioquímica 2"	"Faculdade de Medicina Veterinária"
"Fundamentos de Anatomia Veterinária"	"Faculdade de Medicina Veterinária"
"Anatomia dos Animais Domésticos"	"Faculdade de Medicina Veterinária"
"Citologia, Histologia e Embriologia"	"Faculdade de Medicina Veterinária"
"Filosofia Geral: Problemas Metafísicos"	"Instituto de Filosofia"
"História da Filosofia Medieval"	"Instituto de Filosofia"
"Ética"	"Instituto de Filosofia"
"Psicologia da Educação"	"Instituto de Filosofia"
"Didática Geral"	"Instituto de Filosofia"
"Etica II"	"Instituto de Filosofia"
"Didática Geral II"	"Instituto de Filosofia"
"Historia da Arte I"	"Instituto de Artes"
"Historia da Arte II"	"Instituto de Artes"
"Arte Contemporanea I"	"Instituto de Artes"
"Arte Contemporanea II"	"Instituto de Artes"
"Arte Computacional"	"Instituto de Artes"
"Avaliação de Impactos Ambiental para Biólogos"	"Instituto de Biologia"
"Biologia e Cultura - (PROINTER III)"	"Instituto de Biologia"
"Construção do Conhecimento Científico"	"Instituto de Biologia"
"Evolução"	"Instituto de Biologia"
"Profissão Biólogo"	"Instituto de Biologia"
"Teoria do Direito"	"Faculdade de Direito"
"Direito Digital"	"Faculdade de Direito"
"Direito do Trabalho 1"	"Faculdade de Direito"
"Direito do Trabalho 2"	"Faculdade de Direito"
"Direito Financeiro"	"Faculdade de Direito"
"Física Básica I"	"Instituto de Física"
"Física Básica II"	"Instituto de Física"
"Física Básica III"	"Instituto de Física"
"Geometrica Analítica"	"Instituto de Física"
"Algoritmos e Programação de Computadores"	"Instituto de Física"
"Analises Clinicas"	"Instituto de Ciências Biomédicas"
"Imunologia"	"Instituto de Ciências Biomédicas"
"Genetica"	"Instituto de Ciências Biomédicas"
"Microbiologia"	"Instituto de Ciências Biomédicas"
"Biossegurança"	"Instituto de Ciências Biomédicas"
"Construções Rurais"	"Instituto de Ciências Agrárias"
"Adubos e Adubação"	"Instituto de Ciências Agrárias"
"Manejo e Conservação do Solo e da Água"	"Instituto de Ciências Agrárias"
"Irrigação e Drenagem"	"Instituto de Ciências Agrárias"
"Agrometeorologia"	"Instituto de Ciências Agrárias"
"Fundamentos em Enfermagem"	"Escola Técnica de Saúde"
"Saúde Coletiva I"	"Escola Técnica de Saúde"
"Saúde Coletiva II"	"Escola Técnica de Saúde"
"Enfermagem Médica"	"Escola Técnica de Saúde"
"Psicologia e Ética"	"Escola Técnica de Saúde"
"Geologia 1"	"Faculdade de Ciencias Integradas de Pontal"
"Climatologia 1"	"Faculdade de Ciencias Integradas de Pontal"
"Teoria e método em Geografia"	"Faculdade de Ciencias Integradas de Pontal"
"Cartografia"	"Faculdade de Ciencias Integradas de Pontal"
"PIPE 1"	"Faculdade de Ciencias Integradas de Pontal"
"Geologia 2"	"Faculdade de Ciencias Integradas de Pontal"
"Climatologia 2"	"Faculdade de Ciencias Integradas de Pontal"
"Fundamentos de Matemática Elementar I"	"Faculdade de Matematica"
"Fundamentos de Matemática Elementar II"	"Faculdade de Matematica"
"Cálculo Diferencial e Integral I"	"Faculdade de Matematica"
"Cálculo Diferencial e Integral II"	"Faculdade de Matematica"
"Geometria Analitica"	"Faculdade de Matematica"
"Sistemas de Banco de Dados"	"Faculdade da Computação"
"Redes de computadores"	"Faculdade da Computação"
"Projeto e desenvolvimento 1"	"Faculdade da Computação"
"Engenharia de Software"	"Faculdade da Computação"
"Otimização"	"Faculdade da Computação"
"Unidade de Constituição do Organismo"	"Faculdade de Odontologia"
"Unidade de Funcionamento do Organismo I"	"Faculdade de Odontologia"
"Un. de Reabilitação Integral do Ap. Estomatognático I"	"Faculdade de Odontologia"
"Unidade de Investigação Científica I (UIC1)"	"Faculdade de Odontologia"
"Unidade de Saúde Humana I (USH1)"	"Faculdade de Odontologia"
"Metodologia do Ensino de Ciência"	"Escola Técnica de Saúde"
"Estágio Supervisionado I"	"Escola Técnica de Saúde"
"Construção do Discurso Escrito"	"Escola Técnica de Saúde"
"Metodologia do Ensino da Língua Portuguesa"	"Escola Técnica de Saúde"
"Filosofia da Educação"	"Escola Técnica de Saúde"
"Fisiologia do Exercício"	"Faculdade de Educação Física"
"Teoria e Prática do Treinamento I"	"Faculdade de Educação Física"
"Ritmo e Expressão"	"Faculdade de Educação Física"
"Teoria e Prática do Treinamento II"	"Faculdade de Educação Física"
*/

--b)
SELECT disciplina.nome, turma.id,turma.turma,turma.semestre,turma.ano,turma.cod_disc,turma.predio_s,turma.n_sala
	FROM disciplina
	INNER JOIN turma
	ON disciplina.codigo = turma.cod_disc;
/*
"Agrometeorologia"	1822	"06"	20232	2023	"1805  "	"2E   "	203
"Fundamentos em Enfermagem"	920	"1A"	1	2022	"ESTES1"	"4K   "	205
"Fundamentos em Enfermagem"	921	"1B"	1	2022	"ESTES1"	"4K   "	205
"Saúde Coletiva I"	922	"1A"	1	2022	"ESTES2"	"4K   "	206
"Saúde Coletiva II"	923	"1A"	1	2022	"ESTES3"	"4K   "	207
"Enfermagem Médica"	924	"1A"	2	2022	"ESTES4"	"4K   "	206
"Psicologia e Ética"	925	"1A"	2	2022	"ESTES5"	"4K   "	207
"Climatologia 1"	511	"33"	1	2022	"GGO002"	"3K   "	101
"Climatologia 2"	512	"33"	2	2022	"GGO012"	"3K   "	101
"Geologia 1"	513	"31"	1	2021	"GGO001"	"3K   "	102
"Geologia 2"	514	"31"	2	2021	"GGO011"	"3K   "	102
"Climatologia 2"	515	"29"	2	2020	"GGO012"	"3K   "	103
"Bioquímica 1"	1300	"A "	1	2022	"GMV003"	"1BCG "	101
"Bioquímica 2"	1301	"B "	1	2022	"GMV007"	"1BCG "	102
"Fundamentos de Anatomia Veterinária"	1302	"C "	1	2022	"GMV005"	"1BCG "	103
"Anatomia dos Animais Domésticos"	1303	"D "	1	2022	"GMV006"	"1BCG "	103
"Citologia, Histologia e Embriologia"	1304	"E "	1	2022	"GMV001"	"1BCG "	102
"Fundamentos de Anatomia Veterinária"	1305	"F "	1	2022	"GMV005"	"1BCG "	103
"Avaliação de Impactos Ambiental para Biólogos"	1720	"C "	1	2022	"31505 "	"8C   "	119
"Avaliação de Impactos Ambiental para Biólogos"	1721	"D "	1	2022	"31505 "	"8C   "	119
"Biologia e Cultura - (PROINTER III)"	1722	"C "	1	2022	"39030 "	"2D   "	13
"Construção do Conhecimento Científico"	1723	"C "	1	2022	"31104 "	"8C   "	121
"Evolução"	1724	"C "	1	2022	"31602 "	"8C   "	322
"Profissão Biólogo"	1725	"C "	1	2022	"31407 "	"8C   "	123
"Filosofia Geral: Problemas Metafísicos"	1417	"A "	1	2022	"1410  "	"1U   "	204
"História da Filosofia Medieval"	1418	"A "	1	2022	"1411  "	"5O-A "	206
"Ética"	1419	"A "	1	2022	"1412  "	"5O-A "	206
"Psicologia da Educação"	1420	"A "	2	2022	"1413  "	"5O-A "	207
"Didática Geral"	1421	"A "	2	2022	"1414  "	"1U   "	204
"Didática Geral"	1422	"B "	2	2022	"1414  "	"1U   "	204
"Historia da Arte I"	10	"55"	1	2015	"GAV001"	"5S   "	207
"Historia da Arte II"	20	"57"	2	2016	"GAV007"	"5S   "	205
"Arte Contemporanea I"	30	"59"	1	2017	"GAV013"	"5S   "	208
"Arte Contemporanea II"	40	"61"	2	2018	"GAV019"	"5S   "	207
"Arte Computacional"	50	"63"	1	2019	"GAV010"	"5S   "	205
"Fundamentos de Matemática Elementar I"	218	"A "	1	2018	"MAT201"	"1F   "	215
"Fundamentos de Matemática Elementar II"	219	"B "	2	2019	"MAT211"	"1F   "	216
"Cálculo Diferencial e Integral I"	220	"C "	3	2020	"MAT212"	"1F   "	217
"Cálculo Diferencial e Integral II"	221	"D "	4	2021	"MAT213"	"1F   "	215
"Geometria Analitica"	222	"E "	5	2022	"MAT214"	"1F   "	216
"Geometria Analitica"	223	"F "	6	2022	"MAT214"	"1F   "	216
"Sistemas de Banco de Dados"	1	"01"	1	2022	"GBC043"	"1BBSI"	127
"Sistemas de Banco de Dados"	2	"02"	2	2022	"GBC043"	"1BBSI"	127
"Redes de computadores"	3	"03"	2	2022	"GSI023"	"1BBSI"	128
"Projeto e desenvolvimento 1"	4	"04"	2	2022	"GSI034"	"1BBSI"	129
"Otimização"	5	"05"	2	2022	"GSI027"	"1BBSI"	128
"Unidade de Constituição do Organismo"	1500	"17"	12022	2022	"GOG001"	"UMU4L"	39
"Unidade de Constituição do Organismo"	1501	"17"	12021	2021	"GOG001"	"UMU4L"	39
"Unidade de Funcionamento do Organismo I"	1502	"18"	22021	2021	"GOG002"	"UMU3L"	38
"Un. de Reabilitação Integral do Ap. Estomatognático I"	1503	"19"	22022	2022	"GOG003"	"UMU4L"	39
"Unidade de Investigação Científica I (UIC1)"	1504	"20"	12023	2023	"GOG004"	"UMU1L"	37
"Metodologia do Ensino de Ciência"	430	"65"	2	2020	"410   "	"1G   "	101
"Metodologia do Ensino de Ciência"	431	"66"	1	2020	"410   "	"1G   "	101
"Estágio Supervisionado I"	432	"67"	2	2020	"411   "	"1G   "	102
"Construção do Discurso Escrito"	433	"68"	1	2021	"412   "	"1G   "	103
"Metodologia do Ensino da Língua Portuguesa"	434	"69"	2	2021	"413   "	"1G   "	104
"Fisiologia do Exercício"	400	"00"	2	1982	"GEDU31"	"1A   "	490
"Teoria e Prática do Treinamento I"	401	"01"	1	1983	"GEDU32"	"1A   "	490
"Ritmo e Expressão"	402	"02"	2	1983	"GEDU41"	"1A   "	491
"Teoria e Prática do Treinamento II"	403	"03"	2	1990	"GEDU42"	"1A   "	491
"Comportamento Motor "	404	"04"	2	1995	"GEDU43"	"1A   "	492
"Comportamento Motor "	405	"05"	2	1995	"GEDU43"	"1A   "	492
"Programação Orientada a Objetos"	155	"63"	2	2020	"GBC034"	"1B   "	204
"Programação Orientada a Objetos"	154	"64"	1	2021	"GBC034"	"1B   "	203
"Algoritmo e Estrutura de Dados 2"	153	"65"	2	2021	"GBC024"	"5R   "	103
"Algoritmo e Estrutura de Dados 1"	152	"66"	1	2022	"GBC023"	"5R   "	103
"Programação Procedimental"	151	"67"	2	2022	"GBC045"		
"Teoria do Direito"	650	"D1"	2	2022	"FADIR3"	"3D   "	102
"Direito Digital"	651	"D1"	2	2020	"FADIR4"	"3D   "	104
"Direito do Trabalho 1"	652	"D2"	1	2021	"FADIR5"	"3D   "	104
"Direito do Trabalho 2"	653	"D3"	2	2022	"FADIR6"		
"Direito do Trabalho 2"	654	"D4"	1	2022	"FADIR6"		
"Física Básica I"	315	"A1"	2	2020	"310   "	"1X   "	2
"Física Básica I"	316	"A2"	2	2020	"310   "	"1X   "	2
"Física Básica II"	317	"B1"	3	2020	"311   "	"1X   "	3
"Física Básica III"	318	"C1"	4	2021	"312   "	"1X   "	1
"Geometrica Analítica"	319	"D1"	1	2021	"313   "	"1X   "	1
"Algoritmos e Programação de Computadores"	320	"E1"	4	2021	"314   "	"1X   "	1
"Analises Clinicas"	2015	"A "	1	2022	"2000  "	"2A   "	1
"Imunologia"	2016	"B "	1	2022	"2001  "	"2A   "	2
"Genetica"	2017	"C "	1	2022	"2002  "	"2A   "	3
"Microbiologia"	2018	"D "	1	2022	"2003  "	"2A   "	4
"Biossegurança"	2019	"E "	1	2022	"2004  "	"2A   "	5
"Biossegurança"	2020	"F "	1	2022	"2004  "	"2A   "	6
"Construções Rurais"	1817	"01"	20211	2021	"1801  "	"2E   "	201
"Construções Rurais"	1818	"02"	20212	2021	"1801  "	"2E   "	201
"Manejo e Conservação do Solo e da Água"	1819	"03"	20221	2022	"1803  "	"2E   "	201
"Irrigação e Drenagem"	1820	"04"	20222	2022	"1804  "	"2E   "	202
"Adubos e Adubação"	1821	"05"	20231	2023	"1802  "	"2E   "	202
*/

--c)
SELECT estudante.nome,professor.nome
	FROM estudante
	INNER JOIN professor
	ON estudante.tutor = professor.id;
/*
"Pedro Henrique Silva"	"Marcelo Keese Albertini"
"Gabriel Borges Júnior"	"Rivalino Matias Júnior"
"Amanda Gomes de Oliveira"	"André Backes"
"Jorge Antônio Santos"	"Bruno Augusto Nassif Travençolo"
"Bruna Tobias Pinto"	"Luiz Gustavo Almeida Martins"
"Jonas Caravalho"	"Ailton Gonçalves Rodrigues Junior"
"Ana Silveira"	"Jeamylle Nilin Gonçalves"
"Guilherme da Cunha"	"Ariádine Cristine de Almeida"
"Davi Lucca Duarte"	"Ailton Gonçalves Rodrigues Junior"
"Henrique Corrêa de Oliveira"	"Alexsandro Soares"
"Gabriel de Araujo"	"Pedro Frosi"
"Luisa Gomes Ferreira"	"Elaine Ribeiro"
"Gabriela Pereira"	"Jean Ponciano"
"Gabriel Alves"	"Marcia Aparecida Fernandes"
"Joao Vitor Correia"	"Taciana Oliveira Souza"
"Marina Silva Gomes"	"Fernando Rodrigo Rafaeli"
"Maria Julia Oliveira"	"Camila Mariana Ruiz"
"Vicente Araujo Mendes"	"Admilson Lopes dos Santos"
"Alexandre Oliveira Rodrigues"	"Adriana Rodrigues da Silva"
"Vinicius Ribeiro"	"Adriano Mota Loyola"
"César Bertolin"	"Alessandra Maia de Castro Prado"
"Bruno José"	"Álex Moreira Herval"
"Elaine Maria"	"Ana Paula Turrioni Hidalgo"
"Carlos Silva"	"Ana Paula de Lima Oliveira"
"Isabella Melo Sousa"	"Belchior de Sousa"
"Jose Almeida Azevedo"	"Elsieni Coelho da Silva"
"Aline Oliveira Araujo"	"Belchior de Sousa"
"Andre Silva Martins"	"Gastao da Cunha Frota"
"Lavinia Sousa Carvalho"	"Belchior de Sousa"
"Victor Guilherme Oliveira Santos"	"Adriana Pastorello Buim Arena"
"Sara Pelegrineti de José"	"Aldeci Cacique Calixto"
"Davi Rui Pasquim"	"Aléxia Pádua Franco"
"Diego Ruas"	"Ana Beatriz da Silva Duarte"
"Pedro Tiene Silva"	"Andrea Maturano Longarezi"
"Jason Manmoa"	"Jailson Mendes"
"Scott Pilgrim"	"Gabriel Jesus"
"Naruto Uzumaki"	"Gabriel Jesus"
"Frederico Krueger"	"João Guilherme"
"Jason Thirtenn"	"João Guilherme"
"Aline Ferreira Magalhaes"	"Alcino Eduardo Bonella"
"Cristiano Bueno de Almeida"	"Alcino Eduardo Bonella"
"Derli Luis Arantes Junior"	"Anselmo Tadeu Ferreira"
"Gladston Marcelo Pereira do Vale"	"Anselmo Tadeu Ferreira"
"Kamila Stephany Alves Santos"	"Ana Maria Said"
"Alexandre Borba Chiqueta"	"Gina Maira"
"Flávio Fernandes"	"Gina Maira"
"Gabrel Toledo"	"Rivalino Matias Júnior"
"Nicolas Paolinelli"	"Gina Maira"
"Matheus Brasileiro Aguiar"	"Bruno Augusto Nassif Travençolo"
"Pedro Nunes"	"Kelly Aparecida Geraldo Yoneyama Tudini"
"Maria Ferreira"	"Neide Maria da Silva "
"Elaine Ribeiro de Faria Paiva"	"Daniela de Melo Crosara"
"Fernando Souza"	"Daniela de Melo Crosara"
"Rafael Silva"	"Fernando Rodrigues Martins"
"João Marcos Ramos"	"Fernando Rodrigues Martins"
"Marcos Estefam"	"Fernando Rodrigues Martins"
"Neil Gaiman"	"Ademir Cavalheiro"
"Robert Louis Stevenson"	"Adevailton Bernardo dos Santos"
"Anne Rice"	"Alessandra Riposati Arantes"
"Bram Stocker"	"Alessandra Riposati Arantes"
"Marry Shelley"	"Djalmir Nestor Messias"
"Peter Benjamin Parker"	"Disney Oliver"
"Peter Kavinsky"	"Henrique Tomaz Gonzaga"
"Lara Jean"	"Alberto da Silva Morais"
"Percy Jackson"	"Daniela Cristina de Oliveira"
"Veronica Lodge"	"Carlos Hernrique Gomes"
"Annelise Salem"	"Jamil Salem"
"Gabriel Hugo Borges"	"Julia Vingadora"
"Gustavo Duarte Gomides"	"Tatiana Carneiro de Resende"
"Rodrigo Alves da Silva"	"Lilian Rodrigues Sant’ Anna Campos"
"Julia Echeverria"	"Marisa Aparecida Elias"
"Guilherme Duarte"	"Tatiana Carneiro de Resende"
"Rodrigo da Silva"	"Lilian Rodrigues Sant’ Anna Campos"
"Rafael Henrique Guimarães"	"Alex Fernando Borges"
"Felipe Langer"	"Alex Fernando Borges"
"Lucas Daniel Cunha"	"Alexandre Alves Alvenha"
"Laura Rezende Teixeira Santos"	"Alexandre Cacheffo"
"Mariana Serrano Guimaraes"	"Alexandre Calzavara Yoshida"
*/

--d)
SELECT disciplina.nome,turma.semestre,turma.ano
	FROM disciplina 
	INNER JOIN turma
    ON (disciplina.codigo = turma.cod_disc)
	WHERE turma.semestre = 2
  	AND turma.ano=2022;

--e)
SELECT disciplina.nome, pre_requisito.cod_pre
	FROM disciplina
	INNER JOIN pre_requisito
	ON disciplina.codigo = pre_requisito.cod_disc;
/*
"Comportamento Motor "	"GEDU31"
"Algoritmo e Estrutura de Dados 1"	"GBC045"
"Algoritmo e Estrutura de Dados 2"	"GBC023"
"Bioquímica 2"	"GMV003"
"Anatomia dos Animais Domésticos"	"GMV005"
"Etica II"	"1412  "
"Didática Geral II"	"1414  "
"Historia da Arte II"	"GAV001"
"Arte Contemporanea II"	"GAV013"
"Direito Digital"	"FADIR3"
"Direito do Trabalho 2"	"FADIR5"
"Física Básica II"	"310   "
"Física Básica III"	"311   "
"Imunologia"	"2000  "
"Microbiologia"	"2002  "
"Agrometeorologia"	"1803  "
"Agrometeorologia"	"1804  "
"Saúde Coletiva II"	"ESTES2"
"Enfermagem Médica"	"ESTES1"
"Geologia 2"	"GGO001"
"Climatologia 2"	"GGO002"
"Fundamentos de Matemática Elementar II"	"MAT201"
"Cálculo Diferencial e Integral II"	"MAT212"
"Projeto e desenvolvimento 1"	"GBC043"
"Unidade de Saúde Humana I (USH1)"	"GOG001"
"Teoria e Prática do Treinamento II"	"GEDU32"
*/

--f)
SELECT disciplina.nome, pre_requisito.cod_disc
	FROM disciplina
	INNER JOIN pre_requisito
	ON disciplina.codigo = pre_requisito.cod_pre;
/*
"Programação Procedimental"	"GBC023"
"Algoritmo e Estrutura de Dados 1"	"GBC024"
"Bioquímica 1"	"GMV007"
"Fundamentos de Anatomia Veterinária"	"GMV006"
"Ética"	"1415  "
"Didática Geral"	"1416  "
"Historia da Arte I"	"GAV007"
"Arte Contemporanea I"	"GAV019"
"Teoria do Direito"	"FADIR4"
"Direito do Trabalho 1"	"FADIR6"
"Física Básica I"	"311   "
"Física Básica II"	"312   "
"Analises Clinicas"	"2001  "
"Genetica"	"2003  "
"Manejo e Conservação do Solo e da Água"	"1805  "
"Irrigação e Drenagem"	"1805  "
"Fundamentos em Enfermagem"	"ESTES4"
"Saúde Coletiva I"	"ESTES3"
"Geologia 1"	"GGO011"
"Climatologia 1"	"GGO012"
"Fundamentos de Matemática Elementar I"	"MAT211"
"Cálculo Diferencial e Integral I"	"MAT213"
"Sistemas de Banco de Dados"	"GSI034"
"Unidade de Constituição do Organismo"	"GOG005"
"Fisiologia do Exercício"	"GEDU43ciplina
"Teoria e Prática do Treinamento I"	"GEDU42"
*/

--14)
--a)
	SELECT professor.nome as nome_prof,
	disciplina.nome as nome_disc
	FROM professor
		INNER JOIN
		ensina ON professor.id = ensina.id_prof
		INNER JOIN 
		turma ON ensina.id_turma = turma.id
		INNER JOIN 
		disciplina ON disciplina.codigo = turma.cod_disc;

/*
"Gina Maira"	"Programação Orientada a Objetos"
"Marcelo Keese Albertini"	"Programação Procedimental"
"Rivalino Matias Júnior"	"Programação Orientada a Objetos"
"André Backes"	"Algoritmo e Estrutura de Dados 1"
"Bruno Augusto Nassif Travençolo"	"Algoritmo e Estrutura de Dados 2"
"Alexandre Garrido da Silva"	"Teoria do Direito"
"Alexandre Garrido da Silva"	"Direito Digital"
"Beatriz Corrêa Camargo"	"Teoria do Direito"
"Beatriz Corrêa Camargo"	"Direito do Trabalho 1"
"Daniela de Melo Crosara"	"Direito do Trabalho 2"
"Daniela de Melo Crosara"	"Direito do Trabalho 1"
"Daniela de Melo Crosara"	"Direito do Trabalho 2"
"Fernando Rodrigues Martins"	"Direito do Trabalho 1"
"Fernando Rodrigues Martins"	"Direito do Trabalho 2"
"Fernando Rodrigues Martins"	"Direito do Trabalho 2"
"Gustavo de Carvalho Marin"	"Direito Digital"
"Gustavo de Carvalho Marin"	"Direito do Trabalho 1"
"Gustavo de Carvalho Marin"	"Direito do Trabalho 2"
"Ademir Cavalheiro"	"Física Básica I"
"Ademir Cavalheiro"	"Física Básica II"
"Adevailton Bernardo dos Santos"	"Física Básica I"
"Alessandra Riposati Arantes"	"Física Básica III"
"Djalmir Nestor Messias"	"Geometrica Analítica"
"Marcel Novaes"	"Algoritmos e Programação de Computadores"
"Alberto da Silva Morais"	"Analises Clinicas"
"Carlos Hernrique Gomes"	"Imunologia"
"Daniela Cristina de Oliveira"	"Genetica"
"Disney Oliver"	"Microbiologia"
"Henrique Tomaz Gonzaga"	"Biossegurança"
"Jamil Salem"	"Construções Rurais"
"Jamil Salem"	"Construções Rurais"
"Julia Vingadora"	"Manejo e Conservação do Solo e da Água"
"Roberto Carlos"	"Irrigação e Drenagem"
"Cláudio Assembly"	"Adubos e Adubação"
"Elaine Java"	"Agrometeorologia"
"Lilian Rodrigues Sant’ Anna Campos"	"Fundamentos em Enfermagem"
"Clelia Regina Cafer"	"Fundamentos em Enfermagem"
"Marisa Aparecida Elias"	"Saúde Coletiva I"
"Marisa Aparecida Elias"	"Saúde Coletiva II"
"Barbara Dias Rezende Gontijo"	"Enfermagem Médica"
"Tatiana Carneiro de Resende"	"Psicologia e Ética"
"Alessandro Gomes Enoque"	"Climatologia 1"
"Alex Fernando Borges"	"Climatologia 2"
"Alexandre Alves Alvenha"	"Geologia 1"
"Alexandre Cacheffo"	"Geologia 2"
"Alexandre Calzavara Yoshida"	"Climatologia 2"
"Kelly Aparecida Geraldo Yoneyama Tudini"	"Bioquímica 1"
"Lucas de Assis Ribeiro"	"Bioquímica 1"
"Natália Mundim Tôrres"	"Bioquímica 2"
"Tiago Wilson Patriarca Mineo "	"Fundamentos de Anatomia Veterinária"
"Neide Maria da Silva "	"Bioquímica 1"
"Ailton Gonçalves Rodrigues Junior"	"Avaliação de Impactos Ambiental para Biólogos"
"Ariádine Cristine de Almeida"	"Biologia e Cultura - (PROINTER III)"
"Ariádine Cristine de Almeida"	"Construção do Conhecimento Científico"
"Cassiano Aimberê Dorneles Welker"	"Profissão Biólogo"
"Giuliano Buzá Jacobucci"	"Avaliação de Impactos Ambiental para Biólogos"
"Alcino Eduardo Bonella"	"Filosofia Geral: Problemas Metafísicos"
"Alexandre Guimarães Tadeu de Soares"	"Ética"
"Ana Maria Said"	"Filosofia Geral: Problemas Metafísicos"
"Anselmo Tadeu Ferreira"	"História da Filosofia Medieval"
"Dennys Garcia Xavier"	"Ética"
"Belchior de Sousa"	"Historia da Arte I"
"Elsieni Coelho da Silva"	"Historia da Arte II"
"Gastao da Cunha Frota"	"Arte Contemporanea I"
"Elsieni Coelho da Silva"	"Arte Contemporanea II"
"Renato Palumbo Doria"	"Arte Computacional"
"Admilson Lopes dos Santos"	"Fundamentos de Matemática Elementar I"
"Adriana Rodrigues da Silva"	"Fundamentos de Matemática Elementar II"
"Camila Mariana Ruiz"	"Cálculo Diferencial e Integral I"
"Fernando Rodrigo Rafaeli"	"Cálculo Diferencial e Integral II"
"Taciana Oliveira Souza"	"Geometria Analitica"
"Taciana Oliveira Souza"	"Geometria Analitica"
"Jean Ponciano"	"Sistemas de Banco de Dados"
"Elaine Ribeiro"	"Redes de computadores"
"Alexsandro Soares"	"Projeto e desenvolvimento 1"
"Pedro Frosi"	"Otimização"
"Marcia Aparecida Fernandes"	"Redes de computadores"
"Adriano Mota Loyola"	"Unidade de Constituição do Organismo"
"Alessandra Maia de Castro Prado"	"Unidade de Constituição do Organismo"
"Adriana Pastorello Buim Arena"	"Metodologia do Ensino de Ciência"
"Aldeci Cacique Calixto"	"Metodologia do Ensino de Ciência"
"Aléxia Pádua Franco"	"Estágio Supervisionado I"
"Ana Beatriz da Silva Duarte"	"Construção do Discurso Escrito"
"Andrea Maturano Longarezi"	"Metodologia do Ensino da Língua Portuguesa"
"Jailson Mendes"	"Fisiologia do Exercício"
"Gabriel Jesus"	"Teoria e Prática do Treinamento I"
"Luciano Hulk"	"Ritmo e Expressão"
"João Guilherme"	"Teoria e Prática do Treinamento II"
"Péricles Mendes"	"Comportamento Motor "
*/

--b)
	SELECT professor.nome as nome_prof,
	disciplina.nome as nome_disc
	FROM professor
	INNER JOIN
	ensina ON professor.id = ensina.id_prof
	INNER JOIN
	turma ON turma.id = ensina.id_turma
	INNER JOIN 
	disciplina ON disciplina.codigo = turma.cod_disc
	WHERE ano = 2022 AND semestre = 2; 
/*
"Marcelo Keese Albertini"	"Programação Procedimental"
"Beatriz Corrêa Camargo"	"Teoria do Direito"
"Alexandre Garrido da Silva"	"Teoria do Direito"
"Fernando Rodrigues Martins"	"Direito do Trabalho 2"
"Daniela de Melo Crosara"	"Direito do Trabalho 2"
"Barbara Dias Rezende Gontijo"	"Enfermagem Médica"
"Tatiana Carneiro de Resende"	"Psicologia e Ética"
"Alex Fernando Borges"	"Climatologia 2"
"Jean Ponciano"	"Sistemas de Banco de Dados"
"Marcia Aparecida Fernandes"	"Redes de computadores"
"Elaine Ribeiro"	"Redes de computadores"
"Alexsandro Soares"	"Projeto e desenvolvimento 1"
"Pedro Frosi"	"Otimização"
*/

--c)
	SELECT disciplina.nome as nome_disc
	FROM turma
	INNER JOIN
	disciplina ON turma.cod_disc = disciplina.codigo
	INNER JOIN
	sala ON turma.predio_s = sala.predio AND turma.n_sala = sala.numero
	WHERE capacidade > 10;
/*
"Comportamento Motor "
"Comportamento Motor "
"Algoritmo e Estrutura de Dados 1"
"Algoritmo e Estrutura de Dados 2"
"Programação Orientada a Objetos"
"Programação Orientada a Objetos"
"Bioquímica 1"
"Bioquímica 2"
"Fundamentos de Anatomia Veterinária"
"Fundamentos de Anatomia Veterinária"
"Anatomia dos Animais Domésticos"
"Citologia, Histologia e Embriologia"
"Filosofia Geral: Problemas Metafísicos"
"História da Filosofia Medieval"
"Ética"
"Psicologia da Educação"
"Didática Geral"
"Didática Geral"
"Historia da Arte I"
"Historia da Arte II"
"Arte Contemporanea I"
"Arte Contemporanea II"
"Arte Computacional"
"Avaliação de Impactos Ambiental para Biólogos"
"Avaliação de Impactos Ambiental para Biólogos"
"Biologia e Cultura - (PROINTER III)"
"Construção do Conhecimento Científico"
"Evolução"
"Profissão Biólogo"
"Teoria do Direito"
"Direito Digital"
"Direito do Trabalho 1"
"Física Básica I"
"Física Básica I"
"Física Básica II"
"Física Básica III"
"Geometrica Analítica"
"Algoritmos e Programação de Computadores"
"Analises Clinicas"
"Imunologia"
"Genetica"
"Microbiologia"
"Biossegurança"
"Biossegurança"
"Construções Rurais"
"Construções Rurais"
"Adubos e Adubação"
"Manejo e Conservação do Solo e da Água"
"Irrigação e Drenagem"
"Agrometeorologia"
"Fundamentos em Enfermagem"
"Fundamentos em Enfermagem"
"Saúde Coletiva I"
"Saúde Coletiva II"
"Enfermagem Médica"
"Psicologia e Ética"
"Geologia 1"
"Climatologia 1"
"Geologia 2"
"Climatologia 2"
"Climatologia 2"
"Fundamentos de Matemática Elementar I"
"Fundamentos de Matemática Elementar II"
"Cálculo Diferencial e Integral I"
"Cálculo Diferencial e Integral II"
"Geometria Analitica"
"Geometria Analitica"
"Sistemas de Banco de Dados"
"Sistemas de Banco de Dados"
"Redes de computadores"
"Projeto e desenvolvimento 1"
"Otimização"
"Unidade de Constituição do Organismo"
"Unidade de Constituição do Organismo"
"Unidade de Funcionamento do Organismo I"
"Un. de Reabilitação Integral do Ap. Estomatognático I"
"Unidade de Investigação Científica I (UIC1)"
"Metodologia do Ensino de Ciência"
"Metodologia do Ensino de Ciência"
"Estágio Supervisionado I"
"Construção do Discurso Escrito"
"Metodologia do Ensino da Língua Portuguesa"
"Fisiologia do Exercício"
"Teoria e Prática do Treinamento I"
"Ritmo e Expressão"
"Teoria e Prática do Treinamento II"
*/

--d)
	SELECT estudante.nome as nome_est,
	fac_est,
	estudante.tutor as prof_tutor
	FROM faculdade
	INNER JOIN
	estudante ON estudante.fac_est = faculdade.sigla
	INNER JOIN
	professor ON professor.id = estudante.tutor;
/*
"Pedro Henrique Silva"	"FACOM"	"101        "
"Gabriel Borges Júnior"	"FACOM"	"102        "
"Amanda Gomes de Oliveira"	"FACOM"	"103        "
"Jorge Antônio Santos"	"FACOM"	"104        "
"Bruna Tobias Pinto"	"FACOM"	"105        "
"Jonas Caravalho"	"INBIO"	"1700       "
"Ana Silveira"	"INBIO"	"1703       "
"Guilherme da Cunha"	"INBIO"	"1701       "
"Davi Lucca Duarte"	"INBIO"	"1700       "
"Henrique Corrêa de Oliveira"	"FACOM"	"10000000010"
"Gabriel de Araujo"	"FACOM"	"10000000011"
"Luisa Gomes Ferreira"	"FACOM"	"10000000001"
"Gabriela Pereira"	"FACOM"	"10000000000"
"Gabriel Alves"	"FACOM"	"10000000100"
"Joao Vitor Correia"	"FAMAT"	"204        "
"Marina Silva Gomes"	"FAMAT"	"203        "
"Maria Julia Oliveira"	"FAMAT"	"202        "
"Vicente Araujo Mendes"	"FAMAT"	"200        "
"Alexandre Oliveira Rodrigues"	"FAMAT"	"201        "
"Vinicius Ribeiro"	"FOUFU"	"1500       "
"César Bertolin"	"FOUFU"	"1501       "
"Bruno José"	"FOUFU"	"1502       "
"Elaine Maria"	"FOUFU"	"1503       "
"Carlos Silva"	"FOUFU"	"1504       "
"Isabella Melo Sousa"	"IARTE"	"1600       "
"Jose Almeida Azevedo"	"IARTE"	"1605       "
"Aline Oliveira Araujo"	"IARTE"	"1600       "
"Andre Silva Martins"	"IARTE"	"1610       "
"Lavinia Sousa Carvalho"	"IARTE"	"1600       "
"Victor Guilherme Oliveira Santos"	"ESTES"	"400        "
"Sara Pelegrineti de José"	"ESTES"	"401        "
"Davi Rui Pasquim"	"ESTES"	"402        "
"Diego Ruas"	"ESTES"	"403        "
"Pedro Tiene Silva"	"ESTES"	"404        "
"Jason Manmoa"	"FAEDU"	"420        "
"Scott Pilgrim"	"FAEDU"	"421        "
"Naruto Uzumaki"	"FAEDU"	"421        "
"Frederico Krueger"	"FAEDU"	"423        "
"Jason Thirtenn"	"FAEDU"	"423        "
"Aline Ferreira Magalhaes"	"IFILO"	"1400       "
"Cristiano Bueno de Almeida"	"IFILO"	"1400       "
"Derli Luis Arantes Junior"	"IFILO"	"1403       "
"Gladston Marcelo Pereira do Vale"	"IFILO"	"1403       "
"Kamila Stephany Alves Santos"	"IFILO"	"1402       "
"Alexandre Borba Chiqueta"	"FACOM"	"100        "
"Flávio Fernandes"	"FACOM"	"100        "
"Gabrel Toledo"	"FACOM"	"102        "
"Nicolas Paolinelli"	"FACOM"	"100        "
"Matheus Brasileiro Aguiar"	"FACOM"	"104        "
"Pedro Nunes"	"FAMEV"	"1300       "
"Maria Ferreira"	"FAMEV"	"1304       "
"Elaine Ribeiro de Faria Paiva"	"FADIR"	"603        "
"Fernando Souza"	"FADIR"	"603        "
"Rafael Silva"	"FADIR"	"604        "
"João Marcos Ramos"	"FADIR"	"604        "
"Marcos Estefam"	"FADIR"	"604        "
"Neil Gaiman"	"INFIS"	"300        "
"Robert Louis Stevenson"	"INFIS"	"301        "
"Anne Rice"	"INFIS"	"302        "
"Bram Stocker"	"INFIS"	"302        "
"Marry Shelley"	"INFIS"	"303        "
"Peter Benjamin Parker"	"ICBIM"	"2008       "
"Peter Kavinsky"	"ICBIM"	"2009       "
"Lara Jean"	"ICBIM"	"2005       "
"Percy Jackson"	"ICBIM"	"2007       "
"Veronica Lodge"	"ICBIM"	"2006       "
"Annelise Salem"	"ICIAG"	"1812       "
"Gabriel Hugo Borges"	"ICIAG"	"1813       "
"Gustavo Duarte Gomides"	"ESTES"	"904        "
"Rodrigo Alves da Silva"	"ESTES"	"900        "
"Julia Echeverria"	"ESTES"	"902        "
"Guilherme Duarte"	"ESTES"	"904        "
"Rodrigo da Silva"	"ESTES"	"900        "
"Rafael Henrique Guimarães"	"FACIP"	"501        "
"Felipe Langer"	"FACIP"	"501        "
"Lucas Daniel Cunha"	"FACIP"	"502        "
"Laura Rezende Teixeira Santos"	"FACIP"	"503        "
"Mariana Serrano Guimaraes"	"FACIP"	"504        "
*/

--e)
	SELECT *
	FROM turma 
	INNER JOIN 
	sala ON turma.predio_s = sala.predio AND turma.n_sala = sala.numero;
/*
1822	"06"	20232	2023	"1805  "	"2E   "	203	"2E   "	203	40
920	"1A"	1	2022	"ESTES1"	"4K   "	205	"4K   "	205	40
921	"1B"	1	2022	"ESTES1"	"4K   "	205	"4K   "	205	40
922	"1A"	1	2022	"ESTES2"	"4K   "	206	"4K   "	206	60
923	"1A"	1	2022	"ESTES3"	"4K   "	207	"4K   "	207	30
924	"1A"	2	2022	"ESTES4"	"4K   "	206	"4K   "	206	60
925	"1A"	2	2022	"ESTES5"	"4K   "	207	"4K   "	207	30
511	"33"	1	2022	"GGO002"	"3K   "	101	"3K   "	101	50
512	"33"	2	2022	"GGO012"	"3K   "	101	"3K   "	101	50
513	"31"	1	2021	"GGO001"	"3K   "	102	"3K   "	102	50
514	"31"	2	2021	"GGO011"	"3K   "	102	"3K   "	102	50
515	"29"	2	2020	"GGO012"	"3K   "	103	"3K   "	103	50
1300	"A "	1	2022	"GMV003"	"1BCG "	101	"1BCG "	101	50
1301	"B "	1	2022	"GMV007"	"1BCG "	102	"1BCG "	102	40
1302	"C "	1	2022	"GMV005"	"1BCG "	103	"1BCG "	103	90
1303	"D "	1	2022	"GMV006"	"1BCG "	103	"1BCG "	103	90
1304	"E "	1	2022	"GMV001"	"1BCG "	102	"1BCG "	102	40
1305	"F "	1	2022	"GMV005"	"1BCG "	103	"1BCG "	103	90
1720	"C "	1	2022	"31505 "	"8C   "	119	"8C   "	119	60
1721	"D "	1	2022	"31505 "	"8C   "	119	"8C   "	119	60
1722	"C "	1	2022	"39030 "	"2D   "	13	"2D   "	13	50
1723	"C "	1	2022	"31104 "	"8C   "	121	"8C   "	121	60
1724	"C "	1	2022	"31602 "	"8C   "	322	"8C   "	322	40
1725	"C "	1	2022	"31407 "	"8C   "	123	"8C   "	123	60
1417	"A "	1	2022	"1410  "	"1U   "	204	"1U   "	204	60
1418	"A "	1	2022	"1411  "	"5O-A "	206	"5O-A "	206	60
1419	"A "	1	2022	"1412  "	"5O-A "	206	"5O-A "	206	60
1420	"A "	2	2022	"1413  "	"5O-A "	207	"5O-A "	207	60
1421	"A "	2	2022	"1414  "	"1U   "	204	"1U   "	204	60
1422	"B "	2	2022	"1414  "	"1U   "	204	"1U   "	204	60
10	"55"	1	2015	"GAV001"	"5S   "	207	"5S   "	207	40
20	"57"	2	2016	"GAV007"	"5S   "	205	"5S   "	205	40
30	"59"	1	2017	"GAV013"	"5S   "	208	"5S   "	208	40
40	"61"	2	2018	"GAV019"	"5S   "	207	"5S   "	207	40
50	"63"	1	2019	"GAV010"	"5S   "	205	"5S   "	205	40
218	"A "	1	2018	"MAT201"	"1F   "	215	"1F   "	215	70
219	"B "	2	2019	"MAT211"	"1F   "	216	"1F   "	216	75
220	"C "	3	2020	"MAT212"	"1F   "	217	"1F   "	217	45
221	"D "	4	2021	"MAT213"	"1F   "	215	"1F   "	215	70
222	"E "	5	2022	"MAT214"	"1F   "	216	"1F   "	216	75
223	"F "	6	2022	"MAT214"	"1F   "	216	"1F   "	216	75
1	"01"	1	2022	"GBC043"	"1BBSI"	127	"1BBSI"	127	90
2	"02"	2	2022	"GBC043"	"1BBSI"	127	"1BBSI"	127	90
3	"03"	2	2022	"GSI023"	"1BBSI"	128	"1BBSI"	128	90
4	"04"	2	2022	"GSI034"	"1BBSI"	129	"1BBSI"	129	90
5	"05"	2	2022	"GSI027"	"1BBSI"	128	"1BBSI"	128	90
1500	"17"	12022	2022	"GOG001"	"UMU4L"	39	"UMU4L"	39	100
1501	"17"	12021	2021	"GOG001"	"UMU4L"	39	"UMU4L"	39	100
1502	"18"	22021	2021	"GOG002"	"UMU3L"	38	"UMU3L"	38	80
1503	"19"	22022	2022	"GOG003"	"UMU4L"	39	"UMU4L"	39	100
1504	"20"	12023	2023	"GOG004"	"UMU1L"	37	"UMU1L"	37	50
430	"65"	2	2020	"410   "	"1G   "	101	"1G   "	101	50
431	"66"	1	2020	"410   "	"1G   "	101	"1G   "	101	50
432	"67"	2	2020	"411   "	"1G   "	102	"1G   "	102	50
433	"68"	1	2021	"412   "	"1G   "	103	"1G   "	103	50
434	"69"	2	2021	"413   "	"1G   "	104	"1G   "	104	50
400	"00"	2	1982	"GEDU31"	"1A   "	490	"1A   "	490	55
401	"01"	1	1983	"GEDU32"	"1A   "	490	"1A   "	490	55
402	"02"	2	1983	"GEDU41"	"1A   "	491	"1A   "	491	40
403	"03"	2	1990	"GEDU42"	"1A   "	491	"1A   "	491	40
404	"04"	2	1995	"GEDU43"	"1A   "	492	"1A   "	492	50
405	"05"	2	1995	"GEDU43"	"1A   "	492	"1A   "	492	50
155	"63"	2	2020	"GBC034"	"1B   "	204	"1B   "	204	80
154	"64"	1	2021	"GBC034"	"1B   "	203	"1B   "	203	80
153	"65"	2	2021	"GBC024"	"5R   "	103	"5R   "	103	90
152	"66"	1	2022	"GBC023"	"5R   "	103	"5R   "	103	90
650	"D1"	2	2022	"FADIR3"	"3D   "	102	"3D   "	102	60
651	"D1"	2	2020	"FADIR4"	"3D   "	104	"3D   "	104	40
652	"D2"	1	2021	"FADIR5"	"3D   "	104	"3D   "	104	40
315	"A1"	2	2020	"310   "	"1X   "	2	"1X   "	2	60
316	"A2"	2	2020	"310   "	"1X   "	2	"1X   "	2	60
317	"B1"	3	2020	"311   "	"1X   "	3	"1X   "	3	60
318	"C1"	4	2021	"312   "	"1X   "	1	"1X   "	1	60
319	"D1"	1	2021	"313   "	"1X   "	1	"1X   "	1	60
320	"E1"	4	2021	"314   "	"1X   "	1	"1X   "	1	60
2015	"A "	1	2022	"2000  "	"2A   "	1	"2A   "	1	50
2016	"B "	1	2022	"2001  "	"2A   "	2	"2A   "	2	50
2017	"C "	1	2022	"2002  "	"2A   "	3	"2A   "	3	50
2018	"D "	1	2022	"2003  "	"2A   "	4	"2A   "	4	50
2019	"E "	1	2022	"2004  "	"2A   "	5	"2A   "	5	50
2020	"F "	1	2022	"2004  "	"2A   "	6	"2A   "	6	50
1817	"01"	20211	2021	"1801  "	"2E   "	201	"2E   "	201	50
1818	"02"	20212	2021	"1801  "	"2E   "	201	"2E   "	201	50
1819	"03"	20221	2022	"1803  "	"2E   "	201	"2E   "	201	50
1820	"04"	20222	2022	"1804  "	"2E   "	202	"2E   "	202	30
1821	"05"	20231	2023	"1802  "	"2E   "	202	"2E   "	202	30
*/

--f)
	ALTER TABLE professor ADD COLUMN datanasc DATE;
	
	UPDATE professor SET datanasc = '1985-05-29' WHERE datanasc IS NULL AND professor.id = '100';
	UPDATE professor SET datanasc = '1995-04-14' WHERE datanasc IS NULL AND professor.id = '101';
	UPDATE professor SET datanasc = '1975-06-14' WHERE datanasc IS NULL AND professor.id = '102';
	UPDATE professor SET datanasc = '1974-09-25' WHERE datanasc IS NULL AND professor.id = '103';
	UPDATE professor SET datanasc = '1975-12-17' WHERE datanasc IS NULL;
	UPDATE professor SET datanasc = '1987-07-19' WHERE datanasc = '1975-12-17' AND professor.id = '104';
	
	SELECT professor.nome AS professor,
	age(current_date, professor.datanasc) AS idade_prof, 
	estudante.nome AS estudante,
	age(current_date, estudante.datanasc) AS idade_est
	FROM professor
	INNER JOIN
	estudante ON professor.datanasc = estudante.datanasc;
	
/*
"Marcelo Keese Albertini"	"27 years 7 mons 15 days"	"Vicente Araujo Mendes"	"27 years 7 mons 15 days"
"André Backes"	"48 years 2 mons 4 days"	"Davi Lucca Duarte"	"48 years 2 mons 4 days"
"Bruno Augusto Nassif Travençolo"	"35 years 4 mons 10 days"	"Luna da Conceição"	"35 years 4 mons 10 days"
*/

--g)
	SELECT professor.nome AS professor,
	age(current_date, professor.datanasc) AS prof_idade,
	estudante.nome AS estudante,
	age(current_date, estudante.datanasc) AS est_idade
	FROM professor
	INNER JOIN
	estudante ON estudante.datanasc <> professor.datanasc;

--15)
--a)
	SELECT disc.nome AS nome_disciplina,
	disc_pre.nome AS nome_prereq
	FROM pre_requisito, disciplina disc_pre, disciplina disc
	WHERE disc.codigo = pre_requisito.cod_disc
	AND disc_pre.codigo = pre_requisito.cod_pre;
/*
"Comportamento Motor "	"Fisiologia do Exercício"
"Algoritmo e Estrutura de Dados 1"	"Programação Procedimental"
"Algoritmo e Estrutura de Dados 2"	"Algoritmo e Estrutura de Dados 1"
"Bioquímica 2"	"Bioquímica 1"
"Anatomia dos Animais Domésticos"	"Fundamentos de Anatomia Veterinária"
"Etica II"	"Ética"
"Didática Geral II"	"Didática Geral"
"Historia da Arte II"	"Historia da Arte I"
"Arte Contemporanea II"	"Arte Contemporanea I"
"Direito Digital"	"Teoria do Direito"
"Direito do Trabalho 2"	"Direito do Trabalho 1"
"Física Básica II"	"Física Básica I"
"Física Básica III"	"Física Básica II"
"Imunologia"	"Analises Clinicas"
"Microbiologia"	"Genetica"
"Agrometeorologia"	"Irrigação e Drenagem"
"Agrometeorologia"	"Manejo e Conservação do Solo e da Água"
"Saúde Coletiva II"	"Saúde Coletiva I"
"Enfermagem Médica"	"Fundamentos em Enfermagem"
"Geologia 2"	"Geologia 1"
"Climatologia 2"	"Climatologia 1"
"Fundamentos de Matemática Elementar II"	"Fundamentos de Matemática Elementar I"
"Cálculo Diferencial e Integral II"	"Cálculo Diferencial e Integral I"
"Projeto e desenvolvimento 1"	"Sistemas de Banco de Dados"
"Unidade de Saúde Humana I (USH1)"	"Unidade de Constituição do Organismo"
"Teoria e Prática do Treinamento II"	"Teoria e Prática do Treinamento I"
*/

--b)
	SELECT DISTINCT disc.nome
	FROM pre_requisito, disciplina disc_pre, disciplina disc
	WHERE disc.codigo = pre_requisito.cod_disc
	AND disc.ch > disc_pre.ch;

/*
"Enfermagem Médica"
"Unidade de Saúde Humana I (USH1)"
"Algoritmo e Estrutura de Dados 1"
"Direito Digital"
"Comportamento Motor "
"Fundamentos de Matemática Elementar II"
"Imunologia"
"Física Básica III"
"Agrometeorologia"
"Didática Geral II"
"Historia da Arte II"
"Algoritmo e Estrutura de Dados 2"
"Cálculo Diferencial e Integral II"
"Anatomia dos Animais Domésticos"
"Direito do Trabalho 2"
"Saúde Coletiva II"
"Física Básica II"
"Bioquímica 2"
"Etica II"
"Projeto e desenvolvimento 1"
"Climatologia 2"
"Geologia 2"
"Arte Contemporanea II"
"Microbiologia"
"Teoria e Prática do Treinamento II"
*/

--c)
SELECT DISTINCT disciplina.nome
	 FROM disciplina,pre_requisito,faculdade
	 WHERE disciplina.codigo = pre_requisito.cod_disc
	 AND disciplina.fac_disc <> faculdade.sigla;
/*
"Enfermagem Médica"
"Unidade de Saúde Humana I (USH1)"
"Algoritmo e Estrutura de Dados 1"
"Direito Digital"
"Comportamento Motor "
"Fundamentos de Matemática Elementar II"
"Imunologia"
"Física Básica III"
"Agrometeorologia"
"Didática Geral II"
"Historia da Arte II"
"Algoritmo e Estrutura de Dados 2"
"Cálculo Diferencial e Integral II"
"Anatomia dos Animais Domésticos"
"Direito do Trabalho 2"
"Saúde Coletiva II"
"Física Básica II"
"Bioquímica 2"
"Etica II"
"Projeto e desenvolvimento 1"
"Climatologia 2"
"Geologia 2"
"Arte Contemporanea II"
"Microbiologia"
"Teoria e Prática do Treinamento II"
*/

--d)
SELECT estudante.nome,estudante.fac_est,professor.nome,professor.fac_prof
	FROM estudante,professor,faculdade fac_estudante, faculdade fac_professor
	WHERE estudante.fac_est = fac_estudante.sigla
	AND professor.fac_prof = fac_professor.sigla
	AND professor.id = estudante.tutor;
/*
"Pedro Henrique Silva"	"FACOM"	"Marcelo Keese Albertini"	"FACOM"
"Gabriel Borges Júnior"	"FACOM"	"Rivalino Matias Júnior"	"FACOM"
"Amanda Gomes de Oliveira"	"FACOM"	"André Backes"	"FACOM"
"Jorge Antônio Santos"	"FACOM"	"Bruno Augusto Nassif Travençolo"	"FACOM"
"Bruna Tobias Pinto"	"FACOM"	"Luiz Gustavo Almeida Martins"	"FACOM"
"Jonas Caravalho"	"INBIO"	"Ailton Gonçalves Rodrigues Junior"	"INBIO"
"Ana Silveira"	"INBIO"	"Jeamylle Nilin Gonçalves"	"INBIO"
"Guilherme da Cunha"	"INBIO"	"Ariádine Cristine de Almeida"	"INBIO"
"Davi Lucca Duarte"	"INBIO"	"Ailton Gonçalves Rodrigues Junior"	"INBIO"
"Henrique Corrêa de Oliveira"	"FACOM"	"Alexsandro Soares"	"FACOM"
"Gabriel de Araujo"	"FACOM"	"Pedro Frosi"	"FACOM"
"Luisa Gomes Ferreira"	"FACOM"	"Elaine Ribeiro"	"FACOM"
"Gabriela Pereira"	"FACOM"	"Jean Ponciano"	"FACOM"
"Gabriel Alves"	"FACOM"	"Marcia Aparecida Fernandes"	"FACOM"
"Joao Vitor Correia"	"FAMAT"	"Taciana Oliveira Souza"	"FAMAT"
"Marina Silva Gomes"	"FAMAT"	"Fernando Rodrigo Rafaeli"	"FAMAT"
"Maria Julia Oliveira"	"FAMAT"	"Camila Mariana Ruiz"	"FAMAT"
"Vicente Araujo Mendes"	"FAMAT"	"Admilson Lopes dos Santos"	"FAMAT"
"Alexandre Oliveira Rodrigues"	"FAMAT"	"Adriana Rodrigues da Silva"	"FAMAT"
"Vinicius Ribeiro"	"FOUFU"	"Adriano Mota Loyola"	"FOUFU"
"César Bertolin"	"FOUFU"	"Alessandra Maia de Castro Prado"	"FOUFU"
"Bruno José"	"FOUFU"	"Álex Moreira Herval"	"FOUFU"
"Elaine Maria"	"FOUFU"	"Ana Paula Turrioni Hidalgo"	"FOUFU"
"Carlos Silva"	"FOUFU"	"Ana Paula de Lima Oliveira"	"FOUFU"
"Isabella Melo Sousa"	"IARTE"	"Belchior de Sousa"	"IARTE"
"Jose Almeida Azevedo"	"IARTE"	"Elsieni Coelho da Silva"	"IARTE"
"Aline Oliveira Araujo"	"IARTE"	"Belchior de Sousa"	"IARTE"
"Andre Silva Martins"	"IARTE"	"Gastao da Cunha Frota"	"IARTE"
"Lavinia Sousa Carvalho"	"IARTE"	"Belchior de Sousa"	"IARTE"
"Victor Guilherme Oliveira Santos"	"ESTES"	"Adriana Pastorello Buim Arena"	"ESTES"
"Sara Pelegrineti de José"	"ESTES"	"Aldeci Cacique Calixto"	"ESTES"
"Davi Rui Pasquim"	"ESTES"	"Aléxia Pádua Franco"	"ESTES"
"Diego Ruas"	"ESTES"	"Ana Beatriz da Silva Duarte"	"ESTES"
"Pedro Tiene Silva"	"ESTES"	"Andrea Maturano Longarezi"	"ESTES"
"Jason Manmoa"	"FAEDU"	"Jailson Mendes"	"FAEDU"
"Scott Pilgrim"	"FAEDU"	"Gabriel Jesus"	"FAEDU"
"Naruto Uzumaki"	"FAEDU"	"Gabriel Jesus"	"FAEDU"
"Frederico Krueger"	"FAEDU"	"João Guilherme"	"FAEDU"
"Jason Thirtenn"	"FAEDU"	"João Guilherme"	"FAEDU"
"Aline Ferreira Magalhaes"	"IFILO"	"Alcino Eduardo Bonella"	"IFILO"
"Cristiano Bueno de Almeida"	"IFILO"	"Alcino Eduardo Bonella"	"IFILO"
"Derli Luis Arantes Junior"	"IFILO"	"Anselmo Tadeu Ferreira"	"IFILO"
"Gladston Marcelo Pereira do Vale"	"IFILO"	"Anselmo Tadeu Ferreira"	"IFILO"
"Kamila Stephany Alves Santos"	"IFILO"	"Ana Maria Said"	"IFILO"
"Alexandre Borba Chiqueta"	"FACOM"	"Gina Maira"	"FACOM"
"Flávio Fernandes"	"FACOM"	"Gina Maira"	"FACOM"
"Gabrel Toledo"	"FACOM"	"Rivalino Matias Júnior"	"FACOM"
"Nicolas Paolinelli"	"FACOM"	"Gina Maira"	"FACOM"
"Matheus Brasileiro Aguiar"	"FACOM"	"Bruno Augusto Nassif Travençolo"	"FACOM"
"Pedro Nunes"	"FAMEV"	"Kelly Aparecida Geraldo Yoneyama Tudini"	"FAMEV"
"Maria Ferreira"	"FAMEV"	"Neide Maria da Silva "	"FAMEV"
"Elaine Ribeiro de Faria Paiva"	"FADIR"	"Daniela de Melo Crosara"	"FADIR"
"Fernando Souza"	"FADIR"	"Daniela de Melo Crosara"	"FADIR"
"Rafael Silva"	"FADIR"	"Fernando Rodrigues Martins"	"FADIR"
"João Marcos Ramos"	"FADIR"	"Fernando Rodrigues Martins"	"FADIR"
"Marcos Estefam"	"FADIR"	"Fernando Rodrigues Martins"	"FADIR"
"Neil Gaiman"	"INFIS"	"Ademir Cavalheiro"	"INFIS"
"Robert Louis Stevenson"	"INFIS"	"Adevailton Bernardo dos Santos"	"INFIS"
"Anne Rice"	"INFIS"	"Alessandra Riposati Arantes"	"INFIS"
"Bram Stocker"	"INFIS"	"Alessandra Riposati Arantes"	"INFIS"
"Marry Shelley"	"INFIS"	"Djalmir Nestor Messias"	"INFIS"
"Peter Benjamin Parker"	"ICBIM"	"Disney Oliver"	"ICBIM"
"Peter Kavinsky"	"ICBIM"	"Henrique Tomaz Gonzaga"	"ICBIM"
"Lara Jean"	"ICBIM"	"Alberto da Silva Morais"	"ICBIM"
"Percy Jackson"	"ICBIM"	"Daniela Cristina de Oliveira"	"ICBIM"
"Veronica Lodge"	"ICBIM"	"Carlos Hernrique Gomes"	"ICBIM"
"Annelise Salem"	"ICIAG"	"Jamil Salem"	"ICIAG"
"Gabriel Hugo Borges"	"ICIAG"	"Julia Vingadora"	"ICIAG"
"Gustavo Duarte Gomides"	"ESTES"	"Tatiana Carneiro de Resende"	"ESTES"
"Rodrigo Alves da Silva"	"ESTES"	"Lilian Rodrigues Sant’ Anna Campos"	"ESTES"
"Julia Echeverria"	"ESTES"	"Marisa Aparecida Elias"	"ESTES"
"Guilherme Duarte"	"ESTES"	"Tatiana Carneiro de Resende"	"ESTES"
"Rodrigo da Silva"	"ESTES"	"Lilian Rodrigues Sant’ Anna Campos"	"ESTES"
"Rafael Henrique Guimarães"	"FACIP"	"Alex Fernando Borges"	"FACIP"
"Felipe Langer"	"FACIP"	"Alex Fernando Borges"	"FACIP"
"Lucas Daniel Cunha"	"FACIP"	"Alexandre Alves Alvenha"	"FACIP"
"Laura Rezende Teixeira Santos"	"FACIP"	"Alexandre Cacheffo"	"FACIP"
"Mariana Serrano Guimaraes"	"FACIP"	"Alexandre Calzavara Yoshida"	"FACIP"
*/

--e)
	SELECT estudante.nome as nome_est,
	fac_est.nome as fac_aluno,
	professor.nome as nome_prof,
	fac_prof.nome as fac_professor
	FROM faculdade fac_est, faculdade fac_prof, professor, estudante
	WHERE professor.id = estudante.tutor AND
	estudante.fac_est = fac_est.sigla AND
	professor.fac_prof = fac_prof.sigla AND
	fac_est.nome <> fac_prof.nome;


--f)

--g)
	
	

--16)
--a)
	SELECT professor.nome AS nome_professor,
	estudante.nome AS nome_aluno
	FROM estudante
	RIGHT OUTER JOIN
	professor ON estudante.tutor = professor.id;
	
/*
"Marcelo Keese Albertini"	"Pedro Henrique Silva"
"Rivalino Matias Júnior"	"Gabriel Borges Júnior"
"André Backes"	"Amanda Gomes de Oliveira"
"Bruno Augusto Nassif Travençolo"	"Jorge Antônio Santos"
"Luiz Gustavo Almeida Martins"	"Bruna Tobias Pinto"
"Ailton Gonçalves Rodrigues Junior"	"Jonas Caravalho"
"Jeamylle Nilin Gonçalves"	"Ana Silveira"
"Ariádine Cristine de Almeida"	"Guilherme da Cunha"
"Ailton Gonçalves Rodrigues Junior"	"Davi Lucca Duarte"
"Alexsandro Soares"	"Henrique Corrêa de Oliveira"
"Pedro Frosi"	"Gabriel de Araujo"
"Elaine Ribeiro"	"Luisa Gomes Ferreira"
"Jean Ponciano"	"Gabriela Pereira"
"Marcia Aparecida Fernandes"	"Gabriel Alves"
"Taciana Oliveira Souza"	"Joao Vitor Correia"
"Fernando Rodrigo Rafaeli"	"Marina Silva Gomes"
"Camila Mariana Ruiz"	"Maria Julia Oliveira"
"Admilson Lopes dos Santos"	"Vicente Araujo Mendes"
"Adriana Rodrigues da Silva"	"Alexandre Oliveira Rodrigues"
"Adriano Mota Loyola"	"Vinicius Ribeiro"
"Alessandra Maia de Castro Prado"	"César Bertolin"
"Álex Moreira Herval"	"Bruno José"
"Ana Paula Turrioni Hidalgo"	"Elaine Maria"
"Ana Paula de Lima Oliveira"	"Carlos Silva"
"Belchior de Sousa"	"Isabella Melo Sousa"
"Elsieni Coelho da Silva"	"Jose Almeida Azevedo"
"Belchior de Sousa"	"Aline Oliveira Araujo"
"Gastao da Cunha Frota"	"Andre Silva Martins"
"Belchior de Sousa"	"Lavinia Sousa Carvalho"
"Adriana Pastorello Buim Arena"	"Victor Guilherme Oliveira Santos"
"Aldeci Cacique Calixto"	"Sara Pelegrineti de José"
"Aléxia Pádua Franco"	"Davi Rui Pasquim"
"Ana Beatriz da Silva Duarte"	"Diego Ruas"
"Andrea Maturano Longarezi"	"Pedro Tiene Silva"
"Jailson Mendes"	"Jason Manmoa"
"Gabriel Jesus"	"Scott Pilgrim"
"Gabriel Jesus"	"Naruto Uzumaki"
"João Guilherme"	"Frederico Krueger"
"João Guilherme"	"Jason Thirtenn"
"Alcino Eduardo Bonella"	"Aline Ferreira Magalhaes"
"Alcino Eduardo Bonella"	"Cristiano Bueno de Almeida"
"Anselmo Tadeu Ferreira"	"Derli Luis Arantes Junior"
"Anselmo Tadeu Ferreira"	"Gladston Marcelo Pereira do Vale"
"Ana Maria Said"	"Kamila Stephany Alves Santos"
"Gina Maira"	"Alexandre Borba Chiqueta"
"Gina Maira"	"Flávio Fernandes"
"Rivalino Matias Júnior"	"Gabrel Toledo"
"Gina Maira"	"Nicolas Paolinelli"
"Bruno Augusto Nassif Travençolo"	"Matheus Brasileiro Aguiar"
"Kelly Aparecida Geraldo Yoneyama Tudini"	"Pedro Nunes"
"Neide Maria da Silva "	"Maria Ferreira"
"Daniela de Melo Crosara"	"Elaine Ribeiro de Faria Paiva"
"Daniela de Melo Crosara"	"Fernando Souza"
"Fernando Rodrigues Martins"	"Rafael Silva"
"Fernando Rodrigues Martins"	"João Marcos Ramos"
"Fernando Rodrigues Martins"	"Marcos Estefam"
"Ademir Cavalheiro"	"Neil Gaiman"
"Adevailton Bernardo dos Santos"	"Robert Louis Stevenson"
"Alessandra Riposati Arantes"	"Anne Rice"
"Alessandra Riposati Arantes"	"Bram Stocker"
"Djalmir Nestor Messias"	"Marry Shelley"
"Disney Oliver"	"Peter Benjamin Parker"
"Henrique Tomaz Gonzaga"	"Peter Kavinsky"
"Alberto da Silva Morais"	"Lara Jean"
"Daniela Cristina de Oliveira"	"Percy Jackson"
"Carlos Hernrique Gomes"	"Veronica Lodge"
"Jamil Salem"	"Annelise Salem"
"Julia Vingadora"	"Gabriel Hugo Borges"
"Tatiana Carneiro de Resende"	"Gustavo Duarte Gomides"
"Lilian Rodrigues Sant’ Anna Campos"	"Rodrigo Alves da Silva"
"Marisa Aparecida Elias"	"Julia Echeverria"
"Tatiana Carneiro de Resende"	"Guilherme Duarte"
"Lilian Rodrigues Sant’ Anna Campos"	"Rodrigo da Silva"
"Alex Fernando Borges"	"Rafael Henrique Guimarães"
"Alex Fernando Borges"	"Felipe Langer"
"Alexandre Alves Alvenha"	"Lucas Daniel Cunha"
"Alexandre Cacheffo"	"Laura Rezende Teixeira Santos"
"Alexandre Calzavara Yoshida"	"Mariana Serrano Guimaraes"
"Beatriz Corrêa Camargo"	
"Marcel Novaes"	
"Lucas de Assis Ribeiro"	
"Alexandre Garrido da Silva"	
"Cláudio Assembly"	
"Barbara Dias Rezende Gontijo"	
"Gustavo de Carvalho Marin"	
"Luciano Hulk"	
"Natália Mundim Tôrres"	
"Clelia Regina Cafer"	
"Elaine Java"	
"Renato Palumbo Doria"	
"Péricles Mendes"	
"Roberto Carlos"	
"Tiago Wilson Patriarca Mineo "	
"Dennys Garcia Xavier"	
"Alexandre Guimarães Tadeu de Soares"	
"Giuliano Buzá Jacobucci"	
"Nikoleta Tzvetanova Kerinska"	
"Cassiano Aimberê Dorneles Welker"	
"Alessandro Gomes Enoque"	
*/

--b)
	SELECT disc.nome AS nome_disciplina,
	disc_pre.nome AS nome_prereq
	FROM pre_requisito
	LEFT OUTER JOIN
	disciplina disc_pre ON disc_pre.codigo = pre_requisito.cod_pre
	LEFT OUTER JOIN
	disciplina disc ON disc.codigo = pre_requisito.cod_disc;
/*
"Comportamento Motor "	"Fisiologia do Exercício"
"Algoritmo e Estrutura de Dados 1"	"Programação Procedimental"
"Algoritmo e Estrutura de Dados 2"	"Algoritmo e Estrutura de Dados 1"
"Bioquímica 2"	"Bioquímica 1"
"Anatomia dos Animais Domésticos"	"Fundamentos de Anatomia Veterinária"
"Etica II"	"Ética"
"Didática Geral II"	"Didática Geral"
"Historia da Arte II"	"Historia da Arte I"
"Arte Contemporanea II"	"Arte Contemporanea I"
"Direito Digital"	"Teoria do Direito"
"Direito do Trabalho 2"	"Direito do Trabalho 1"
"Física Básica II"	"Física Básica I"
"Física Básica III"	"Física Básica II"
"Imunologia"	"Analises Clinicas"
"Microbiologia"	"Genetica"
"Agrometeorologia"	"Irrigação e Drenagem"
"Agrometeorologia"	"Manejo e Conservação do Solo e da Água"
"Saúde Coletiva II"	"Saúde Coletiva I"
"Enfermagem Médica"	"Fundamentos em Enfermagem"
"Geologia 2"	"Geologia 1"
"Climatologia 2"	"Climatologia 1"
"Fundamentos de Matemática Elementar II"	"Fundamentos de Matemática Elementar I"
"Cálculo Diferencial e Integral II"	"Cálculo Diferencial e Integral I"
"Projeto e desenvolvimento 1"	"Sistemas de Banco de Dados"
"Unidade de Saúde Humana I (USH1)"	"Unidade de Constituição do Organismo"
"Teoria e Prática do Treinamento II"	"Teoria e Prática do Treinamento I"
*/
	
	
--c)
	SELECT nome AS prof_nome,
	turma, semestre, ano, coalesce(cod_disc,'<professor sem disciplina>')
	FROM professor
	LEFT OUTER JOIN
	ensina ON professor.id = ensina.id_prof
	LEFT OUTER JOIN
	turma ON ensina.id_turma = turma.id;
	
/*
"Gina Maira"	"63"	2	2020	"GBC034"
"Marcelo Keese Albertini"	"67"	2	2022	"GBC045"
"Rivalino Matias Júnior"	"64"	1	2021	"GBC034"
"André Backes"	"66"	1	2022	"GBC023"
"Bruno Augusto Nassif Travençolo"	"65"	2	2021	"GBC024"
"Alexandre Garrido da Silva"	"D1"	2	2022	"FADIR3"
"Alexandre Garrido da Silva"	"D1"	2	2020	"FADIR4"
"Beatriz Corrêa Camargo"	"D1"	2	2022	"FADIR3"
"Beatriz Corrêa Camargo"	"D2"	1	2021	"FADIR5"
"Daniela de Melo Crosara"	"D3"	2	2022	"FADIR6"
"Daniela de Melo Crosara"	"D2"	1	2021	"FADIR5"
"Daniela de Melo Crosara"	"D4"	1	2022	"FADIR6"
"Fernando Rodrigues Martins"	"D2"	1	2021	"FADIR5"
"Fernando Rodrigues Martins"	"D3"	2	2022	"FADIR6"
"Fernando Rodrigues Martins"	"D4"	1	2022	"FADIR6"
"Gustavo de Carvalho Marin"	"D1"	2	2020	"FADIR4"
"Gustavo de Carvalho Marin"	"D2"	1	2021	"FADIR5"
"Gustavo de Carvalho Marin"	"D4"	1	2022	"FADIR6"
"Ademir Cavalheiro"	"A1"	2	2020	"310   "
"Ademir Cavalheiro"	"B1"	3	2020	"311   "
"Adevailton Bernardo dos Santos"	"A2"	2	2020	"310   "
"Alessandra Riposati Arantes"	"C1"	4	2021	"312   "
"Djalmir Nestor Messias"	"D1"	1	2021	"313   "
"Marcel Novaes"	"E1"	4	2021	"314   "
"Alberto da Silva Morais"	"A "	1	2022	"2000  "
"Carlos Hernrique Gomes"	"B "	1	2022	"2001  "
"Daniela Cristina de Oliveira"	"C "	1	2022	"2002  "
"Disney Oliver"	"D "	1	2022	"2003  "
"Henrique Tomaz Gonzaga"	"E "	1	2022	"2004  "
"Jamil Salem"	"01"	20211	2021	"1801  "
"Jamil Salem"	"02"	20212	2021	"1801  "
"Julia Vingadora"	"03"	20221	2022	"1803  "
"Roberto Carlos"	"04"	20222	2022	"1804  "
"Cláudio Assembly"	"05"	20231	2023	"1802  "
"Elaine Java"	"06"	20232	2023	"1805  "
"Lilian Rodrigues Sant’ Anna Campos"	"1A"	1	2022	"ESTES1"
"Clelia Regina Cafer"	"1B"	1	2022	"ESTES1"
"Marisa Aparecida Elias"	"1A"	1	2022	"ESTES2"
"Marisa Aparecida Elias"	"1A"	1	2022	"ESTES3"
"Barbara Dias Rezende Gontijo"	"1A"	2	2022	"ESTES4"
"Tatiana Carneiro de Resende"	"1A"	2	2022	"ESTES5"
"Alessandro Gomes Enoque"	"33"	1	2022	"GGO002"
"Alex Fernando Borges"	"33"	2	2022	"GGO012"
"Alexandre Alves Alvenha"	"31"	1	2021	"GGO001"
"Alexandre Cacheffo"	"31"	2	2021	"GGO011"
"Alexandre Calzavara Yoshida"	"29"	2	2020	"GGO012"
"Kelly Aparecida Geraldo Yoneyama Tudini"	"A "	1	2022	"GMV003"
"Lucas de Assis Ribeiro"	"A "	1	2022	"GMV003"
"Natália Mundim Tôrres"	"B "	1	2022	"GMV007"
"Tiago Wilson Patriarca Mineo "	"C "	1	2022	"GMV005"
"Neide Maria da Silva "	"A "	1	2022	"GMV003"
"Ailton Gonçalves Rodrigues Junior"	"C "	1	2022	"31505 "
"Ariádine Cristine de Almeida"	"C "	1	2022	"39030 "
"Ariádine Cristine de Almeida"	"C "	1	2022	"31104 "
"Cassiano Aimberê Dorneles Welker"	"C "	1	2022	"31407 "
"Giuliano Buzá Jacobucci"	"D "	1	2022	"31505 "
"Alcino Eduardo Bonella"	"A "	1	2022	"1410  "
"Alexandre Guimarães Tadeu de Soares"	"A "	1	2022	"1412  "
"Ana Maria Said"	"A "	1	2022	"1410  "
"Anselmo Tadeu Ferreira"	"A "	1	2022	"1411  "
"Dennys Garcia Xavier"	"A "	1	2022	"1412  "
"Belchior de Sousa"	"55"	1	2015	"GAV001"
"Elsieni Coelho da Silva"	"57"	2	2016	"GAV007"
"Gastao da Cunha Frota"	"59"	1	2017	"GAV013"
"Elsieni Coelho da Silva"	"61"	2	2018	"GAV019"
"Renato Palumbo Doria"	"63"	1	2019	"GAV010"
"Admilson Lopes dos Santos"	"A "	1	2018	"MAT201"
"Adriana Rodrigues da Silva"	"B "	2	2019	"MAT211"
"Camila Mariana Ruiz"	"C "	3	2020	"MAT212"
"Fernando Rodrigo Rafaeli"	"D "	4	2021	"MAT213"
"Taciana Oliveira Souza"	"E "	5	2022	"MAT214"
"Taciana Oliveira Souza"	"F "	6	2022	"MAT214"
"Jean Ponciano"	"02"	2	2022	"GBC043"
"Elaine Ribeiro"	"03"	2	2022	"GSI023"
"Alexsandro Soares"	"04"	2	2022	"GSI034"
"Pedro Frosi"	"05"	2	2022	"GSI027"
"Marcia Aparecida Fernandes"	"03"	2	2022	"GSI023"
"Adriano Mota Loyola"	"17"	12022	2022	"GOG001"
"Alessandra Maia de Castro Prado"	"17"	12021	2021	"GOG001"
"Adriana Pastorello Buim Arena"	"65"	2	2020	"410   "
"Aldeci Cacique Calixto"	"66"	1	2020	"410   "
"Aléxia Pádua Franco"	"67"	2	2020	"411   "
"Ana Beatriz da Silva Duarte"	"68"	1	2021	"412   "
"Andrea Maturano Longarezi"	"69"	2	2021	"413   "
"Jailson Mendes"	"00"	2	1982	"GEDU31"
"Gabriel Jesus"	"01"	1	1983	"GEDU32"
"Luciano Hulk"	"02"	2	1983	"GEDU41"
"João Guilherme"	"03"	2	1990	"GEDU42"
"Péricles Mendes"	"05"	2	1995	"GEDU43"
"Álex Moreira Herval"				"<professor sem disciplina>"
"Ana Paula de Lima Oliveira"				"<professor sem disciplina>"
"Ana Paula Turrioni Hidalgo"				"<professor sem disciplina>"
"Luiz Gustavo Almeida Martins"				"<professor sem disciplina>"
"Jeamylle Nilin Gonçalves"				"<professor sem disciplina>"
"Nikoleta Tzvetanova Kerinska"				"<professor sem disciplina>"			
*/
	
--d)
	SELECT disciplina.nome as nome_disc
	FROM disciplina
	FULL OUTER JOIN
	pre_requisito ON pre_requisito.cod_pre = disciplina.codigo
	WHERE cod_pre IS NULL;
/*
"Comportamento Motor "
"Algoritmo e Estrutura de Dados 2"
"Programação Orientada a Objetos"
"Lógica"
"Lógica para Programação"
"Cálculo 1"
"Arquitetura e Organização de Computadores"
"Bioquímica 2"
"Anatomia dos Animais Domésticos"
"Citologia, Histologia e Embriologia"
"Filosofia Geral: Problemas Metafísicos"
"História da Filosofia Medieval"
"Psicologia da Educação"
"Etica II"
"Didática Geral II"
"Historia da Arte II"
"Arte Contemporanea II"
"Arte Computacional"
"Avaliação de Impactos Ambiental para Biólogos"
"Biologia e Cultura - (PROINTER III)"
"Construção do Conhecimento Científico"
"Evolução"
"Profissão Biólogo"
"Direito Digital"
"Direito do Trabalho 2"
"Direito Financeiro"
"Física Básica III"
"Geometrica Analítica"
"Algoritmos e Programação de Computadores"
"Imunologia"
"Microbiologia"
"Biossegurança"
"Construções Rurais"
"Adubos e Adubação"
"Agrometeorologia"
"Saúde Coletiva II"
"Enfermagem Médica"
"Psicologia e Ética"
"Teoria e método em Geografia"
"Cartografia"
"PIPE 1"
"Geologia 2"
"Climatologia 2"
"Fundamentos de Matemática Elementar II"
"Cálculo Diferencial e Integral II"
"Geometria Analitica"
"Redes de computadores"
"Projeto e desenvolvimento 1"
"Engenharia de Software"
"Otimização"
"Unidade de Funcionamento do Organismo I"
"Un. de Reabilitação Integral do Ap. Estomatognático I"
"Unidade de Investigação Científica I (UIC1)"
"Unidade de Saúde Humana I (USH1)"
"Metodologia do Ensino de Ciência"
"Estágio Supervisionado I"
"Construção do Discurso Escrito"
"Metodologia do Ensino da Língua Portuguesa"
"Filosofia da Educação"
"Ritmo e Expressão"
"Teoria e Prática do Treinamento II"
*/

--e)
	SELECT nome
	FROM frequenta
	LEFT OUTER JOIN
	estudante ON estudante.id = frequenta.id_est
	LEFT OUTER JOIN
	turma ON frequenta.id_turma = turma.id
	WHERE frequenta.id_turma IS NULL;
	--nenhum aluno retornado
	
--f)
	SELECT turma.id, turma, semestre, ano, cod_disc, predio_s, n_sala
	FROM turma
	FULL OUTER JOIN
	horario_aula ON horario_aula.id_turma = turma.id
	FULL OUTER JOIN
	semana ON semana.id_sem = horario_aula.id_sem
	FULL OUTER JOIN
	frequenta ON frequenta.id_turma = turma.id
	FULL OUTER JOIN 
	estudante ON estudante.id = frequenta.id_est
	WHERE descricao ='Segunda' OR descricao = 'Quinta' AND id_est IS NULL;

/*
1720	"C "	1	2022	"31505 "	"8C   "	119
1720	"C "	1	2022	"31505 "	"8C   "	119
1720	"C "	1	2022	"31505 "	"8C   "	119
1720	"C "	1	2022	"31505 "	"8C   "	119
1417	"A "	1	2022	"1410  "	"1U   "	204
1417	"A "	1	2022	"1410  "	"1U   "	204
1418	"A "	1	2022	"1411  "	"5O-A "	206
20	"57"	2	2016	"GAV007"	"5S   "	205
218	"A "	1	2018	"MAT201"	"1F   "	215
1	"01"	1	2022	"GBC043"	"1BBSI"	127
1501	"17"	12021	2021	"GOG001"	"UMU4L"	39
430	"65"	2	2020	"410   "	"1G   "	101
431	"66"	1	2020	"410   "	"1G   "	101
432	"67"	2	2020	"411   "	"1G   "	102
433	"68"	1	2021	"412   "	"1G   "	103
434	"69"	2	2021	"413   "	"1G   "	104
400	"00"	2	1982	"GEDU31"	"1A   "	490
154	"64"	1	2021	"GBC034"	"1B   "	203
154	"64"	1	2021	"GBC034"	"1B   "	203
155	"63"	2	2020	"GBC034"	"1B   "	204
155	"63"	2	2020	"GBC034"	"1B   "	204
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
651	"D1"	2	2020	"FADIR4"	"3D   "	104
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
650	"D1"	2	2022	"FADIR3"	"3D   "	102
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
650	"D1"	2	2022	"FADIR3"	"3D   "	102
651	"D1"	2	2020	"FADIR4"	"3D   "	104
315	"A1"	2	2020	"310   "	"1X   "	2
2019	"E "	1	2022	"2004  "	"2A   "	5
1817	"01"	20211	2021	"1801  "	"2E   "	201
1817	"01"	20211	2021	"1801  "	"2E   "	201
1818	"02"	20212	2021	"1801  "	"2E   "	201
920	"1A"	1	2022	"ESTES1"	"4K   "	205
922	"1A"	1	2022	"ESTES2"	"4K   "	206
511	"33"	1	2022	"GGO002"	"3K   "	101
403	"03"	2	1990	"GEDU42"	"1A   "	491
1303	"D "	1	2022	"GMV006"	"1BCG "	103
2018	"D "	1	2022	"2003  "	"2A   "	4
*/