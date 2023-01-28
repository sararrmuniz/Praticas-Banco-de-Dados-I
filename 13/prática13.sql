/*Grupo:
		Laura Rosado Rodrigues Muniz
		Sara Rosado Rodrigues Muniz
*/


SET search_path TO universidade;

--1)
--a)
CREATE TABLE auditoria_orcamento (
	sigla varchar(5) NOT NULL,
	orcamento DECIMAL(10,2),
	novo_orcamento DECIMAL(10,2),
	data_alteracao date default CURRENT_DATE,
	CONSTRAINT pk_faculdade_auditoria PRIMARY KEY (sigla)
);
--b)
CREATE OR REPLACE FUNCTION altera_orcamento()
RETURNS trigger AS $$
BEGIN
IF(OLD.orcamento<>NEW.orcamento)THEN
	INSERT INTO auditoria_orcamento
	(sigla,orcamento,novo_orcamento)
	VALUES(old.sigla,old.orcamento,new.orcamento);
RETURN NULL;
END IF;
END;$$ language plpgsql;

CREATE TRIGGER trig_auditoria_orcamento AFTER UPDATE
ON faculdade FOR EACH ROW
EXECUTE PROCEDURE altera_orcamento();

--c)
UPDATE faculdade SET orcamento = 1000000.00 WHERE sigla = 'FAMAT';

--d)
SELECT * FROM auditoria_orcamento;

--"FAMAT"	37500000.00	1000000.00	"2023-01-13"














