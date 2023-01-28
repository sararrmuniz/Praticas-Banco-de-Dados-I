/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/

SET search_path TO universidade;

-- -----------------------------------------------------
-- Povoamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Faculdade
-- -----------------------------------------------------

INSERT INTO faculdade (sigla,nome,predio,orcamento) VALUES('FAMAT','Faculdade de Matematica','1F',37500000.00);

-- -----------------------------------------------------
-- Professores
-- -----------------------------------------------------

INSERT INTO professor (id,nome,fac_prof,admissao) VALUES('200','Admilson Lopes dos Santos','FAMAT','2013-12-10');
INSERT INTO professor (id,nome,fac_prof,admissao) VALUES('201','Adriana Rodrigues da Silva','FAMAT','2010-03-26');
INSERT INTO professor (id,nome,fac_prof,admissao) VALUES('202','Camila Mariana Ruiz','FAMAT','2022-05-30');
INSERT INTO professor (id,nome,fac_prof,admissao) VALUES('203','Fernando Rodrigo Rafaeli','FAMAT','2014-06-03');
INSERT INTO professor (id,nome,fac_prof,admissao) VALUES('204','Taciana Oliveira Souza','FAMAT','2013-11-12');

-- -----------------------------------------------------
-- Estudantes
-- -----------------------------------------------------

INSERT INTO estudante (id,nome,datanasc,fac_est,cra,tutor) VALUES('205','Joao Vitor Correia','2000-03-05','FAMAT',70.00,'204');
INSERT INTO estudante (id,nome,datanasc,fac_est,cra,tutor) VALUES('206','Marina Silva Gomes','2002-08-17','FAMAT',85.00,'203');
INSERT INTO estudante (id,nome,datanasc,fac_est,cra,tutor) VALUES('207','Maria Julia Oliveira','1999-11-02','FAMAT',90.00,'202');
INSERT INTO estudante (id,nome,datanasc,fac_est,cra,tutor) VALUES('208','Vicente Araujo Mendes','1995-04-14','FAMAT',80.00,'200');
INSERT INTO estudante (id,nome,datanasc,fac_est,cra,tutor) VALUES('209','Alexandre Oliveira Rodrigues','2001-05-20','FAMAT',65.00,'201');

-- -----------------------------------------------------
-- Disciplina
-- -----------------------------------------------------

INSERT INTO disciplina (codigo,nome,fac_disc,ch) VALUES('210','Fundamentos de Matematica Elementar I','FAMAT',90);
INSERT INTO disciplina (codigo,nome,fac_disc,ch) VALUES('211','Fundamentos de Matematica Elementar II','FAMAT',90);
INSERT INTO disciplina (codigo,nome,fac_disc,ch) VALUES('212','Calculo Diferencial e Integral I','FAMAT',90);
INSERT INTO disciplina (codigo,nome,fac_disc,ch) VALUES('213','Calculo Diferencial e Integral II','FAMAT',90);
INSERT INTO disciplina (codigo,nome,fac_disc,ch) VALUES('214','Geometria Analitica','FAMAT',90);

-- -----------------------------------------------------
-- Pre-Requisito
-- -----------------------------------------------------

INSERT INTO pre_requisito (cod_disc,cod_pre) VALUES('211','210');
INSERT INTO pre_requisito (cod_disc,cod_pre) VALUES('213','212');

-- -----------------------------------------------------
-- Sala
-- -----------------------------------------------------

INSERT INTO sala (predio,numero,capacidade) VALUES('1F',215,70);
INSERT INTO sala (predio,numero,capacidade) VALUES('1F',216,75);
INSERT INTO sala (predio,numero,capacidade) VALUES('1F',217,45);

-- -----------------------------------------------------
-- Turma
-- -----------------------------------------------------

INSERT INTO turma (id,turma,semestre,ano,cod_disc,predio_s,n_sala) VALUES(218,'A',1,2018,'210','1F',215);
INSERT INTO turma (id,turma,semestre,ano,cod_disc,predio_s,n_sala) VALUES(219,'B',2,2019,'211','1F',216);
INSERT INTO turma (id,turma,semestre,ano,cod_disc,predio_s,n_sala) VALUES(220,'C',3,2020,'212','1F',217);
INSERT INTO turma (id,turma,semestre,ano,cod_disc,predio_s,n_sala) VALUES(221,'D',4,2021,'213','1F',215);
INSERT INTO turma (id,turma,semestre,ano,cod_disc,predio_s,n_sala) VALUES(222,'E',5,2022,'214','1F',216);
INSERT INTO turma (id,turma,semestre,ano,cod_disc,predio_s,n_sala) VALUES(223,'F',6,2022,'214','1F',216);

-- -----------------------------------------------------
-- Ensina
-- -----------------------------------------------------

INSERT INTO ensina (id_prof,id_turma) VALUES('200',218);
INSERT INTO ensina (id_prof,id_turma) VALUES('201',219);
INSERT INTO ensina (id_prof,id_turma) VALUES('202',220);
INSERT INTO ensina (id_prof,id_turma) VALUES('203',221);
INSERT INTO ensina (id_prof,id_turma) VALUES('204',222);
INSERT INTO ensina (id_prof,id_turma) VALUES('204',223);

-- -----------------------------------------------------
-- Frequenta
-- -----------------------------------------------------

INSERT INTO frequenta (id_est,id_turma,nota) VALUES('205',218,80.00);
INSERT INTO frequenta (id_est,id_turma,nota) VALUES('206',219,85.00);
INSERT INTO frequenta (id_est,id_turma,nota) VALUES('207',220,74.00);
INSERT INTO frequenta (id_est,id_turma,nota) VALUES('208',221,80.00);
INSERT INTO frequenta (id_est,id_turma,nota) VALUES('209',222,69.00);

-- -----------------------------------------------------
-- Horario
-- -----------------------------------------------------

INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('a','7:10:00','8:00:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('b','8:00:00','8:50:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('c','8:50:00','9:40:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('d','9:50:00','10:40:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('e','10:40:00','11:30:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('q','11:30:00','12:20:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('f','13:10:00','14:00:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('g','14:00:00','14:50:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('h','14:50:00','15:40:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('i','16:00:00','16:50:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('j','16:50:00','17:40:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('k','17:40:00','18:30:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('l','18:10:00','19:00:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('m','19:00:00','19:50:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('n','19:50:00','20:40:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('o','20:50:00','21:40:00');
INSERT INTO horario (id_hora,hora_inicio,hora_fim) VALUES('p','21:40:00','22:30:00');

-- -----------------------------------------------------
-- Semana
-- -----------------------------------------------------

INSERT INTO semana (id_sem,descricao) VALUES('1','Domingo');
INSERT INTO semana (id_sem,descricao) VALUES('2','Segunda');
INSERT INTO semana (id_sem,descricao) VALUES('3','Terca');
INSERT INTO semana (id_sem,descricao) VALUES('4','Quarta');
INSERT INTO semana (id_sem,descricao) VALUES('5','Quinta');
INSERT INTO semana (id_sem,descricao) VALUES('6','Sexta');
INSERT INTO semana (id_sem,descricao) VALUES('7','Sabado');

-- -----------------------------------------------------
-- Horario_Aula
-- -----------------------------------------------------

INSERT INTO horario_aula (id_sem,id_hora,id_turma) VALUES('2','a',218);
INSERT INTO horario_aula (id_sem,id_hora,id_turma) VALUES('3','e',219);
INSERT INTO horario_aula (id_sem,id_hora,id_turma) VALUES('4','c',220);
INSERT INTO horario_aula (id_sem,id_hora,id_turma) VALUES('5','p',221);
INSERT INTO horario_aula (id_sem,id_hora,id_turma) VALUES('6','i',222);