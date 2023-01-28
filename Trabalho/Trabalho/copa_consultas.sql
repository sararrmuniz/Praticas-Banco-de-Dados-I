SET search_path TO copa;

--gente, dá pra por emojis aqui 🫠👻🧟‍♀️
-- win+.

-- STORED PROCEDURE E TRIGGER
--Fazer uma tabela de auditoria em que toda vez que o salário do técnico é atualizado,
--os dados do id, novo e velho salarios, data são passados para a tabela

CREATE TABLE auditoria_salario (
	id_tecnico integer NOT NULL,
	salario DECIMAL(10,2),
	novo_salario DECIMAL(10,2),
	data_alteracao date default CURRENT_DATE,
	CONSTRAINT pk_tecnico_auditoria PRIMARY KEY (id_tecnico)
);

CREATE OR REPLACE FUNCTION altera_salario()
RETURNS trigger AS $$
BEGIN
IF(OLD.salario<>NEW.salario)THEN
	INSERT INTO auditoria_salario
	(id_tecnico,salario,novo_salario,data_alteracao)
	VALUES(old.id_tecnico,old.salario,new.salario,default);
RETURN NULL;
END IF;
END;$$ language plpgsql;

CREATE TRIGGER trig_auditoria_salario_tecnico AFTER UPDATE
ON tecnico FOR EACH ROW
EXECUTE PROCEDURE altera_salario();
					  
update tecnico set salario = 22000.00 WHERE id_tecnico = 6;
select* from auditoria_salario;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

--CONSULTAS

--Pelo menos 4 consultas devem envolver duas ou mais tabelas (em alguns casos incluir outer joins)
--1) Listar o nome de todos os jogadores que jogam em um evento da copa juntamente com o nome da seleção em que joga

SELECT nome_participante, nome_selecao
FROM participante, jogador,joga_evento, evento_copa, selecao
WHERE id_participante = jogador.id_jogador AND
	   jogador.id_jogador = joga_evento.id_jogador AND
	   joga_evento.ano_copa = evento_copa.ano_copa AND
	   joga_evento.id_selecao = evento_copa.id_selecao AND
	   selecao.id_selecao = evento_copa.id_selecao;
--SIM, Mbappé colocamos no brasil!!

-------------------------------------------------------------------------------------------------------------------------------------

--2) Listar todas as informações do ingresso juntamente com o cpf e o nome do torcedor, o estádio e o horário do jogo no 
--qual o ingresso foi comprado 

SELECT ingresso.id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torcedor, nome_torcedor, estadio, horario
FROM ingresso 
INNER JOIN 
torcedor ON cpf = cpf_torcedor
INNER JOIN
vende ON vende.id_ingresso = ingresso.id_ingresso
INNER JOIN 
jogo ON jogo.id_jogo = vende.id_jogo;

-------------------------------------------------------------------------------------------------------------------------------------

--3) Listar, usando OUTER JOIN, o nome dos participantes juntamente com o nome do premio que já receberam. 
--Se um participante não tiver recebido nenhum prêmioe le deve aparecer na resposta

SELECT nome_participante, nome_premio
FROM participante 
LEFT OUTER JOIN
premiacao ON participante.id_participante = premiacao.id_participante;

-------------------------------------------------------------------------------------------------------------------------------------

--4) Listar, usando OUTER JOIN, o nome dos jogadores que não estão parcipando de um evento da copa

SELECT nome_participante
FROM participante
LEFT OUTER JOIN
jogador ON id_jogador = id_participante
LEFT OUTER JOIN
joga_evento ON jogador.id_jogador = joga_evento.id_jogador
WHERE joga_evento.id_jogador IS NULL;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

--Pelo menos 2 consultas devem envolver funções de agregação (COUNT, SUM, MIN, MAX, AVG) com agrupamento (GROUP BY).

--5)Listar as seleções por nome e mostrar a quantidade de jogadores em cada seleção
SELECT selecao.nome_selecao, COUNT(joga_evento.id_jogador)
	FROM selecao, joga_evento, evento_copa
	WHERE evento_copa.ano_copa = joga_evento.ano_copa AND evento_copa.id_selecao = joga_evento.id_selecao
	AND selecao.id_selecao = evento_copa.id_selecao
	GROUP BY selecao.id_selecao;

-------------------------------------------------------------------------------------------------------------------------------------

--6)Seleciona o id do participante, o nome do participante e a quantidade de premios que ele venceu
SELECT participante.id_participante, participante.nome_participante,COUNT(premiacao.id_participante) AS qnt_premios
	FROM participante
	INNER JOIN premiacao
	ON participante.id_participante = premiacao.id_participante
	GROUP BY participante.id_participante,participante.nome_participante;
	
--teste
INSERT INTO premiacao(id_participante,nome_premio,data_conquista) VALUES (5,'Euro Copa','2022-05-11');

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

--Pelo menos 2 consultas devem envolver funções de agregação (COUNT, SUM, MIN, MAX, AVG) com agrupamento (GROUP BY) e HAVING
--7)Listar e mostra a quantidade de jogadores que ja jogaram em mais de uma copa do mundo	
SELECT jogador.id_jogador,participante.nome_participante,COUNT(jogador.id_jogador) 
	FROM jogador,joga_evento,participante
	WHERE jogador.id_jogador = joga_evento.id_jogador
	AND participante.id_participante = jogador.id_jogador
	GROUP BY jogador.id_jogador,participante.nome_participante
	HAVING COUNT(jogador.id_jogador)>1;

INSERT INTO evento_copa(ano_copa,id_selecao,id_treinador) VALUES(1970,1,6);
INSERT INTO joga_evento(id_jogador,ano_copa,id_selecao) VALUES(1,1970,1);

-------------------------------------------------------------------------------------------------------------------------------------

--8)Listar as seleções que possuem jogadores com uma media de altura menor que 1.70
SELECT selecao.id_selecao, selecao.nome_selecao, AVG(jogador.altura) AS media_altura, joga_evento.ano_copa
FROM selecao, jogador, joga_evento
WHERE jogador.id_jogador = joga_evento.id_jogador AND selecao.id_selecao = joga_evento.id_selecao
GROUP BY selecao.id_selecao, joga_evento.ano_copa
HAVING AVG(jogador.altura)<1.70;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

--ATUALIZAÇÕES DO BANCO 

	--INSERÇÃO

-- 9) Na compra de um ingresso, passar os dados para inserir em torcedor, ingresso e venda. Caso o torcedor já esteja cadastrado,
--inserir apenas nas tabelas ingresso e venda.
CREATE OR REPLACE FUNCTION comprar_ingresso (cpf_torc torcedor.cpf%type, nome_torcedor torcedor.nome_torcedor%type,
											data_nasc torcedor.data_nasc%type, id_ingresso ingresso.id_ingresso%type,
											secao ingresso.secao%type, nro_cadeira ingresso.nro_cadeira%type,
											valor ingresso.valor%type, data_jogo ingresso.data_jogo%type,
											id_jogo jogo.id_jogo%type)
RETURNS void AS $$
DECLARE torcedor_existe integer;
BEGIN

	SELECT COUNT(*) INTO torcedor_existe FROM torcedor WHERE cpf = cpf_torc;
	IF torcedor_existe = 0 THEN	
		INSERT INTO torcedor (cpf, nome_torcedor, data_nasc) VALUES (cpf_torc, nome_torcedor, data_nasc);
		INSERT INTO ingresso (id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torcedor) 
							values (id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torc);
		INSERT INTO vende (id_ingresso, id_jogo) VALUES (id_ingresso, id_jogo);
	ELSE
		INSERT INTO ingresso (id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torcedor) 
							values (id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torc);
		INSERT INTO vende (id_ingresso, id_jogo) VALUES (id_ingresso, id_jogo);
	END IF;
END
$$ LANGUAGE plpgsql;

select comprar_ingresso ('123.123.123-12','Antonidas Gojira','1998-09-07',17,'A2','44',2000,'2002-06-07',5);

select * from torcedor, ingresso, vende where cpf=cpf_torcedor and ingresso.id_ingresso=vende.id_ingresso;

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

	--REMOÇÕES (3 operações, sendo que pelo menos 1 deve exigir remoções em mais de uma tabela)
	
--10)Fazer um cancelamento da compra de um ingresso. Para isso é preciso remover ingresso e vende.
--Torcedor podemos deixar no banco para compras futuras.
CREATE OR REPLACE FUNCTION cancelar_compra_ingresso (id_ingr ingresso.id_ingresso%type)
RETURNS void AS $$ 
BEGIN
    DELETE FROM vende WHERE id_ingr=vende.id_ingresso;
	DELETE FROM ingresso WHERE id_ingr=ingresso.id_ingresso;
END
$$ LANGUAGE plpgsql;

select cancelar_compra_ingresso(17);
select * from ingresso, vende where vende.id_ingresso=ingresso.id_ingresso;

-------------------------------------------------------------------------------------------------------------------------------------

--11)Jogador foi escalado para o jogo, mas não poderá mais jogar. Excluir o jogador da tabela jogador_atua.
INSERT INTO participante (id_participante, nome_participante, data_nascimento) VALUES (21, 'Watson', '1990-10-23');
INSERT INTO jogador (id_jogador, altura, peso, posicao) VALUES (21, 1.73, 70.0, 'Atacante');
INSERT INTO jogador_atua(id_jogador, id_jogo) VALUES(21,1);
select*from jogador_atua;

DELETE FROM jogador_atua where id_jogador='21';

-------------------------------------------------------------------------------------------------------------------------------------

--12)Jogador foi convocado para a copa, mas não poderá comparecer. Excluir jogador da participação na copa
--(joga_evento, jogador, participante).
INSERT INTO joga_evento(id_jogador, ano_copa, id_selecao) VALUES(21,2002,1); --valores pegos da criação de teste da consulta anterior
select*from joga_evento;

CREATE OR REPLACE FUNCTION retirar_jogador_evento (id participante.id_participante%type)
RETURNS void AS $$ 
BEGIN
    DELETE FROM joga_evento WHERE id=id_jogador;
	DELETE FROM jogador WHERE id=id_jogador;
	DELETE FROM participante WHERE id=id_participante;
END
$$ LANGUAGE plpgsql;


select retirar_jogador_evento(21);

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

	--ATUALIZAÇÕES (3 operações, sendo que pelo menos 1 delas deve obter o(s) novo(s) valor(es) 
	--a serem armazenados a partir de consulta(s) a outra(s) tabela(s)).
	
-- 13) obter o(s) novo(s) valor(es) a serem armazenados a partir de consulta(s) a outra(s) tabela(s)).
--Acrescentar uma nova coluna na tabela JOGO para que seja possível ver quantos ingressos 
--foram vendidos em um determinado jogo. Usa-se para isso a contagem da tabela VENDE.

ALTER TABLE jogo
ADD COLUMN ingressos_vendidos integer;

CREATE OR REPLACE FUNCTION atualizar_ingressos_jogo()
RETURNS TRIGGER AS $$
DECLARE cont_novo integer;
		cont_velho integer;
BEGIN
	SELECT COUNT(*) INTO cont_novo FROM vende WHERE vende.id_jogo = NEW.id_jogo;
	SELECT ingressos_vendidos INTO cont_velho FROM jogo WHERE id_jogo = NEW.id_jogo;
	IF(cont_novo<>cont_velho) THEN
  		UPDATE jogo SET ingressos_vendidos = cont_novo WHERE id_jogo = NEW.id_jogo;
  	END IF;
  	RETURN null;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualizar_ingressos_jogo_trigger
AFTER INSERT OR DELETE OR UPDATE ON vende
FOR EACH ROW
EXECUTE FUNCTION atualizar_ingressos_jogo();

--se passar os dados do comprador(caso não saiba se já está cadastrado ou tenha certeza que ele não foi cadastrado) 
--é possível chamar a função comprar_ingresso:
select comprar_ingresso ('123.123.123-12','Antonidas Gojira','1998-09-07',19,'A3','44',2000,'2002-06-10',3);

--se não, é só passar apenas em ingresso e vende separadamente
insert into ingresso (id_ingresso, secao, nro_cadeira, valor, data_jogo, cpf_torcedor) 
			values (16,'A1',24,2500,'2002-06-10','148.458.258-58');
insert into vende (id_ingresso, id_jogo) values (16,4);

select *from jogo;

-------------------------------------------------------------------------------------------------------------------------------------

-- 14) Atualizar o salário de um técnico, fazer um select para ver a tabela auditoria_salario.
UPDATE tecnico SET salario = 18500 WHERE id_tecnico = 10;

select * from auditoria_salario;

-------------------------------------------------------------------------------------------------------------------------------------

-- 15) Mudar o juíz que irá apitar um jogo.
UPDATE apita_jogo SET id_juiz = 17 where id_juiz = 11 AND id_jogo=3;

select*from juiz, apita_jogo where juiz.id_juiz = apita_jogo.id_juiz;



