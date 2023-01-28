/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;
CREATE LANGUAGE plpgsql;

--1)
CREATE SEQUENCE seq
   START WITH 1
   INCREMENT BY 1

CREATE OR REPLACE FUNCTION alunofacom(nome estudante.nome%type, datanasc estudante.datanasc%type, fac_est estudante.fac_est%type,
									  cra estudante.cra%type)
RETURNS void AS
$$
BEGIN
	INSERT INTO estudante values (nextval('seq'), nome, datanasc, fac_est, cra);
END;
$$ language 'plpgsql';

SELECT alunofacom('José', '1999-05-24','FACOM', 85);
SELECT alunofacom('Maria', '1999-05-25','FACOM', 90);

SELECT * FROM estudante WHERE fac_est = 'FACOM';

--Antes da chamada de função
/*
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	68.1	"102        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	56.9	"103        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	81.4	"104        "
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FACOM"	47.5	"105        "
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

--Após a chamada de função
/*
"106        "	"Pedro Henrique Silva"	"2001-05-02"	"FACOM"	75.3	"101        "
"107        "	"Gabriel Borges Júnior"	"2002-01-09"	"FACOM"	68.1	"102        "
"108        "	"Amanda Gomes de Oliveira"	"2000-03-07"	"FACOM"	56.9	"103        "
"109        "	"Jorge Antônio Santos"	"1999-08-03"	"FACOM"	81.4	"104        "
"110        "	"Bruna Tobias Pinto"	"2001-07-04"	"FACOM"	47.5	"105        "
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
"1          "	"José"	"1999-05-24"	"FACOM"	85	
"2          "	"Maria"	"1999-05-25"	"FACOM"	90	
*/

--2)

CREATE OR REPLACE FUNCTION inseredados(id_est frequenta.id_est%TYPE, id_turma frequenta.id_turma%TYPE, nota frequenta.nota%TYPE,
									   id_prof ensina.id_prof%TYPE, id_tur ensina.id_turma%TYPE, id professor.id%TYPE, nome professor.nome%TYPE,
									   fac_prof professor.fac_prof%TYPE, admissao professor.admissao%TYPE)
RETURNS void AS $$
BEGIN
	INSERT INTO frequenta VALUES(id_est,id_turma,nota);
	INSERT INTO professor VALUES(id,nome,fac_prof,admissao);
	INSERT INTO ensina VALUES(id_prof,id_tur);
END;
$$ language 'plpgsql';

select * from frequenta;
/*ANTES
"1304       "	1300	95
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
*/
SELECT * FROM ensina;
/*ANTES
"100        "	155
"101        "	151
"102        "	154
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
"6666       "	220
"4444       "	152
"1816       "	1111
*/
SELECT * FROM professor;
/*ANTES
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
"200        "	"Admilson Lopes dos Santos"	"FAMAT"	"2013-12-10"
"201        "	"Adriana Rodrigues da Silva"	"FAMAT"	"2010-03-26"
"203        "	"Fernando Rodrigo Rafaeli"	"FAMAT"	"2014-06-03"
"204        "	"Taciana Oliveira Souza"	"FAMAT"	"2013-11-12"
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
"6666       "	"Camila Mariana Ruiz"	"FAMAT"	"2022-05-30"
"4444       "	"André Backes"	"FACOM"	"20015-06-02"
"10140      "	"Antônio Mendes"	"FACOM"	"1998-09-10"
*/
SELECT inseredados('106',922,30.0,'4055',155,'4055','Antônio Gomes','FAMAT','05-01-2023');

SELECT * FROM frequenta;
/*DEPOIS
"1304       "	1300	95
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
"106        "	922	30
*/

SELECT * FROM professor;
/*DEPOIS
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
"200        "	"Admilson Lopes dos Santos"	"FAMAT"	"2013-12-10"
"201        "	"Adriana Rodrigues da Silva"	"FAMAT"	"2010-03-26"
"203        "	"Fernando Rodrigo Rafaeli"	"FAMAT"	"2014-06-03"
"204        "	"Taciana Oliveira Souza"	"FAMAT"	"2013-11-12"
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
"6666       "	"Camila Mariana Ruiz"	"FAMAT"	"2022-05-30"
"4444       "	"André Backes"	"FACOM"	"20015-06-02"
"10140      "	"Antônio Mendes"	"FACOM"	"1998-09-10"
"4055       "	"Antônio Gomes"	"FAMAT"	"2023-01-05"
*/

SELECT * FROM ensina;
/*DEPOIS
"100        "	155
"101        "	151
"102        "	154
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
"6666       "	220
"4444       "	152
"1816       "	1111
"4055       "	155
*/

--3)
CREATE OR REPLACE FUNCTION inserirDados(predio sala.predio%TYPE, numero sala.numero%TYPE, capacidade sala.capacidade%TYPE)
RETURNS void AS $$
BEGIN
INSERT INTO sala VALUES(predio, numero, capacidade);
IF (capacidade >= 35)  
THEN 
	RAISE NOTICE 'Ok';
ELSE
	RAISE NOTICE 'Capacidade insuficiente';
END IF;
END;
$$ language 'plpgsql';

SELECT * FROM sala;
--Caso em que o erro ocorre:
SELECT inserirDados('1K', 611::smallint, 20);
--Caso em que o erro não ocorre:
SELECT inserirDados('1L', 612::smallint, 60);

--4)
CREATE OR REPLACE FUNCTION normalizaNotas(ano_n turma.ano%TYPE, semestr turma.semestre%TYPE, cod_disc_n turma.cod_disc%TYPE,
										 turma_n turma.turma%TYPE)
RETURNS void AS $$
DECLARE
tupla record;
MaiorNota REAL;
BEGIN
	SELECT max(nota) 
	FROM frequenta
	WHERE id_turma IN(SELECT turma.id FROM turma WHERE ano = ano_n AND
					  semestre = semestr AND turma = turma_n AND cod_disc = cod_disc_n) INTO MaiorNota;
					  
FOR tupla IN SELECT id_est, nota 
			 FROM turma, frequenta
			 WHERE ano = ano_n AND semestre = semestr AND turma.cod_disc = cod_disc_n
			 AND turma = turma_n AND id = id_turma
LOOP
	UPDATE frequenta 
	SET nota = tupla.nota * 10 / MaiorNota
	WHERE id_est = tupla.id_est;
END LOOP;

FOR tupla IN SELECT id_est, nota 
		     FROM turma, frequenta
			 WHERE ano = ano_n AND semestre = semestr AND turma.cod_disc = cod_disc_n
			 AND turma = turma_n AND id = id_turma

LOOP
	IF tupla.nota >= 5.8 AND tupla.nota <= 5.9
		THEN UPDATE frequenta 
		SET nota = 6.0 
		WHERE id_est = tupla.id_est;
	END IF;
END LOOP;
END;
$$language 'plpgsql';

SELECT normalizaNotas(2022,1,'ESTES1','1A');


--5)
---------
--Consultas de Apoio:
SELECT turma.id, turma, semestre, ano, COUNT(id_est)
FROM turma
LEFT OUTER JOIN 
frequenta
ON id_turma = turma.id
GROUP BY turma.id
HAVING semestre = 1 AND ano = 2022;
----------
CREATE OR REPLACE FUNCTION remover_turma(ano_a turma.ano%TYPE, semest turma.semestre%TYPE, N integer)
RETURNS void AS $$
DECLARE
tupla record;
BEGIN
			
FOR tupla IN SELECT turma.id, COUNT(id_est)
			FROM turma
			LEFT JOIN frequenta
			ON id_turma = turma.id AND  semestre = semest AND ano = ano_a
			GROUP BY turma.id
			HAVING COUNT(id_est) < N
LOOP
		DELETE FROM horario_aula WHERE id_turma = tupla.id;
		DELETE FROM frequenta WHERE frequenta.id_turma = tupla.id;
		DELETE FROM ensina WHERE ensina.id_turma = tupla.id;
		DELETE FROM turma WHERE turma.id = tupla.id;
END LOOP;
END;
$$ language 'plpgsql';

SELECT remover_turma(2022,1,3);