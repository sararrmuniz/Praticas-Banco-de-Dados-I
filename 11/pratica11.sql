/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;

--23)
--a)Listar todos os prédios das faculdades.
SELECT predio
FROM faculdade
GROUP BY predio;
/*
"1E   "
"2D28 "
"3K   "
"1BCG "
"3D   "
"UMU4L"
"2A   "
"1A   "
"5S   "
"1DCG "
"1U   "
"2E   "
"1C   "
"4K   "
"1B   "
"1F   "
"1X   "
*/

--b) Listar todas as SIGLAS de faculdades. Comparar o tamanho da resposta com o número de faculdades e justificar.
SELECT sigla 
FROM faculdade
GROUP BY sigla;
/*
"FAMEV"
"INFIS"
"ESTES"
"FADIR"
"ICIAG"
"IARTE"
"IFILO"
"FACIP"
"FAMEC"
"FAMAT"
"FEELT"
"FACOM"
"FOUFU"
"FECIV"
"INBIO"
"ICBIM"
"FAEDU"
*/
SELECT COUNT(sigla) FROM faculdade;
--Resposta: 17

--c) Listar todos os semestres-ano que existem turmas
SELECT semestre,ano FROM turma
GROUP BY semestre,ano;
/*
1	2019
20232	2023
1	2022
20231	2023
12022	2022
2	2019
2	2022
1	2020
1	2015
5	2022
20212	2021
2	1983
22021	2021
6	2022
1	1983
1	2018
2	2020
2	2016
2	1990
22022	2022
12023	2023
2	1995
1	2017
4	2021
1	2021
20221	2022
2	1982
3	2020
20222	2022
20211	2021
12021	2021
2	2018
2	2021
*/

--d) Listar todos os prédios e salas que possuem turmas

SELECT predio_s, n_sala FROM turma 
WHERE id IS NOT NULL AND predio_s IS NOT NULL AND n_sala IS NOT NULL
GROUP BY predio_s, n_sala;
/*
"1B   "	203
"1G   "	103
"UMU1L"	37
"1U   "	204
"2A   "	5
"4K   "	456
"1A   "	492
"3D   "	102
"1X   "	2
"UMU3L"	38
"3K   "	101
"1F   "	215
"2A   "	4
"UMU4L"	39
"3D   "	104
"1BCG "	102
"1G   "	104
"3K   "	103
"2E   "	201
"2D   "	13
"1X   "	3
"3K   "	102
"2E   "	202
"2A   "	6
"1A   "	490
"5O-A "	207
"1BBSI"	127
"8C   "	322
"1BCG "	103
"4K   "	206
"1A   "	491
"1BBSI"	129
"2A   "	1
"2E   "	203
"8C   "	123
"8C   "	119
"2A   "	2
"4K   "	207
"1B   "	204
"1G   "	101
"5R   "	103
"5S   "	207
"1BCG "	101
"1F   "	216
"1F   "	217
"5O-A "	206
"8C   "	121
"5S   "	208
"2A   "	3
"1BBSI"	128
"1G   "	102
"1X   "	1
"5S   "	456
*/

--e) Listar todas as datas de nascimento, tutor e faculdade dos alunos
SELECT datanasc, tutor, fac_est
FROM estudante
GROUP BY
datanasc, tutor, fac_est;
/*
"1994-06-29"	"2006       "	"ICBIM"
"2000-11-08"	"302        "	"INFIS"
"2003-08-13"	"503        "	"FACIP"
"1998-11-20"	"400        "	"ESTES"
"2000-07-07"	"10000000000"	"FACOM"
"2000-10-04"	"302        "	"INFIS"
"1999-11-02"	"202        "	"FAMAT"
"2000-07-15"	"604        "	"FADIR"
"1998-10-15"	"904        "	"ESTES"
"1962-03-06"	"420        "	"FAEDU"
"2003-03-14"	"501        "	"FACIP"
"1964-04-04"	"421        "	"FAEDU"
"2000-04-09"	"10000000011"	"FACOM"
"1993-08-27"	"2008       "	"ICBIM"
"1995-12-20"	"403        "	"ESTES"
"2000-04-01"	"501        "	"FACIP"
"1989-01-06"	"1503       "	"FOUFU"
"2002-12-28"	"502        "	"FACIP"
"1999-12-14"	"1813       "	"ICIAG"
"2000-07-14"		"ICIAG"
"1974-01-01"	"401        "	"ESTES"
"2002-08-17"	"203        "	"FAMAT"
"1998-01-26"	"603        "	"FADIR"
"1999-08-30"	"303        "	"INFIS"
"2001-07-04"	"105        "	"FACOM"
"2000-03-11"	"1600       "	"IARTE"
"2000-06-04"	"1400       "	"IFILO"
"1999-08-03"	"104        "	"FACOM"
"2000-11-10"	"300        "	"INFIS"
"1983-07-02"	"102        "	"FACOM"
"2002-10-18"	"1600       "	"IARTE"
"2001-08-15"	"1600       "	"IARTE"
"2003-05-22"	"404        "	"ESTES"
"2002-07-13"	"1400       "	"IFILO"
"2002-05-21"	"1605       "	"IARTE"
"1990-09-17"	"104        "	"FACOM"
"1993-08-18"	"2007       "	"ICBIM"
"2003-08-03"	"2009       "	"ICBIM"
"2000-01-01"	"900        "	"ESTES"
"2000-09-03"	"1610       "	"IARTE"
"2002-04-06"	"2005       "	"ICBIM"
"2001-12-09"	"1300       "	"FAMEV"
"2002-10-14"		"ICIAG"
"1993-01-06"	"1501       "	"FOUFU"
"2001-05-12"	"604        "	"FADIR"
"1995-03-26"	"100        "	"FACOM"
"1993-01-06"	"1500       "	"FOUFU"
"2002-01-09"	"102        "	"FACOM"
"2002-12-12"	"904        "	"ESTES"
"2002-10-18"		"FAMEV"
"2000-09-09"		"FAMEV"
"1998-01-06"	"504        "	"FACIP"
"2000-01-26"	"10000000010"	"FACOM"
"1999-09-05"	"902        "	"ESTES"
"1998-08-02"	"100        "	"FACOM"
"2000-02-07"	"10000000001"	"FACOM"
"1967-12-11"	"421        "	"FAEDU"
"2001-09-12"		"ICIAG"
"2000-02-02"	"1304       "	"FAMEV"
"1999-05-14"	"100        "	"FACOM"
"2001-05-20"	"201        "	"FAMAT"
"2000-09-19"	"10000000100"	"FACOM"
"2000-03-05"	"204        "	"FAMAT"
"2001-05-02"	"101        "	"FACOM"
"1995-04-14"	"200        "	"FAMAT"
"2002-12-01"	"604        "	"FADIR"
"2002-04-17"	"402        "	"ESTES"
"1993-01-06"	"1504       "	"FOUFU"
"1968-03-20"	"423        "	"FAEDU"
"1990-09-12"	"1700       "	"INBIO"
"2005-07-30"	"1402       "	"IFILO"
"2000-05-11"	"1403       "	"IFILO"
"2002-08-06"	"1812       "	"ICIAG"
"1900-01-06"	"1502       "	"FOUFU"
"2001-12-20"	"1403       "	"IFILO"
"1999-11-13"	"301        "	"INFIS"
"2000-03-07"	"103        "	"FACOM"
"1999-01-28"		"FAMEV"
"2003-07-22"	"1703       "	"INBIO"
"2000-12-02"	"1701       "	"INBIO"
"1987-07-19"		"INBIO"
"1999-03-12"	"603        "	"FADIR"
"1990-05-20"	"900        "	"ESTES"
"1974-09-25"	"1700       "	"INBIO"
*/


--f) Listar todos os códigos de disciplinas das turmas dos anos de 2016 e 2017
SELECT turma.cod_disc 
FROM turma
WHERE ano = 2016 OR ano = 2017
GROUP BY cod_disc;
/*
"GAV007"
"GAV013"
*/

--24)CONSULTAS COM CONDIÇÃO DE SELEÇÃO, AGRUPAMENTOS E FUNÇÕES AGREGADAS
--a) Listar a quantidade de professores por faculdade (mostrar o código da faculdade e o número de professores)
SELECT COUNT(professor.id),professor.fac_prof 
FROM professor
GROUP BY fac_prof;
/*
5	"FAMEV"
5	"INFIS"
10	"ESTES"
5	"FADIR"
5	"ICIAG"
5	"FACIP"
5	"IFILO"
5	"IARTE"
5	"FAMAT"
11	"FACOM"
5	"FOUFU"
5	"INBIO"
5	"ICBIM"
5	"FAEDU"
*/
--b) Para os professores que são tutores, listar o id do professor juntamente com o número de orientandos. 
--Somente docentes devem aparecer na consulta, não sendo aceito campos nulos
SELECT COUNT(estudante.id) AS num_orientandos,
estudante.tutor AS num_tutor
FROM estudante
WHERE estudante.tutor IS NOT NULL
GROUP BY estudante.tutor;
/*
1	"1502       "
1	"202        "
1	"1300       "
1	"2008       "
3	"604        "
2	"1700       "
1	"1610       "
1	"1304       "
2	"104        "
1	"502        "
1	"301        "
1	"1701       "
2	"302        "
1	"404        "
1	"2009       "
1	"204        "
3	"100        "
1	"1504       "
1	"2005       "
1	"401        "
3	"1600       "
2	"421        "
1	"2007       "
1	"300        "
1	"101        "
1	"201        "
2	"102        "
1	"420        "
1	"504        "
1	"203        "
1	"902        "
2	"423        "
1	"1402       "
1	"402        "
1	"105        "
1	"503        "
2	"1400       "
1	"1703       "
2	"603        "
1	"200        "
1	"1501       "
1	"10000000000"
1	"303        "
1	"10000000011"
1	"1503       "
1	"1500       "
2	"900        "
2	"501        "
1	"400        "
1	"1812       "
2	"904        "
1	"103        "
1	"1813       "
1	"10000000001"
2	"1403       "
1	"2006       "
1	"403        "
1	"10000000100"
1	"1605       "
1	"10000000010"
*/

--c) Listar para cada data cadastrada a quantidade de alunos que nasceram na respectiva data
SELECT datanasc,COUNT(*)
FROM estudante
GROUP BY datanasc;
/*
"1998-10-15"	1
"2000-04-01"	1
"1995-04-14"	1
"1962-03-06"	1
"2003-07-22"	1
"1999-09-05"	1
"2003-08-03"	1
"2001-09-12"	1
"2001-12-09"	1
"2001-07-04"	1
"2000-01-01"	1
"2000-03-11"	1
"2002-04-17"	1
"2002-08-17"	1
"2002-12-28"	1
"1974-01-01"	1
"2000-11-10"	1
"2002-04-06"	1
"2002-10-14"	1
"1999-03-12"	1
"1999-05-14"	1
"2005-07-30"	1
"1999-01-28"	1
"1990-05-20"	1
"1993-08-18"	1
"1995-03-26"	1
"1995-12-20"	1
"2000-09-09"	1
"2000-09-19"	1
"1964-04-04"	1
"2000-11-08"	1
"2000-03-07"	1
"2001-05-12"	1
"2000-10-04"	1
"2002-12-01"	1
"1998-11-20"	1
"1990-09-12"	1
"1999-11-02"	1
"2000-06-04"	1
"2000-07-14"	1
"2001-05-02"	1
"2002-12-12"	1
"2003-05-22"	1
"1993-01-06"	3
"1994-06-29"	1
"1968-03-20"	2
"2000-09-03"	1
"2002-05-21"	1
"1993-08-27"	1
"2001-05-20"	1
"1990-09-17"	1
"2000-04-09"	1
"2002-07-13"	1
"2000-07-07"	1
"1999-11-13"	1
"2002-01-09"	1
"2001-12-20"	1
"2000-02-02"	1
"2000-12-02"	1
"1999-08-30"	1
"2000-07-15"	1
"1998-08-02"	1
"1998-01-06"	1
"1999-12-14"	1
"1998-01-26"	1
"2001-08-15"	1
"2003-03-14"	1
"2002-08-06"	1
"1987-07-19"	1
"1999-08-03"	1
"2000-01-26"	1
"1989-01-06"	1
"1974-09-25"	1
"2000-05-11"	1
"2003-08-13"	1
"2000-02-07"	1
"1900-01-06"	1
"2002-10-18"	2
"1967-12-11"	1
"1983-07-02"	1
"2000-03-05"	1
*/

--d) Listar a quantidade de turmas por prédio e sala
SELECT COUNT(turma)
FROM turma
GROUP BY predio_s, n_sala;
/*
3
3
2
1
1
1
3
1
2
1
2
1
2
2
1
3
2
2
1
1
3
1
1
2
2
1
2
1
2
1
3
2
2
1
1
1
2
1
1
2
2
1
2
2
2
1
3
1
2
1
1
1
2
1
*/
--e)Listar a sigla de cada faculdade em que há alunos que fazem iniciação científica juntamente com o maior CRA desses alunos
SELECT fac_est, MAX(cra)
FROM estudante
WHERE tutor IS NOT NULL
GROUP BY fac_est;
/*
"FAMEV"	95
"INFIS"	91.7
"ESTES"	800
"FADIR"	89
"ICIAG"	40.5
"FACIP"	92.1
"IFILO"	88.9
"IARTE"	8
"FAMAT"	90
"FACOM"	85
"FOUFU"	100
"INBIO"	80.9
"ICBIM"	100
"FAEDU"	98.5
*/
--f)Listar todos os ids de turmas que possuem alunos. Mostrar juntamente a maior nota de cada turma
SELECT id_turma, MAX(nota)
FROM frequenta
WHERE id_est IS NOT NULL
GROUP BY id_turma;
/*
652	87.99
1300	95
4	80.9
1817	80
511	85
10	60
1819	
402	68
2017	70
514	86
431	100
433	96.4
220	74
1419	90
1720	70.6
400	70
513	61
920	92.2
2015	99
1302	90
219	85
1724	60.1
221	80
320	8.6
50	80
430	78.5
512	58
155	80
317	9.5
2016	98
2	67.9
1418	68
1301	90
1723	40
401	100
2019	60
924	55.2
152	93
40	75
1818	15
1722	55.2
318	7
222	69
651	84.1
650	81.8
925	0
922	80.9
154	
432	86.7
218	80
30	70
923	61
434	96
316	8
1503	8
3	70.9
1501	10
20	65
1725	100
654	90.76
319	9.2
1	75.9
1417	79
404	92
921	75.5
5	60.9
653	85.5
315	9
1820	
515	90
151	68
*/

--g)Listar todos os ids de turmas que possuem alunos. Mostrar juntamente a maior, a menor, a média e o desvio padrão das notas
SELECT id_turma,
MAX(nota) AS max_nota,
MIN(nota) AS min_nota,
AVG(nota) AS media_nota,
STDDEV_SAMP(nota) AS desv_padrao
FROM frequenta
WHERE id_est IS NOT NULL
GROUP BY id_turma;
/*
652	87.99	70.92	78.76199951171876	6.779624594791713
1300	95	70	81.66666666666667	12.583057392117915
4	80.9	80.9	80.9000015258789	
1817	80	0	40	56.568542494923804
511	85	85	85	
10	60	60	60	
1819				
402	68	68	68	
2017	70	70	70	
514	86	86	86	
431	100	100	100	
433	96.4	96.4	96.4000015258789	
220	74	74	74	
1419	90	45	67.5	31.81980515339464
1720	70.6	55.2	62.89999961853027	10.889442811833849
400	70	70	70	
513	61	61	61	
920	92.2	92.2	92.19999694824219	
2015	99	65	82	24.041630560342615
1302	90	90	90	
219	85	85	85	
1724	60.1	60.1	60.099998474121094	
221	80	80	80	
320	8.6	8.6	8.600000381469727	
50	80	80	80	
430	78.5	78.5	78.5	
512	58	58	58	
155	80	80	80	
317	9.5	9.5	9.5	
2016	98	98	98	
2	67.9	67.9	67.9000015258789	
1418	68	68	68	
1301	90	90	90	
1723	40	40	40	
401	100	100	100	
2019	60	60	60	
924	55.2	55.2	55.20000076293945	
152	93	87	90	4.242640687119285
40	75	75	75	
1818	15	15	15	
1722	55.2	55.2	55.20000076293945	
318	7	7	7	
222	69	69	69	
651	84.1	61.8	72.09999942779541	11.084223409683991
650	81.8	61.76	71.23666763305664	10.06409855964372
925	0	0	0	
922	80.9	80.9	80.9000015258789	
154				
432	86.7	86.7	86.69999694824219	
218	80	80	80	
30	70	70	70	
923	61	61	61	
434	96	96	96	
316	8	8	8	
1503	8	8	8	
3	70.9	70.9	70.9000015258789	
1501	10	10	10	
20	65	65	65	
1725	100	100	100	
654	90.76	61.1	79.75333404541016	16.24138531581371
319	9.2	9.2	9.199999809265137	
1	75.9	75.9	75.9000015258789	
1417	79	70	74.5	6.363961030678928
404	92	84	88	5.656854249492381
921	75.5	75.5	75.5	
5	60.9	60.9	60.900001525878906	
653	85.5	67.54	74.11000061035156	8.433922950769634
315	9	9	9	
1820				
515	90	90	90	
151	68	68	68	
*/

--h) Listar para cada ID de turma a quantidade de professores que ministram na turma.
SELECT COUNT(id_prof)
FROM ensina
GROUP BY ensina.id_turma;
/*
3
4
1
1
1
1
1
1
1
1
1
1
1
1
2
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
2
2
1
1
1
1
1
1
1
1
1
1
1
2
1
1
1
3
1
2
1
1
1
2
1
1
1
1
1
*/
--i) Lista a capacidade total de cada prédio
SELECT SUM(capacidade) AS cap_total,predio 
FROM sala
GROUP BY predio;
/*
50	"UMU1L"
100	"UMU4L"
145	"1A   "
120	"5S   "
270	"1BBSI"
180	"1X   "
120	"5O-A "
80	"UMU3L"
50	"2D   "
150	"3K   "
180	"1BCG "
250	"1G   "
160	"3D   "
90	"5R   "
300	"2A   "
60	"1U   "
120	"2E   "
130	"4K   "
160	"1B   "
220	"8C   "
190	"1F   "
*/

--j) Para as disciplinas que possuem pré-requisitos, listar o código da disciplina e o número de disciplinas que ela depende
SELECT cod_disc, COUNT(cod_pre) AS num_cod_pre
FROM pre_requisito
WHERE cod_pre IS NOT NULL
GROUP BY cod_disc;
/*
"GGO011"	1
"ESTES4"	1
"GEDU42"	1
"312   "	1
"1416  "	1
"GMV007"	1
"2001  "	1
"GSI034"	1
"FADIR6"	1
"GGO012"	1
"1805  "	2
"1415  "	1
"FADIR4"	1
"GOG005"	1
"MAT213"	1
"GBC023"	1
"MAT211"	1
"ESTES3"	1
"2003  "	1
"GAV007"	1
"GBC024"	1
"GEDU43"	1
"311   "	1
"GMV006"	1
"GAV019"	1
*/

--k) Listar para cada faculdade a quantidade de alunos que fazem iniciação científica.
SELECT fac_est,COUNT(fac_est)
FROM estudante
WHERE tutor IS NOT NULL
GROUP BY fac_est;
/*
"FAMEV"	2
"INFIS"	5
"ESTES"	10
"FADIR"	5
"ICIAG"	2
"FACIP"	5
"IFILO"	5
"IARTE"	5
"FAMAT"	5
"FACOM"	15
"FOUFU"	5
"INBIO"	4
"ICBIM"	5
"FAEDU"	5
*/

--l) Listar para cada dia da semana e horário a quantidade de turmas alocadas. Na saída mostrar o Id_sem, Id_hora e quantidade
SELECT id_sem, id_hora, COUNT(id_turma)
FROM horario_aula
GROUP BY id_sem, id_hora;
/*
"2"	"c"	1
"5"	"p"	1
"6"	"d"	1
"2"	"f"	3
"3"	"e"	1
"6"	"i"	2
"1"	"c"	1
"3"	"m"	2
"2"	"d"	1
"6"	"c"	2
"3"	"b"	4
"6"	"f"	1
"3"	"c"	4
"6"	"e"	3
"2"	"g"	2
"1"	"a"	2
"3"	"d"	1
"6"	"b"	1
"5"	"q"	1
"6"	"l"	2
"2"	"a"	13
"2"	"j"	1
"4"	"b"	2
"4"	"f"	3
"2"	"i"	1
"5"	"o"	1
"4"	"p"	1
"4"	"c"	4
"5"	"a"	1
"5"	"e"	1
"6"	"m"	1
"4"	"e"	1
"4"	"g"	3
"4"	"a"	3
"2"	"b"	5
"5"	"d"	2
"4"	"d"	2
"4"	"k"	3
"5"	"g"	2
"3"	"a"	2
*/

--m)Listar a quantidade de turmas das disciplinas com turmas nos anos de 2022 e 2021 (mostrar o código da disciplina e a quantidade)
SELECT cod_disc, COUNT(cod_disc)
FROM turma
WHERE ano  = 2022
GROUP BY cod_disc;
/*
"31407 "	1
"MAT214"	2
"GSI023"	1
"GMV003"	1
"GOG001"	1
"31602 "	1
"ESTES4"	1
"31104 "	1
"2002  "	1
"GBC045"	1
"GSI027"	1
"1414  "	2
"GSI034"	1
"GGO012"	1
"1412  "	1
"31505 "	2
"2004  "	2
"GBC023"	1
"1803  "	1
"2003  "	1
"39030 "	1
"FADIR3"	1
"GMV006"	1
"1804  "	1
"GGO002"	1
"1410  "	1
"ESTES5"	1
"2000  "	1
"1413  "	1
"GMV007"	1
"2001  "	1
"ESTES1"	2
"GMV001"	1
"FADIR6"	2
"1411  "	1
"GBC043"	2
"GMV005"	2
"ESTES3"	1
"ESTES2"	1
"GOG003"	1
*/ 

--o) Mostrar a quantidade de disciplinas em cada faixa de carga horária.
SELECT COUNT(codigo)
FROM disciplina
GROUP BY ch;
/*
15
3
3
1
10
1
2
43
7
1
1
*/

--25)CONSULTAS COM AGRUPAMENTOS, JUNÇÕES/IN E FUNÇÕES AGREGADAS
--a) Listar a quantidade de turmas de cada disciplina da FACOM (mostrar o código da disciplina e a quantidade)
SELECT disciplina.codigo,
COUNT(turma.turma)
FROM disciplina, turma
WHERE disciplina.codigo = turma.cod_disc AND
fac_disc = 'FACOM'
GROUP BY disciplina.codigo;
/*
"GSI023"	1
"GBC043"	2
"GBC023"	1
"GBC024"	1
"GBC045"	1
"GSI027"	1
"GBC034"	2
"GSI034"	1
*/

--b) Listar para cada faculdade com orçamento inferior a R$50.000 a quantidade de professores que forma contratados 
--depois de 2010 (mostrar o código da faculdade e a quantidade)
SELECT sigla, COUNT(id) AS qtd_prof
FROM faculdade, professor
WHERE fac_prof=sigla AND 
orcamento<50000 AND 
EXTRACT(year from admissao)>2010
GROUP BY sigla;
/*"FACOM"	3*/

--c)Mostrar a nota média e desvio padrão de cada disciplina da FACOM. Mostrar o código da disciplina, a média e o desvio
SELECT codigo, 
AVG(nota) AS media,
STDDEV_SAMP(frequenta.nota) AS desv_padrao
FROM frequenta, turma, disciplina
WHERE fac_disc='FACOM' AND
frequenta.id_turma = turma.id AND
turma.cod_disc = disciplina.codigo
GROUP BY codigo;
/*
"GSI023"	70.9000015258789	
"GBC043"	71.9000015258789	5.656854249492381
"GBC023"	90	4.242640687119285
"GBC045"	68	
"GSI027"	60.900001525878906	
"GBC034"	80	
"GSI034"	80.9000015258789	
*/

--(d) Mostrar a quantidade de disciplinas ministradas pelos professores. 
--Mostrar o id do professor e a quantidade. Incluir na resposta os professores
--que não ministram disciplinas. Nesse caso, deve-se mostrar 0 na quantidade.
--Se não houver casos cadastrados no banco, fazer inserções para que estes apareçam

SELECT professor.id,COUNT(turma.cod_disc) AS num_de_disc
FROM ensina
FULL OUTER JOIN professor ON professor.id =ensina.id_prof
FULL OUTER JOIN turma ON turma.id = ensina.id_turma
GROUP BY professor.id;
/*
"1502       "	0
"1401       "	1
"202        "	1
"1300       "	1
"1700       "	1
"2008       "	1
"604        "	3
"602        "	2
"1610       "	1
"1304       "	1
"104        "	1
"1701       "	2
"502        "	1
"301        "	1
"404        "	1
"302        "	1
"204        "	2
"2009       "	1
"100        "	1
"1504       "	0
"601        "	2
"2005       "	1
"401        "	1
"1815       "	1
"1600       "	1
"421        "	1
"10140      "	0
"424        "	1
"2007       "	1
"300        "	2
"422        "	1
"101        "	1
"201        "	1
"102        "	1
"420        "	1
"901        "	1
"504        "	1
"203        "	1
"1814       "	1
"902        "	2
"423        "	1
"1402       "	1
"105        "	0
"402        "	1
"503        "	1
"1400       "	1
"1703       "	0
"1404       "	1
"200        "	1
"603        "	3
"1501       "	1
"1615       "	0
"1302       "	1
"10000000000"	1
"1620       "	1
"10000000011"	1
"303        "	1
"1503       "	0
"1500       "	1
"900        "	1
"620        "	3
"1816       "	1
"304        "	1
"400        "	1
"501        "	1
"500        "	1
"903        "	1
"1812       "	2
"904        "	1
"103        "	1
"1303       "	1
"1813       "	1
"1702       "	1
"10000000001"	1
"1403       "	1
"2006       "	1
"1301       "	1
"403        "	1
"10000000100"	1
"1605       "	2
"1704       "	1
"10000000010"	1
*/

--e) Mostrar a quantidade de disciplinas ministradas pelos professores que trabalham em faculdades com orçamento superior a R$ 10.000.
--Incluir na resposta os professores que não ministram disciplinas. Nesse caso, deve-se mostrar 0 na quantidade. Se não 
--houver casos cadastrados no banco, fazer inserções para que estes apareçam
INSERT INTO professor(id,nome,fac_prof,admissao) VALUES(10140,'Antônio Mendes','FACOM','1998-09-10');

SELECT professor.nome,COUNT(turma.cod_disc)
FROM professor
LEFT JOIN faculdade ON professor.fac_prof = faculdade.sigla
LEFT JOIN ensina ON professor.id = ensina.id_prof
LEFT JOIN turma ON turma.id = ensina.id_turma
AND orcamento > 10000.00
GROUP BY professor.nome;
/*
"Clelia Regina Cafer"	1
"Bruno Augusto Nassif Travençolo"	1
"Alexandre Alves Alvenha"	1
"Alexsandro Soares"	1
"Roberto Carlos"	1
"Luciano Hulk"	1
"Djalmir Nestor Messias"	1
"Lucas de Assis Ribeiro"	1
"Alexandre Cacheffo"	1
"Alexandre Garrido da Silva"	2
"Elaine Java"	1
"Barbara Dias Rezende Gontijo"	1
"Giuliano Buzá Jacobucci"	1
"Ana Beatriz da Silva Duarte"	1
"Rivalino Matias Júnior"	1
"Julia Vingadora"	1
"Tatiana Carneiro de Resende"	1
"Marcelo Keese Albertini"	1
"Andrea Maturano Longarezi"	1
"Disney Oliver"	1
"Renato Palumbo Doria"	1
"Marcel Novaes"	1
"Jean Ponciano"	1
"Tiago Wilson Patriarca Mineo "	1
"Jamil Salem"	2
"Gina Maira"	1
"Ailton Gonçalves Rodrigues Junior"	1
"Jeamylle Nilin Gonçalves"	0
"Alberto da Silva Morais"	1
"Antônio Mendes"	0
"Alessandro Gomes Enoque"	1
"Nikoleta Tzvetanova Kerinska"	0
"Marcia Aparecida Fernandes"	1
"Alexandre Guimarães Tadeu de Soares"	1
"Aléxia Pádua Franco"	1
"Ana Maria Said"	1
"Henrique Tomaz Gonzaga"	1
"Ademir Cavalheiro"	2
"Elsieni Coelho da Silva"	2
"Alexandre Calzavara Yoshida"	1
"João Guilherme"	1
"Alessandra Riposati Arantes"	1
"Dennys Garcia Xavier"	1
"Admilson Lopes dos Santos"	1
"Marisa Aparecida Elias"	2
"Anselmo Tadeu Ferreira"	1
"Adevailton Bernardo dos Santos"	1
"Neide Maria da Silva "	1
"Kelly Aparecida Geraldo Yoneyama Tudini"	1
"Alex Fernando Borges"	1
"Ana Paula Turrioni Hidalgo"	0
"Carlos Hernrique Gomes"	1
"Adriana Rodrigues da Silva"	1
"Adriana Pastorello Buim Arena"	1
"Lilian Rodrigues Sant’ Anna Campos"	1
"Ariádine Cristine de Almeida"	2
"Gustavo de Carvalho Marin"	3
"Fernando Rodrigues Martins"	3
"Alcino Eduardo Bonella"	1
"Natália Mundim Tôrres"	1
"Camila Mariana Ruiz"	1
"Cláudio Assembly"	1
"Luiz Gustavo Almeida Martins"	0
"Ana Paula de Lima Oliveira"	0
"Aldeci Cacique Calixto"	1
"Taciana Oliveira Souza"	2
"Gastao da Cunha Frota"	1
"Belchior de Sousa"	1
"Gabriel Jesus"	1
"André Backes"	1
"Elaine Ribeiro"	1
"Daniela de Melo Crosara"	3
"Daniela Cristina de Oliveira"	1
"Adriano Mota Loyola"	1
"Cassiano Aimberê Dorneles Welker"	1
"Fernando Rodrigo Rafaeli"	1
"Beatriz Corrêa Camargo"	2
"Péricles Mendes"	1
"Pedro Frosi"	1
"Álex Moreira Herval"	0
"Alessandra Maia de Castro Prado"	1
"Jailson Mendes"	1
*/

--g)Mostrar para cada faculdade a quantidade de estudantes que frequentam disciplinas. 
/*SELECT faculdade.sigla, COUNT(estudante.id)
FROM faculdade, estudante, frequenta, turma
WHERE faculdade.sigla = estudante.fac_est AND
frequenta.id_est = estudante.id AND
frequenta.id_turma = turma.id
GROUP BY sigla;*/

SELECT faculdade.sigla, COUNT(estudante.id)
FROM faculdade
LEFT JOIN estudante
ON faculdade.sigla = estudante.fac_est 
LEFT JOIN frequenta
ON frequenta.id_est = estudante.id 
LEFT JOIN turma
ON frequenta.id_turma = turma.id
GROUP BY sigla;
/*
"FAMEV"	5
"INFIS"	6
"ESTES"	11
"FADIR"	24
"ICIAG"	5
"FACIP"	5
"IARTE"	5
"IFILO"	5
"FAMEC"	0
"FAMAT"	5
"FEELT"	0
"FACOM"	15
"FOUFU"	5
"FECIV"	0
"INBIO"	6
"ICBIM"	5
"FAEDU"	5
*/

--i)Mostrar para cada faculdade a quantidade de disciplinas que possuem pré-requisitos
SELECT faculdade.sigla, COUNT(cod_disc)
FROM faculdade
LEFT JOIN disciplina
ON faculdade.sigla = disciplina.fac_disc
LEFT JOIN pre_requisito 
ON pre_requisito.cod_disc = disciplina.codigo
GROUP BY faculdade.sigla;
/*
"FAMEV"	2
"INFIS"	2
"ESTES"	2
"FADIR"	2
"ICIAG"	2
"FACIP"	2
"IARTE"	2
"IFILO"	2
"FAMEC"	0
"FAMAT"	2
"FEELT"	0
"FACOM"	3
"FOUFU"	1
"FECIV"	0
"INBIO"	0
"ICBIM"	2
"FAEDU"	2
*/

--26) CONSULTAS COM AGRUPAMENTOS E QUE LISTAM ATRIBUTOS NÃO AGRUPADOS.
--a) Listar a quantidade de turmas de cada disciplina (mostrar o *nome* da disciplina e a quantidade).
--Mostrar a saída ordenada pela quantidade.
SELECT disciplina.nome,COUNT(disciplina.nome) AS qnt_turmas
FROM disciplina,turma
WHERE disciplina.codigo = turma.cod_disc
GROUP BY disciplina.nome
ORDER BY COUNT(disciplina.nome);
/*
"Teoria e Prática do Treinamento II"	1
"Teoria e Prática do Treinamento I"	1
"Algoritmo e Estrutura de Dados 1"	1
"Biologia e Cultura - (PROINTER III)"	1
"Otimização"	1
"Psicologia e Ética"	1
"Construção do Conhecimento Científico"	1
"Teoria do Direito"	1
"Física Básica II"	1
"Bioquímica 2"	1
"Saúde Coletiva I"	1
"Estágio Supervisionado I"	1
"Construção do Discurso Escrito"	1
"Projeto e desenvolvimento 1"	1
"Profissão Biólogo"	1
"Geologia 2"	1
"Evolução"	1
"Arte Contemporanea II"	1
"Unidade de Funcionamento do Organismo I"	1
"Microbiologia"	1
"Enfermagem Médica"	1
"Climatologia 1"	1
"Adubos e Adubação"	1
"Genetica"	1
"Redes de computadores"	1
"Ritmo e Expressão"	1
"Filosofia Geral: Problemas Metafísicos"	1
"História da Filosofia Medieval"	1
"Analises Clinicas"	1
"Direito Digital"	1
"Fisiologia do Exercício"	1
"Fundamentos de Matemática Elementar I"	1
"Direito do Trabalho 1"	1
"Algoritmos e Programação de Computadores"	1
"Fundamentos de Matemática Elementar II"	1
"Un. de Reabilitação Integral do Ap. Estomatognático I"	1
"Imunologia"	1
"Física Básica III"	1
"Historia da Arte I"	1
"Geometrica Analítica"	1
"Cálculo Diferencial e Integral I"	1
"Metodologia do Ensino da Língua Portuguesa"	1
"Manejo e Conservação do Solo e da Água"	1
"Bioquímica 1"	1
"Agrometeorologia"	1
"Programação Procedimental"	1
"Historia da Arte II"	1
"Algoritmo e Estrutura de Dados 2"	1
"Psicologia da Educação"	1
"Irrigação e Drenagem"	1
"Cálculo Diferencial e Integral II"	1
"Citologia, Histologia e Embriologia"	1
"Arte Contemporanea I"	1
"Unidade de Investigação Científica I (UIC1)"	1
"Anatomia dos Animais Domésticos"	1
"Ética"	1
"Geologia 1"	1
"Saúde Coletiva II"	1
"Arte Computacional"	1
"Unidade de Constituição do Organismo"	2
"Comportamento Motor "	2
"Didática Geral"	2
"Geometria Analitica"	2
"Metodologia do Ensino de Ciência"	2
"Direito do Trabalho 2"	2
"Biossegurança"	2
"Climatologia 2"	2
"Física Básica I"	2
"Avaliação de Impactos Ambiental para Biólogos"	2
"Fundamentos em Enfermagem"	2
"Sistemas de Banco de Dados"	2
"Programação Orientada a Objetos"	2
"Fundamentos de Anatomia Veterinária"	2
"Construções Rurais"	2
*/

--b)Mostrar, para cada turma de 2022-01, a quantidade de alunos que foram aprovados. Mostrar o *nome* da
--disciplina, a turma, o ano, e a quantidade. Mostrar a saída ordenada pelo nome da disciplina.
SELECT disciplina.nome, turma.turma, COUNT(estudante.id) AS alunos_aprov
FROM disciplina,turma,frequenta,estudante
WHERE turma.id = frequenta.id_turma
AND estudante.id = frequenta.id_est
AND disciplina.codigo = turma.cod_disc
AND frequenta.nota >= 60
AND turma.ano = '2022'
AND turma.semestre = '1'
GROUP BY disciplina.nome,turma.turma
ORDER BY disciplina.nome;

/*
"Algoritmo e Estrutura de Dados 1"	"66"	2
"Analises Clinicas"	"A "	2
"Avaliação de Impactos Ambiental para Biólogos"	"C "	1
"Bioquímica 1"	"A "	3
"Bioquímica 2"	"B "	1
"Biossegurança"	"E "	1
"Climatologia 1"	"33"	1
"Direito do Trabalho 2"	"D4"	3
"Ética"	"A "	1
"Evolução"	"C "	1
"Filosofia Geral: Problemas Metafísicos"	"A "	2
"Fundamentos de Anatomia Veterinária"	"C "	1
"Fundamentos em Enfermagem"	"1A"	1
"Fundamentos em Enfermagem"	"1B"	1
"Genetica"	"C "	1
"História da Filosofia Medieval"	"A "	1
"Imunologia"	"B "	1
"Profissão Biólogo"	"C "	1
"Saúde Coletiva I"	"1A"	1
"Saúde Coletiva II"	"1A"	1
"Sistemas de Banco de Dados"	"01"	1
*/

--(c) Liste a quantidade de aulas que são ministradas em cada dia da semana (mostrar o dia da semana e a quantidade)
SELECT semana.descricao, COUNT(horario_aula.id_turma)
FROM semana
LEFT JOIN horario_aula
ON semana.id_sem = horario_aula.id_sem
GROUP BY semana.descricao;
/*
"Sábado"	0
"Quarta"	22
"Quinta"	9
"Sexta"	13
"Domingo"	3
"Segunda"	27
"Terça"	14
*/


--d) Mostrar para cada disciplina que é pré-requisito o seu nome e a quantidade de disciplinas 
--que dela dependem. Incluir na consulta disciplinas que não são pré-requisito, colocando 0 na 
--quantidade.

SELECT disciplina.nome,COUNT(pre_requisito.cod_disc)
FROM disciplina
LEFT JOIN pre_requisito ON disciplina.codigo = pre_requisito.cod_pre
GROUP BY disciplina.nome;
/*
"Enfermagem Médica"	0
"Teoria e Prática do Treinamento I"	1
"Unidade de Saúde Humana I (USH1)"	0
"Algoritmo e Estrutura de Dados 1"	1
"Biologia e Cultura - (PROINTER III)"	0
"Otimização"	0
"Psicologia e Ética"	0
"Unidade de Constituição do Organismo"	1
"Climatologia 1"	1
"Adubos e Adubação"	0
"Redes de computadores"	0
"Genetica"	1
"Lógica para Programação"	0
"PIPE 1"	0
"Ritmo e Expressão"	0
"Filosofia Geral: Problemas Metafísicos"	0
"História da Filosofia Medieval"	0
"Analises Clinicas"	1
"Avaliação de Impactos Ambiental para Biólogos"	0
"Fisiologia do Exercício"	1
"Direito Digital"	0
"Fundamentos de Matemática Elementar I"	1
"Direito do Trabalho 1"	1
"Construções Rurais"	0
"Comportamento Motor "	0
"Didática Geral"	1
"Fundamentos de Matemática Elementar II"	0
"Algoritmos e Programação de Computadores"	0
"Un. de Reabilitação Integral do Ap. Estomatognático I"	0
"Arquitetura e Organização de Computadores"	0
"Engenharia de Software"	0
"Biossegurança"	0
"Imunologia"	0
"Física Básica III"	0
"Historia da Arte I"	1
"Geometrica Analítica"	0
"Cálculo Diferencial e Integral I"	1
"Metodologia do Ensino da Língua Portuguesa"	0
"Manejo e Conservação do Solo e da Água"	1
"Metodologia do Ensino de Ciência"	0
"Agrometeorologia"	0
"Bioquímica 1"	1
"Didática Geral II"	0
"Programação Procedimental"	1
"Historia da Arte II"	0
"Sistemas de Banco de Dados"	1
"Psicologia da Educação"	0
"Algoritmo e Estrutura de Dados 2"	0
"Irrigação e Drenagem"	1
"Cálculo Diferencial e Integral II"	0
"Citologia, Histologia e Embriologia"	0
"Arte Contemporanea I"	1
"Fundamentos em Enfermagem"	1
"Unidade de Investigação Científica I (UIC1)"	0
"Anatomia dos Animais Domésticos"	0
"Ética"	1
"Teoria e método em Geografia"	0
"Direito do Trabalho 2"	0
"Geologia 1"	1
"Saúde Coletiva II"	0
"Programação Orientada a Objetos"	0
"Construção do Conhecimento Científico"	0
"Arte Computacional"	0
"Teoria do Direito"	1
"Filosofia da Educação"	0
"Saúde Coletiva I"	1
"Física Básica II"	1
"Bioquímica 2"	0
"Cartografia"	0
"Estágio Supervisionado I"	0
"Etica II"	0
"Física Básica I"	1
"Construção do Discurso Escrito"	0
"Geometria Analitica"	0
"Projeto e desenvolvimento 1"	0
"Lógica"	0
"Profissão Biólogo"	0
"Climatologia 2"	0
"Geologia 2"	0
"Evolução"	0
"Cálculo 1"	0
"Arte Contemporanea II"	0
"Unidade de Funcionamento do Organismo I"	0
"Microbiologia"	0
"Fundamentos de Anatomia Veterinária"	1
"Teoria e Prática do Treinamento II"	0
"Direito Financeiro"	0
*/

--f) Listar para todas as faculdades o seu nome e o número de professores. Mesmo as faculdades que não possuem 
--professor devem aparecer no resultado.
SELECT faculdade.nome, COUNT(professor.id) AS num_prof
FROM faculdade
LEFT JOIN
professor
ON professor.fac_prof = faculdade.sigla
GROUP BY sigla;
/*
"Faculdade de Medicina Veterinária"	5
"Instituto de Física"	5
"Escola Técnica de Saúde"	10
"Faculdade de Direito"	5
"Instituto de Ciências Agrárias"	5
"Faculdade de Ciencias Integradas de Pontal"	5
"Instituto de Filosofia"	5
"Instituto de Artes"	5
"Faculdade de Engenharia Mecânica"	0
"Faculdade de Matematica"	5
"Faculdade de Engenharia Elétrica"	0
"Faculdade da Computação"	12
"Faculdade de Odontologia"	5
"Faculdade de Engenharia Civil"	0
"Instituto de Biologia"	5
"Instituto de Ciências Biomédicas"	5
"Faculdade de Educação Física"	5
*/

--g) Listar para todas as faculdades o seu nome e o número de alunos. Mesmo as faculdades 
--que não possuem alunos devem aparecer no resultado.
SELECT faculdade.nome, COUNT(estudante.id) AS num_est
FROM faculdade
LEFT JOIN
estudante
ON faculdade.sigla = estudante.fac_est
GROUP BY faculdade.sigla;
/*
"Faculdade de Medicina Veterinária"	5
"Instituto de Física"	5
"Escola Técnica de Saúde"	10
"Faculdade de Direito"	5
"Instituto de Ciências Agrárias"	5
"Faculdade de Ciencias Integradas de Pontal"	5
"Instituto de Filosofia"	5
"Instituto de Artes"	5
"Faculdade de Engenharia Mecânica"	0
"Faculdade de Matematica"	5
"Faculdade de Engenharia Elétrica"	0
"Faculdade da Computação"	15
"Faculdade de Odontologia"	5
"Faculdade de Engenharia Civil"	0
"Instituto de Biologia"	5
"Instituto de Ciências Biomédicas"	5
"Faculdade de Educação Física"	5
*/

--i)Listar para todas as faculdades o seu nome, o número de professores e o número de alunos. 
--Verifique sua resposta com as consultas anteriores para conferir se as quantidades estão corretas

SELECT faculdade.nome,COUNT(DISTINCT professor.id) AS n_profs, COUNT(DISTINCT estudante.id) AS n_alunos
FROM faculdade
LEFT JOIN professor ON faculdade.sigla = professor.fac_prof
LEFT JOIN estudante ON faculdade.sigla = estudante.fac_est
GROUP BY faculdade.nome;
/*
"Escola Técnica de Saúde"	10	10
"Faculdade da Computação"	13	15
"Faculdade de Ciencias Integradas de Pontal"	5	5
"Faculdade de Direito"	5	5
"Faculdade de Educação Física"	5	5
"Faculdade de Engenharia Civil"	0	0
"Faculdade de Engenharia Elétrica"	0	0
"Faculdade de Engenharia Mecânica"	0	0
"Faculdade de Matematica"	5	5
"Faculdade de Medicina Veterinária"	5	5
"Faculdade de Odontologia"	5	5
"Instituto de Artes"	5	5
"Instituto de Biologia"	5	5
"Instituto de Ciências Agrárias"	5	5
"Instituto de Ciências Biomédicas"	5	5
"Instituto de Filosofia"	5	5
"Instituto de Física"	5	5
*/

--k) Listar para todas as faculdades o seu nome, e a soma do número de professores e número de alunos
SELECT sigla, faculdade.nome AS nome_fac, COUNT(DISTINCT professor.id) + COUNT(DISTINCT estudante.id)
FROM faculdade
LEFT JOIN
professor
ON fac_prof = sigla
LEFT JOIN
estudante
ON fac_est = sigla
GROUP BY sigla
/*
"ESTES"	"Escola Técnica de Saúde"	20
"FACIP"	"Faculdade de Ciencias Integradas de Pontal"	10
"FACOM"	"Faculdade da Computação"	27
"FADIR"	"Faculdade de Direito"	10
"FAEDU"	"Faculdade de Educação Física"	10
"FAMAT"	"Faculdade de Matematica"	10
"FAMEC"	"Faculdade de Engenharia Mecânica"	0
"FAMEV"	"Faculdade de Medicina Veterinária"	10
"FECIV"	"Faculdade de Engenharia Civil"	0
"FEELT"	"Faculdade de Engenharia Elétrica"	0
"FOUFU"	"Faculdade de Odontologia"	10
"IARTE"	"Instituto de Artes"	10
"ICBIM"	"Instituto de Ciências Biomédicas"	10
"ICIAG"	"Instituto de Ciências Agrárias"	10
"IFILO"	"Instituto de Filosofia"	10
"INBIO"	"Instituto de Biologia"	10
"INFIS"	"Instituto de Física"	10
*/

--where --> linhas são removidas antes do agrupamento.
--having --> são condições "encima" do grupo.

--27)CONSULTAS COM CONDICIONAIS NOS GRUPOS e condições de seleção
--a)Listar as turmas que possuem mais de 7 alunos. Mostrar o código da disciplina, a turma, 
--o ano, o semestre e quantidade de alunos.
SELECT turma, semestre, ano, COUNT(estudante.id)
FROM estudante, frequenta, turma
WHERE estudante.id = id_est AND
id_turma = turma.id
GROUP BY turma.turma, semestre, ano
HAVING COUNT(estudante.id) > 7;
/*
"C "	1	2022	8
"A "	1	2022	10
*/

--b) Listar as turmas que possuem média de notas inferior a 60
SELECT turma, AVG(nota)
FROM turma, frequenta
WHERE id_turma = turma.id
GROUP BY turma
HAVING AVG(nota) < 60;
/*
"B1"	9.5
"A1"	9
"19"	8
"1A"	57.85999984741211
"02"	50.300000508626304
"E1"	8.600000381469727
"17"	10
"A2"	8
"C1"	7
*/

--c) Listar as turmas de 2022-01 que possuem média de notas inferior a 60
SELECT turma, AVG(nota) AS media
FROM turma, frequenta
WHERE turma.id = id_turma AND
ano = '2022' AND semestre = '1'
GROUP BY turma.id
HAVING AVG(nota) < 60;
/*
"C "	40
"C "	55.20000076293945
*/

--d) Listar os nomes dos estudantes com mais de 6 disciplinas neste semestre 
--(mostrar o nome do estudante e a quantidade de disciplinas).
SELECT estudante.nome, COUNT(cod_disc) AS qtde_disc
FROM estudante, frequenta, turma
WHERE semestre = '2022' AND ano = '1' AND
estudante.id = id_est AND
id_turma = turma.id
GROUP BY estudante.nome
HAVING COUNT(cod_disc) > 6;
--Não existem estudantes com mais de 6 disciplinas no semestre 2022-1

--e) Mostrar as faculdades com menos de 3 disciplinas (mostrar a sigla da faculdade e a quantidade de disciplinas).
SELECT sigla, COUNT(codigo)
FROM faculdade, disciplina
WHERE sigla = fac_disc
GROUP BY sigla
HAVING COUNT(codigo) < 3;
--Não existem faculdades com menos de 3 disciplinas

--f) Listar os nomes dos estudantes com CRA>60 e com mais de 6 disciplinas neste semestre 
--(mostrar o nome do estudante e a quantidade de disciplinas).
SELECT estudante.nome, COUNT(cod_disc) AS qtde_disc
FROM estudante, frequenta, turma
WHERE cra > 60 AND
estudante.id = id_est AND
id_turma = turma.id AND
ano = '2022' AND semestre = '1'
GROUP BY estudante.id
HAVING COUNT(cod_disc) > 6;
-- Não existem estudantes com essa condição.

--g)Mostrar as turmas de disciplinas de 4 créditos que possuem mais de 5 alunos matriculados. 
--(mostrar o código da disciplina, a turma, semestre, ano e a quantidade de alunos matriculados).

--supondo que 1 crédito é 15 horas:

SELECT  codigo, turma, semestre, ano, COUNT(estudante.id) AS matriculados
FROM disciplina, turma, frequenta, estudante
WHERE codigo = cod_disc AND
turma.id = id_turma AND
id_est = estudante.id AND ch/15 = 4
GROUP BY turma.turma, codigo, semestre, ano
HAVING COUNT(id_est) > 5;

--h) Mostrar as turmas de disciplinas de carga horária 60 que possuem mais de 5 alunos 
--matriculados. (mostrar o *nome* da disciplina, a turma, semestre, ano e a quantidade de 
--alunos matriculados).
SELECT  disciplina.nome, turma, semestre, ano, COUNT(estudante.id) AS matriculados
FROM disciplina, turma, frequenta, estudante
WHERE codigo = cod_disc AND
turma.id = id_turma AND
id_est = estudante.id AND ch = 60
GROUP BY turma.turma, disciplina.nome, semestre, ano
HAVING COUNT(id_est) > 5;
