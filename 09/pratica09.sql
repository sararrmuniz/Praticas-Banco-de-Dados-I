/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;

--17)
--(a) Listar o nome das disciplinas que não possuem pré-requisitos
SELECT nome
FROM disciplina
WHERE codigo NOT IN(SELECT cod_disc FROM pre_requisito);
/*
"Programação Procedimental"
"Programação Orientada a Objetos"
"Lógica"
"Lógica para Programação"
"Cálculo 1"
"Arquitetura e Organização de Computadores"
"Bioquímica 1"
"Fundamentos de Anatomia Veterinária"
"Citologia, Histologia e Embriologia"
"Filosofia Geral: Problemas Metafísicos"
"História da Filosofia Medieval"
"Ética"
"Psicologia da Educação"
"Didática Geral"
"Historia da Arte I"
"Arte Contemporanea I"
"Arte Computacional"
"Avaliação de Impactos Ambiental para Biólogos"
"Biologia e Cultura - (PROINTER III)"
"Construção do Conhecimento Científico"
"Evolução"
"Profissão Biólogo"
"Teoria do Direito"
"Direito do Trabalho 1"
"Direito Financeiro"
"Física Básica I"
"Geometrica Analítica"
"Algoritmos e Programação de Computadores"
"Analises Clinicas"
"Genetica"
"Biossegurança"
"Construções Rurais"
"Adubos e Adubação"
"Manejo e Conservação do Solo e da Água"
"Irrigação e Drenagem"
"Fundamentos em Enfermagem"
"Saúde Coletiva I"
"Psicologia e Ética"
"Geologia 1"
"Climatologia 1"
"Teoria e método em Geografia"
"Cartografia"
"PIPE 1"
"Fundamentos de Matemática Elementar I"
"Cálculo Diferencial e Integral I"
"Geometria Analitica"
"Sistemas de Banco de Dados"
"Redes de computadores"
"Engenharia de Software"
"Otimização"
"Unidade de Constituição do Organismo"
"Unidade de Funcionamento do Organismo I"
"Un. de Reabilitação Integral do Ap. Estomatognático I"
"Unidade de Investigação Científica I (UIC1)"
"Metodologia do Ensino de Ciência"
"Estágio Supervisionado I"
"Construção do Discurso Escrito"
"Metodologia do Ensino da Língua Portuguesa"
"Filosofia da Educação"
"Fisiologia do Exercício"
"Teoria e Prática do Treinamento I"
"Ritmo e Expressão"
*/

--(b) Listar as disciplinas que são pré-requisitos
SELECT nome
FROM disciplina
WHERE codigo IN(SELECT cod_pre FROM pre_requisito);
/*
"Programação Procedimental"
"Algoritmo e Estrutura de Dados 1"
"Bioquímica 1"
"Fundamentos de Anatomia Veterinária"
"Ética"
"Didática Geral"
"Historia da Arte I"
"Arte Contemporanea I"
"Teoria do Direito"
"Direito do Trabalho 1"
"Física Básica I"
"Física Básica II"
"Analises Clinicas"
"Genetica"
"Manejo e Conservação do Solo e da Água"
"Irrigação e Drenagem"
"Fundamentos em Enfermagem"
"Saúde Coletiva I"
"Geologia 1"
"Climatologia 1"
"Fundamentos de Matemática Elementar I"
"Cálculo Diferencial e Integral I"
"Sistemas de Banco de Dados"
"Unidade de Constituição do Organismo"
"Fisiologia do Exercício"
"Teoria e Prática do Treinamento I"
*/

--(c) Listar o nome das disciplinas que não são pré-requisito de outras disciplinas
SELECT nome
FROM disciplina
WHERE codigo NOT IN(SELECT cod_pre FROM pre_requisito);
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

--(d) Listar o nome dos estudantes que não estão frequentando turmas
SELECT nome
FROM estudante
WHERE id NOT IN(SELECT id_est FROM frequenta);
/*
"Pedro Henrique Silva"
"Gabriel Borges Júnior"
"Amanda Gomes de Oliveira"
"Jorge Antônio Santos"
"Bruna Tobias Pinto"
"Vinicius Ribeiro"
"Bruno José"
"Carlos Silva"
*/

--(e) Listar o prédio e sala que estão vazios (sem nenhuma aula - dica: use parênteses nos atributos envolvidos no WHERE)
SELECT predio,numero
FROM sala
WHERE (predio,numero) NOT IN (SELECT predio_s,n_sala FROM turma WHERE predio_s is not null and n_sala is not null);
/*
"3D   "	106
"1G   "	105
*/

--(f) Listar os nomes e data de admissão dos professores que não ministraram nenhuma disciplina
SELECT nome,admissao
FROM professor
WHERE id NOT IN(SELECT id_prof FROM ensina);
/*
"Luiz Gustavo Almeida Martins"	"2008-05-04"
"Jeamylle Nilin Gonçalves"	"2019-02-28"
"Álex Moreira Herval"	"2019-06-18"
"Ana Paula Turrioni Hidalgo"	"2015-12-01"
"Ana Paula de Lima Oliveira"	"2014-04-01"
"Nikoleta Tzvetanova Kerinska"	"2018-08-10"
*/

--(g) Listar os nomes e data de admissão dos professores que não ministraram nenhuma disciplina no semestre atual (ano-semestre)
SELECT DISTINCT nome,admissao
FROM professor,turma
WHERE professor.id NOT IN(SELECT id_prof FROM ensina) AND semestre = 2 AND ano = 2022;
/*
"Ana Paula Turrioni Hidalgo"	"2015-12-01"
"Nikoleta Tzvetanova Kerinska"	"2018-08-10"
"Jeamylle Nilin Gonçalves"	"2019-02-28"
"Ana Paula de Lima Oliveira"	"2014-04-01"
"Álex Moreira Herval"	"2019-06-18"
"Luiz Gustavo Almeida Martins"	"2008-05-04"
*/

--(h) Listar as turmas que estão sem horário cadastrado
SELECT turma
FROM turma
WHERE turma.id IN(SELECT id_turma FROM horario_aula WHERE id_hora IS NULL);
--não houve retorno

--(i) Listar quais horários não estão sendo usados para ministrar as aulas
SELECT id_hora
FROM horario
WHERE id_hora IN(SELECT id_hora FROM horario_aula WHERE id_hora IS NULL);
/todos os horarios estão sendo usados/

--18)
--a)Mostre o número de Estudantes que estão cadastrados na base
	SELECT COUNT (*) FROM estudante;
--RESPOSTA: 85

--b)Mostre o número de Matrículas que existem na base
	SELECT COUNT (*) FROM frequenta;
--RESPOSTA: 99

--c)Faça o produto cartesiano entre as tabelas Estudante e Frequenta
	SELECT * FROM estudante, frequenta;

--d)Mostre o número de tuplas retornado pelo produto cartesiano. Explique o porquê deste número
	SELECT COUNT (*) FROM estudante, frequenta;
--RESPOSTA: 8415

--e) Refaça o produto cartesiano entre as tabelas Estudante e Frequenta utilizando o comando CROSS JOIN
	SELECT * FROM estudante CROSS JOIN frequenta;
	
--f)Faça o produto cartesiano entre as tabelas Estudante, Disciplina, Frequenta e Turma. Não utilize CROSS JOIN.
--Não mostrar o resultado, somente indicar o número de linhas obtidas e o tempo de execução.
	SELECT COUNT (*) FROM estudante, disciplina, frequenta, turma;
--RESPOSTA: 65157345

--19)
--a) Mostrar o horário mais cedo que existe
	SELECT MIN(hora_inicio) FROM horario;
--"07:10:00"	

--b) Mostrar o CRA médio de todos os estudantes
	SELECT AVG(cra) AS cra_media FROM estudante;
--RESPOSTA: 81.60070612290326

--c) Mostrar a média e o desvio padrão do CRA de todos os alunos
	SELECT AVG(cra) AS media_cra, 
	STDDEV_SAMP(cra) AS dsv_padrao 
	FROM estudante;
--RESPOSTA: 81.60070612290326	81.78904861374602

--d) Mostrar a quantidade de professores do banco
	SELECT COUNT (*) FROM professor;
--RESPOSTA: 81

--e) Mostrar a quantidade de disciplinas da 'FACOM'
	SELECT COUNT (*) FROM disciplina WHERE fac_disc ='FACOM';
--RESPOSTA: 13

--f) Mostrar a quantidade de estudantes que fazem iniciação científica (possuem tutores)
	SELECT COUNT (tutor) FROM estudante;
--RESPOSTA: 78

--g) Mostrar a quantidade de orientadores de IC que existem
	SELECT COUNT( DISTINCT tutor)
	FROM estudante;
-- RESPOSTA = 60

--h)Mostrar a quantidade de professores que não são tutores de estudantes
	SELECT COUNT (*) FROM professor
	WHERE id NOT IN(SELECT tutor FROM estudante WHERE tutor IS NOT NULL);
--RESPOSTA = 21


--i) Mostrar os nomes e data de nascimento do(s) aluno(s) mais velho(s)
	SELECT nome, datanasc
	FROM estudante 
	WHERE datanasc IN(SELECT MIN (datanasc) FROM estudante);
--RESPOSTA: "Bruno José"	"1900-01-06" 

--j)
SELECT COUNT (*) FROM turma
	WHERE (predio_s,n_sala) IN (SELECT predio,numero FROM sala WHERE capacidade > 10);
--RESPOSTA = 86

--k) Mostrar a quantidade total de turmas das disciplinas da FAMAT
	SELECT COUNT(DISTINCT cod_disc) FROM turma,disciplina
	WHERE disciplina.fac_disc = 'FAMAT';
--RESPOSTA: 74

--m) Mostrar a quantidade de disciplinas que são pré-requisitos para outras disciplinas
	SELECT COUNT (codigo) FROM disciplina
	WHERE codigo IN (SELECT cod_pre FROM pre_requisito);
--RESPOSTA = 26
	
	
--n) Mostrar a quantidade de disciplinas que possuem pré-requisitos
	SELECT COUNT (cod_disc) FROM pre_requisito;
--RESPOSTA: 26

--o) Mostrar a quantidade de disciplinas que não possuem pré-requisitos
	SELECT COUNT (codigo)
	FROM disciplina
	WHERE codigo NOT IN(SELECT cod_disc FROM pre_requisito);
--RESPOSTA = 62


--20)
--a) Mostrar os nomes de todas as pessoas cadastradas no banco
	SELECT nome FROM professor 
	UNION 
	SELECT nome FROM estudante;
/*
"Elaine Ribeiro"
"Isabella Melo Sousa"
"Cassiano Aimberê Dorneles Welker"
"Fernando Rodrigo Rafaeli"
"Gabriela Pereira"
"Guilherme da Cunha"
"Beatriz Corrêa Camargo"
"Vinicius Ribeiro"
"Leandro Peres"
"Alexandre Borba Chiqueta"
"Scott Pilgrim"
"Mariana Serrano Guimaraes"
"Clelia Regina Cafer"
"Bruno Augusto Nassif Travençolo"
"Alexandre Alves Alvenha"
"Neil Gaiman"
"Alexsandro Soares"
"Rodrigo Alves da Silva"
"Luciano Hulk"
"Alexandre Oliveira Rodrigues"
"Alexandre Cacheffo"
"Marry Shelley"
"Elaine Java"
"Jonas Caravalho"
"Henrique Corrêa de Oliveira"
"Giuliano Buzá Jacobucci"
"Carlos Silva"
"Ana Silveira"
"Victor Guilherme Oliveira Santos"
"Bram Stocker"
"Rivalino Matias Júnior"
"Laura Rezende Teixeira Santos"
"Cristiano Bueno de Almeida"
"Gustavo Duarte Gomides"
"Veronica Lodge"
"Bruno José"
"Julia Vingadora"
"Andrea Maturano Longarezi"
"Pedro Henrique Silva"
"Renato Palumbo Doria"
"Kamila Stephany Alves Santos"
"Jamil Salem"
"Sara Pelegrineti de José"
"Naruto Uzumaki"
"Ailton Gonçalves Rodrigues Junior"
"Felipe Langer"
"Victor Bagliano"
"Jeamylle Nilin Gonçalves"
"Rodrigo da Silva"
"César Bertolin"
"Marcia Aparecida Fernandes"
"Lara Jean"
"Aline Ferreira Magalhaes"
"Ana Maria Said"
"Pedro Nunes"
"Henrique Tomaz Gonzaga"
"Percy Jackson"
"Gabriel Borges Júnior"
"Dennys Garcia Xavier"
"Jason Thirtenn"
"Joao Vitor Correia"
"Admilson Lopes dos Santos"
"Anselmo Tadeu Ferreira"
"Adevailton Bernardo dos Santos"
"Gabriel Alves"
"Neide Maria da Silva "
"Nicolas Paolinelli"
"Ana Paula Turrioni Hidalgo"
"Lucas Daniel Cunha"
"Jose Almeida Azevedo"
"Rafael Silva"
"Elaine Maria"
"Adriana Pastorello Buim Arena"
"Vicente Araujo Mendes"
"Maria Julia Oliveira"
"Aline Oliveira Araujo"
"Peter Benjamin Parker"
"Gustavo de Carvalho Marin"
"Fernando Rodrigues Martins"
"Marina Silva Gomes"
"Luisa Gomes Ferreira"
"Ana Paula de Lima Oliveira"
"Aldeci Cacique Calixto"
"Belchior de Sousa"
"Andre Silva Martins"
"Gabriel Jesus"
"André Backes"
"Ana Paula Freitas"
"Gabrel Toledo"
"Augusto Pereira"
"Gladston Marcelo Pereira do Vale"
"Daniela de Melo Crosara"
"João Marcos Ramos"
"Daniela Cristina de Oliveira"
"Adriano Mota Loyola"
"Pedro Tiene Silva"
"Anne Rice"
"Péricles Mendes"
"Pedro Frosi"
"Julia Echeverria"
"Álex Moreira Herval"
"Alessandra Maia de Castro Prado"
"Jailson Mendes"
"Guilherme Duarte"
"João Augusto Silva"
"Roberto Carlos"
"Djalmir Nestor Messias"
"Luna da Conceição"
"Lucas de Assis Ribeiro"
"Alexandre Garrido da Silva"
"Barbara Dias Rezende Gontijo"
"Ana Beatriz da Silva Duarte"
"Tatiana Carneiro de Resende"
"Marcelo Keese Albertini"
"Disney Oliver"
"Matheus Brasileiro Aguiar"
"Fernando Souza"
"Maria Ferreira"
"Marcel Novaes"
"Tiago Wilson Patriarca Mineo "
"Jean Ponciano"
"Jason Manmoa"
"Bruna Tobias Pinto"
"Gina Maira"
"Alberto da Silva Morais"
"Elaine Ribeiro de Faria Paiva"
"Lavinia Sousa Carvalho"
"Alessandro Gomes Enoque"
"Gabriel Hugo Borges"
"Nikoleta Tzvetanova Kerinska"
"Robert Louis Stevenson"
"Alexandre Guimarães Tadeu de Soares"
"Jorge Antônio Santos"
"Aléxia Pádua Franco"
"Davi Rui Pasquim"
"Ademir Cavalheiro"
"Alexandre Calzavara Yoshida"
"Elsieni Coelho da Silva"
"Marcos Estefam"
"Flávio Fernandes"
"João Guilherme"
"Alessandra Riposati Arantes"
"Peter Kavinsky"
"Davi Lucca Duarte"
"Annelise Salem"
"Marisa Aparecida Elias"
"Kelly Aparecida Geraldo Yoneyama Tudini"
"Alex Fernando Borges"
"Frederico Krueger"
"Amanda Gomes de Oliveira"
"Carlos Hernrique Gomes"
"Adriana Rodrigues da Silva"
"Derli Luis Arantes Junior"
"Lilian Rodrigues Sant’ Anna Campos"
"Diego Ruas"
"Ariádine Cristine de Almeida"
"Natália Mundim Tôrres"
"Alcino Eduardo Bonella"
"Camila Mariana Ruiz"
"Cláudio Assembly"
"Rafael Henrique Guimarães"
"Gabriel de Araujo"
"Luiz Gustavo Almeida Martins"
"Marina Barcelos"
"Taciana Oliveira Souza"
"Gastao da Cunha Frota"
*/

--b) Mostrar os nomes dos professores e dos alunos que não ensinam/frequentam turmas
	SELECT nome
	FROM estudante 
	WHERE id NOT IN
			(SELECT id_est FROM frequenta)
	UNION
	SELECT nome
	FROM professor
	WHERE id NOT IN
		(SELECT id_prof FROM ensina);
/*
"Carlos Silva"
"Bruno José"
"Pedro Henrique Silva"
"Bruna Tobias Pinto"
"Jeamylle Nilin Gonçalves"
"Nikoleta Tzvetanova Kerinska"
"Jorge Antônio Santos"
"Gabriel Borges Júnior"
"Ana Paula Turrioni Hidalgo"
"Amanda Gomes de Oliveira"
"Ana Paula de Lima Oliveira"
"Luiz Gustavo Almeida Martins"
"Vinicius Ribeiro"
"Álex Moreira Herval"
*/

	
--c) Mostrar os IDs das turmas que possuem docentes, mas não possuem alunos frequentando
	SELECT id 
	FROM turma
	WHERE id IN(SELECT id_turma FROM ensina)
	INTERSECT
	SELECT id
	FROM turma 
	WHERE id NOT IN(SELECT id_turma FROM frequenta);
/*
1822
153
405
223
1500
403
1821
2018
1721
*/
	

--e) Mostrar os IDs das turmas que possuem docentes e que possuem alunos frequentando
	SELECT id AS id_turma
	FROM turma
	WHERE id IN(SELECT id_turma FROM ensina)
	INTERSECT
	SELECT id
	FROM turma 
	WHERE id IN(SELECT id_turma FROM frequenta);
--67
/*
652
1300
4
1817
10
511
1819
402
2017
431
514
433
220
1419
1720
400
2015
513
920
1302
219
221
320
50
430
512
155
317
2016
2
1418
1301
1723
401
2019
924
152
40
1818
1722
318
222
651
650
925
922
154
432
218
30
923
434
316
3
1501
20
1725
654
319
1417
921
5
653
315
1820
515
151
*/
	
--f)  Mostrar os IDs das turmas que possuem ou docentes ou alunos frequentando
	SELECT id AS id_turma
	FROM turma
	WHERE id IN(SELECT id_turma FROM ensina)
	UNION
	SELECT id
	FROM turma 
	WHERE id IN(SELECT id_turma FROM frequenta);
/*
652
1300
1817
511
2017
431
514
433
405
513
320
2016
2018
1301
1723
401
40
153
1722
650
30
3
1501
1725
404
921
5
1821
315
1820
515
151
4
10
1819
402
220
1419
1720
400
2015
920
223
1302
219
1724
221
50
430
512
155
317
2
1418
2019
924
1822
152
1818
318
222
651
925
922
154
432
218
923
434
1503
316
1500
403
20
654
319
1
1417
653
1721
*/
