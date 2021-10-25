 /* Modelagem Básica - 
 ENTIDADE=TABELA
CAMPOS=ATRIBUTOS */
 
 CLIENTE
 /* FASE 01 */
 
 NOME - CARACTER(30)
 CPF - NUMERICO(11)
 EMAIL - CARACTER(30)
 TELEFONE - CARACTER(30)
 ENDEREÇO - CARACTER(100)
 SEXO - CARACTER(1)
 
 
 /* PROCESSOS DE MODELEGEM */
 
 /* FASE 01 E 02 - RESPONSABILIDADE DO AD ADM DE DADOS */
 
 MODELAGEM CONTEITUAL - RASCUNHO
 MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM
 
 /* FASE 03 - DBA / AD */
 
 MODELAGEM FÍSICA - SCRIPTS DE BANCO
 
 /* INICIANDO A MODELAGEM FÍSICA */
 
 /* CRIANDO O BANCO DE DADOS */
 
 CREATE DATABASE PROJETO;
 
 /* CONECTANDO-SE AO BANCO */
 
 USE PROJETO;
 
 /* CRIANDO A TABELA */
 
 CREATE TABLE CLIENTE(
	NOME VARCHAR(30),--VARCHAR VARIA O TAMANHO E OCUPA UM ESPAÇO MENOS MAIS É MENOS PERFORMATICO
	SEXO CHAR(1),--CHAR SEMPRE VAI OCUPAR O ESPAÇO DEFINIDO, POREM É BEM MAIS PERFOMATICO POR NÃO TER QUE VARIAR
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);


/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;
 
 
 /* DESCOBRINDO COMO É A ESTRUTURA DA TABELA */
 
 DESC CLIENTE;
 
 /* sintaxe basica de inserção - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);
 
 /* O COMANDO SE4LECT 
	SELECAO PROJECAO E JUNCAO
 */
 
 SELECT NOW();
 
 SELECT 'DIEGO BERNARDES'; -- PROJETA NA TELA A STRING
 
 SELECT 'BANCO DE DADOS';
 
 
 /* ALIAS DE COLUNAS */

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT SEXO, EMAIL, ENDERECO, NOME AS CLIENTE FROM CLIENTE; -- TROCA O NOME POR CLIENTE PARA SER EXIBIDO 
 
 SELECT NOME AS CLIENTE, SEXO, EMAIL, ENDERECO FROM CLIENTE; 
 
 /* FILTRANDO DADOS COM WHERE E LIKE */
 
 SELECT NOME, TELEFONE FROM CLIENTE;
 
 /* FILTRANDO */
 
 SELECT NOME, SEXO, EMAIL FROM CLIENTE
 WHERE SEXO = 'M';
 
 SELECT NOME,ENDERECO FROM CLIENTE
 WHERE SEXO = 'F';
 
 SELECT NOME,SEXO FROM CLIENTE
 WHERE ENDERECO = 'RJ'; -- O SINAL DE IGUAL DETERMINA QUE SEJA IDENTICO AO QUE É INFORMADO
 
 /* UTILIZANDO O LIKE */
 
 SELECT NOME,SEXO FROM CLIENTE
 WHERE ENDERECO LIKE 'RJ';
 
 /* CARACTER CORINGA % -> QUALQUER COISA */
 
 SELECT NOME,SEXO FROM CLIENTE  
 WHERE ENDERECO LIKE '%RJ'; --SIGNFICA QUE O % REPRESENTA QUE PODE COMEÇAR COM QLQR FRASES OU PALAVRAS, MAIS PRECISA TERMINAR COM O RJ 
 
 SELECT NOME,SEXO, ENDERECO FROM CLIENTE
 WHERE ENDERECO LIKE '%RJ';
 
 SELECT NOME,SEXO, ENDERECO FROM CLIENTE
 WHERE ENDERECO LIKE 'OSCAR CURY%'; -- COMECA COM OSCAR CURY E TERMINA COM QLQR COISA

 SELECT NOME,SEXO, ENDERECO FROM CLIENTE
 WHERE ENDERECO LIKE '%CENTRO%'; -- NESSE CASO É PARA BUSCAR PALAVRAS NO MEIO DE FRASES, COMEÇA COM QLQR, TEM UMA PALAVRA E TERMINA COM QLQR COISA
 
 
 /* OPERADORES LÓGIOCOS
	OR -> PARA QUE A SAÍDA SEJA VERDADEIRA PELO MENOS 1 DAS CONDIÇÕES DEVE SER VERDADEIRA
	AND -> PARA QUE A SAÍDA SEJA VERDADEIRA TODAS AS CONDIÇÕES DEVEM SER VERDADEIRAS
*/	


/* OR - OU*/

 SHOW TABLES;

 USE PROJETO;

	SELECT * FROM CLIENTE;
	
 SELECT NOME, SEXO, ENDERECO FROM CLIENTE
 WHERE 
 SEXO = 'M' OR ENDERECO LIKE '%RJ';
 
 SELECT NOME, SEXO, ENDERECO FROM CLIENTE
 WHERE 
 SEXO = 'M' AND ENDERECO LIKE '%RJ';
 
 SELECT NOME, SEXO, ENDERECO FROM CLIENTE
 WHERE 
 SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';
 
 /* AND - E */
 
 SELECT NOME, SEXO, ENDERECO FROM CLIENTE
 WHERE 
 SEXO = 'M' AND ENDERECO LIKE '%RJ';
 
 SELECT NOME, SEXO, ENDERECO FROM CLIENTE
 WHERE 
 SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';
 
 /* CONTANDO OS REGISTROS DE UMA TABELA */
 
 SELECT COUNT(*) AS "Quantidade de Registros da Tab. Cliente"
 FROM CLIENTE;
 
 SELECT COUNT(*) 
 FROM CLIENTE;  --SOMA TODAS AS LINHAS DA TABELA PARA CONTAR A QUANTIDADE DE REGISTROS
 
 /* OPERADOR GROUP BY */

SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO; -- AGRUPA TODA A SOMA E DIVIDE PELOS SEXO
 

 
 /* FILTRANDO VALORES NULOS */
 
 SELECT NOME, EMAIL, ENDERECO
 FROM CLIENTE
 WHERE SEXO = 'F';
 
 SELECT NOME, EMAIL, ENDERECO
 FROM CLIENTE
 WHERE EMAIL = NULL;
 
 SELECT NOME, EMAIL, ENDERECO
 FROM CLIENTE
 WHERE EMAIL IS NULL;	--TRAZ TODOS OS CLIENTES COM EMAIL NULOS
 
 SELECT NOME, EMAIL, ENDERECO
 FROM CLIENTE
 WHERE EMAIL IS NOT NULL; --TRAZ TODOS OS CLIENTE QUE NÃO TEM O EMAIL NULO.
 
/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

 SELECT NOME, EMAIL
 FROM CLIENTE;
 
 UPDATE CLIENTE
 SET EMAIL = 'LILIAN@HOTMAIL.COM'; --DESTA FORMA É ATUALIZADO TODOS OS EMAIL PARA O MSM EMAIL 
--O METODO CORRETO PARA QUE ISSO NÃO ACONTECÇA É USAR O FILTRO WHERE
--EXISTEM COMANDO PARA DESFAZER CASSO OCORRA DE TROCAR TODOS OS DADOS POR ACIDENTE, QUE SÃO OS COMANDO COMMIT OU ROLLBACK


/* WHERE - MELHOR AMIGO PARA VIDA INTEIRA */

SELECT * FROM CLIENTE
WHERE NOME = 'JOAO';

UPDATE CLIENTE
SET EMAIL = 'JOAO@GMAIL.COM'
WHERE NOME = 'JOAO';


UPDATE CLIENTE
SET EMAIL = 'CELIA@GMAIL.COM'
WHERE NOME = 'CELIA';

UPDATE CLIENTE
SET EMAIL = 'JORGE@IG.COM.BR'
WHERE NOME = 'JORGE';

UPDATE CLIENTE
SET EMAIL = 'ANA@GLOBO.COM'
WHERE NOME = 'ANA';

UPDATE CLIENTE
SET EMAIL = 'CARLA@TERATI.COM.BR'
WHERE NOME = 'CARLA';


/*USANDO A CLAUSA DELETE*/

DELETE FROM CLIENTE;  --DELETA A TABELA

SELECT COUNT(*) FROM CLIENTE;  --CONTAR A QUANTIDADE DA TABELA PARA SABER A QUANTIDADE A SER DELETADA

DELETE FROM CLIENTE
WHERE NOME = 'ANA'; --WHERE SERVE COMO FILTRO PARA DELETAR APENAS O CAMPO ESPECIFICADO 

DELETE FROM CLIENTE 
WHERE NOME = 'CARLA'; --SE TIVER MAIS DE 1 NOME IGUAL NO BANCO APENAS O COMANDO WHERE NÃO É SUFICIENTE

DELETE FROM CLIENTE
WHERE NOME = 'ANA'
OR EMAIL = 'ANA@GLOBO.COM'; --DELETA TODOS O REGISTROS QUE ATENDEREM QLQR UMA DAS CONDIÇÕES.

/*DICA IMPORTANTE*/
--PARA CONFIRMAR SE UM DELETE ESTÁ CORRENDO PODEMOS UTILIZAR DO ARTIFICIO SELECT * NO LUGAR DO DELETE, ASSIM SERÁ INFORMADO NA TELA TODOS OS DADOS QUE SERÃO SELECIONADO PARA O DELETE, E DESSA FORMA PODEMOS CHEGAR SE TUDO ESTÁ CORRETO PARA EVITAR ERROS.
SELECT * FROM CLIENTE
WHERE NOME = 'ANA'
OR EMAIL = 'ANA@GLOBO.COM'; --CONFIRMA OQUE ESTÁ PARA SER DELETADO

SELECT * FROM CLIENTE
WHERE NOME = 'ANA'
AND EMAIL = 'ANA@GLOBO.COM';

DELETE FROM CLIENTE
WHERE NOME = 'ANA'
AND EMAIL = 'ANA@GLOBO.COM'; --PODEMOS TBM UTILIZAR OS OPERADORES LOGICOS PARA TER UM FILTRO UM POUCO MAIS PRECISO
--ONDE AQUI SERIA NECESSARIO ATENDER AS 2 CONDIÇÕES


/* PRIMEIRA FORMA NORMAL */

/*

1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA
[AMERELO, AZUL, VERMELHOR] -> VETOR DE CORES
[UNO, FIESTA, KA, CIVIC] -> VETOR DE CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA.
QUANDO O CAMPO FOR DIVISÍVEL 

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODOO REGISTRO COMO SENDO UNICO
ISSO É OQUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY


*/

/* CRIANDO NOVO BANCO DE DATOS */ 

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE (
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,--AUTO INCREMENTA O ID
	NOME VARCHAR(30) NOT NULL, --NÃO PODE SER NULO
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE, --UNIQUE NÃO DEIXA O VALOR SE REPETIR, MAIS PODE SER NULO
	CPF VARCHAR(11) UNIQUE
);

CREATE TABLE CLIENTE (
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL, 
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE, 
	CPF VARCHAR(11) UNIQUE
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE, --DETERMINA A REGRA DE NEGOCIO 1 X 1 PARA QUE UM CLIENTE NÃO TENHA MAIS DE 1 ENDEREÇO
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE, 
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE (
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	NUMERO VARCHAR(10) NOT NULL,
	TIPO ENUM('CEL','RES','COM') NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);


/* ENDERECO - OBRIGATORIO
CADASTRO DE SOMENTE UM.

TELEFONE - NÃO OBRIGATORIO
CADASTRO DE MAIS DE UM É (OPICIONAL)

*/

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE 
REGISTROS
*/

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICA SEMPRE NA CARDINALIDADE 'N' */

INSERT INTO CLIENTE VALUES(NULL, 'JOAO','M','JOAO@IG.COM','12345678900');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS','M','CARLOS@IG.COM','1222226700');
INSERT INTO CLIENTE VALUES(NULL, 'ANA','F','ANA@IG.COM','12341118900');
INSERT INTO CLIENTE VALUES(NULL, 'CLARA','F',NULL,'444332347');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE','M','JORGE@IG.COM','12348888900');
INSERT INTO CLIENTE VALUES(NULL, 'CELIA','F','JCELIA@IG.COM','21241235234');

SELECT * FROM CLIENTE;

+-----------+--------+------+---------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL         | CPF         |
+-----------+--------+------+---------------+-------------+
|         1 | JOAO   | M    | JOAO@IG.COM   | 12345678900 |
|         2 | CARLOS | M    | CARLOS@IG.COM | 1222226700  |
|         3 | ANA    | F    | ANA@IG.COM    | 12341118900 |
|         4 | CLARA  | F    | NULL          | 444332347   |
|         5 | JORGE  | M    | JORGE@IG.COM  | 12348888900 |
|         6 | CELIA  | F    | JCELIA@IG.COM | 21241235234 |
+-----------+--------+------+---------------+-------------+

DESC ENDERECO;

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA', 'CENTO','B.HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES', 'CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS', 'JARDINS','SÃO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA', 'ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR', 'FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGAIANA', 'CENTRO','VITORIA','ES',5);

SELECT * FROM ENDERECO ;

+------------+--------------------+----------+----------------+--------+------------+
| IDENDERECO | RUA                | BAIRRO   | CIDADE         | ESTADO | ID_CLIENTE |
+------------+--------------------+----------+----------------+--------+------------+
|          1 | RUA ANTONIO SA     | CENTO    | B.HORIZONTE    | MG     |          4 |
|          2 | RUA CAPITAO HERMES | CENTRO   | RIO DE JANEIRO | RJ     |          1 |
|          3 | RUA PRES VARGAS    | JARDINS  | SÃO PAULO      | SP     |          3 |
|          4 | RUA ALFANDEGA      | ESTACIO  | RIO DE JANEIRO | RJ     |          2 |
|          5 | RUA DO OUVIDOR     | FLAMENGO | RIO DE JANEIRO | RJ     |          6 |
|          6 | RUA URUGAIANA      | CENTRO   | VITORIA        | ES     |          5 |
+------------+--------------------+----------+----------------+--------+------------+

DESC TELEFONE;

+------------+-------------------------------------------+------+-----+---------+----------------+
| Field      | Type                                      | Null | Key | Default | Extra          |
+------------+-------------------------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                                   | NO   | PRI | NULL    | auto_increment |
| NUMERO     | varchar(10)                               | NO   |     | NULL    |                |
| TIPO       | enum('CELULAR','RESIDENCIAL','COMERCIAL') | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                                   | YES  | MUL | NULL    |                |
+------------+-------------------------------------------+------+-----+---------+----------------+

INSERT INTO TELEFONE VALUES(NULL,'23454321','CELULAR',5);
INSERT INTO TELEFONE VALUES(NULL,'34561234','RESIDENCIAL',5);
INSERT INTO TELEFONE VALUES(NULL,'98762345','CELULAR',1);
INSERT INTO TELEFONE VALUES(NULL,'68904123','COMERCIAL',2);
INSERT INTO TELEFONE VALUES(NULL,'56788245','RESIDENCIAL',1);
INSERT INTO TELEFONE VALUES(NULL,'86506214','CELULAR',3);
INSERT INTO TELEFONE VALUES(NULL,'15399023','CELULAR',3);
INSERT INTO TELEFONE VALUES(NULL,'34534512','COMERCIAL',1);
INSERT INTO TELEFONE VALUES(NULL,'09877523','RESIDENCIAL',5);
INSERT INTO TELEFONE VALUES(NULL,'08755983','CELULAR',2);


DELETE FROM TELEFONE
WHERE TIPO = 'CELULAR'
AND IDTELEFONE = 1;


SELECT * FROM TELEFONE;


/*	SELECAO, PROJEÇÃO E JUNÇÃO */

/* PROJEÇÃO -> É TUDO QUE VC QUER VER NA TELA */

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/* SELEÇÃO -> É UM SUBCONJUNTO DE TOTAIS DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELEÇÃO É O WHERE
*/

SELECT NOME, SEXO, EMAIL/*PROJEÇÃO*/
FROM CLIENTE/*ORIGEM*/
WHERE SEXO = 'F';/*SELEÇÃO*/

SELECT NUMERO
FROM TELEFONE
WHERE TIPO = 'CELULAR';

/* JUNÇÃO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

+--------+---------------+-----------+
| NOME   | EMAIL         | IDCLIENTE |
+--------+---------------+-----------+
| JOAO   | JOAO@IG.COM   |         1 |
| CARLOS | CARLOS@IG.COM |         2 |
| ANA    | ANA@IG.COM    |         3 |
| CLARA  | NULL          |         4 |
| JORGE  | JORGE@IG.COM  |         5 |
| CELIA  | JCELIA@IG.COM |         6 |
+--------+---------------+-----------+

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTO    | B.HORIZONTE    |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SÃO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /*SELECÇÃO*/
FROM CLIENTE, ENDERECO /*ORIGEM*/
WHERE IDCLIENTE = ID_CLIENTE; /*JUNÇÃO*/

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SÃO PAULO      |
| CLARA  | F    | CENTO    | B.HORIZONTE    |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* WHERE = SELEÇÃO */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SÃO PAULO      |
| CLARA | F    | CENTO    | B.HORIZONTE    |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+]

/*WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; - TABELA VERDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SÃO PAULO      |
| CLARA  | F    | CENTO    | B.HORIZONTE    |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
INNER JOIN ENDERECO /* JUNÇÃO */
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELEÇÃO */

+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | JARDINS  | SÃO PAULO      |
| CLARA | F    | CENTO    | B.HORIZONTE    |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE;

+--------+------+---------------+-------------+----------+
| NOME   | SEXO | EMAIL         | TIPO        | NUMERO   |
+--------+------+---------------+-------------+----------+
| JORGE  | M    | JORGE@IG.COM  | CELULAR     | 23454321 |
| JORGE  | M    | JORGE@IG.COM  | RESIDENCIAL | 34561234 |
| JOAO   | M    | JOAO@IG.COM   | CELULAR     | 98762345 |
| CARLOS | M    | CARLOS@IG.COM | COMERCIAL   | 68904123 |
| JOAO   | M    | JOAO@IG.COM   | RESIDENCIAL | 56788245 |
| ANA    | F    | ANA@IG.COM    | CELULAR     | 86506214 |
| ANA    | F    | ANA@IG.COM    | CELULAR     | 15399023 |
| JOAO   | M    | JOAO@IG.COM   | COMERCIAL   | 34534512 |
| JORGE  | M    | JORGE@IG.COM  | RESIDENCIAL | 09877523 |
| CARLOS | M    | CARLOS@IG.COM | CELULAR     | 08755983 |
+--------+------+---------------+-------------+----------+


/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN ENDERECO
	ON IDCLIENTE = ID_CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE

+--------+------+---------+----------------+-------------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO        | NUMERO   |
+--------+------+---------+----------------+-------------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CELULAR     | 23454321 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 34561234 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CELULAR     | 98762345 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COMERCIAL   | 68904123 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RESIDENCIAL | 56788245 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 86506214 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 15399023 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COMERCIAL   | 34534512 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 09877523 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CELULAR     | 08755983 |
+--------+------+---------+----------------+-------------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C /* TECNICA DE PONTERAMENTO APLICA UM APELIDO A TABELA */ 
	INNER JOIN ENDERECO E /* TECNICA DE PONTERAMENTO APLICA UM APELIDO A TABELA */
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T /* TECNICA DE PONTERAMENTO APLICA UM APELIDO A TABELA */
	ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C 
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+-------------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO        | NUMERO   |
+--------+------+---------+----------------+-------------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CELULAR     | 23454321 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 34561234 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CELULAR     | 98762345 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COMERCIAL   | 68904123 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RESIDENCIAL | 56788245 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 86506214 |
| ANA    | F    | JARDINS | SÃO PAULO      | CELULAR     | 15399023 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COMERCIAL   | 34534512 |
| JORGE  | M    | CENTRO  | VITORIA        | RESIDENCIAL | 09877523 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CELULAR     | 08755983 |
+--------+------+---------+----------------+-------------+----------+

/*
	
	DML = DATA MANIPULATION LANGUAGE 
	DDL = DATA DEFIUNITON LANGUAGE
	DCL = DATA CONTROL LANGUAGE
	TCL = TRANSARTION CONTROL LANGUAGE

*/

/* INSERT */

INSERT INTO CLIENTE VALUES(NULL, 'PAULA','M', NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA', 'NITEROI', 'RJ', 7);

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPADETE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7; --CERTIFICAR QUE É O RESGISTRO QUE ESTÁ SENDO BUSCADO PARA DPS FAZER O UPDATE

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */

INSERT INTO CLIENTE VALUES(NULL, 'XXX', 'M', NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;


DELETE FROM CLIENTE
WHERE IDCLIENTE = 8;



/* 

	DDL DATA DEFINITON LANGUAGE 
*/

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2)NOT NULL
);

DESC PRODUTO;

+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| PRECO        | int(11)     | YES  |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT; --RECOMENDADO PARA ALTERAR NOMES 

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL; --RECOMENDADO PARA ALTERAR TIPOS

DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO COLUNAS */ -- NÃO ADICIONAR COLUNAS EM INICIO DE PROJETOS, DELETE A TABELA E CRIE NOVAMENTE

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

DESC PRODUTO; 
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* APAGANDO UMA COLUNA */ --NÃO APAGAR COLUNAS EM INICIO DE PROJETOS, DELETE A TABELA E CRIE NOVAMENTE

ALTER TABLE PRODUTO
DROP COLUMN PESO;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/* ADICIONANDO COLUNA EM UMA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

DESC PRODUTO; 

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


/* NOME, EMAIL, NUMERO, ESTADO */

SELECT C.NOME, C.EMAIL, 
	   E.ESTADO, 
	   T.NUMERO AS FONE
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+--------+----------+
| NOME    | EMAIL             | ESTADO | FONE     |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@IG.COM      | ES     | 78458743 |
| JORGE   | JORGE@IG.COM      | ES     | 56576876 |
| JOAO    | JOAOA@IG.COM      | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 54768899 |
| JOAO    | JOAOA@IG.COM      | RJ     | 99667587 |
| ANA     | ANA@IG.COM        | SP     | 78989765 |
| ANA     | ANA@IG.COM        | SP     | 99766676 |
| JOAO    | JOAOA@IG.COM      | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM      | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 88687909 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
| GIOVANA | NULL              | RJ     | 33567765 |
| GIOVANA | NULL              | RJ     | 88668786 |
| GIOVANA | NULL              | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| EDUARDO | NULL              | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| JOICE   | JOICE@GMAIL.COM   | RJ     | 44522578 |
+---------+-------------------+--------+----------+


SELECT 	C.NOME, 
	  	IFNULL(C.EMAIL,'EMAIL NÃO DISPONIVEL') AS "E-MAIL", 
	  	E.ESTADO, 
	  	T.NUMERO AS FONE
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
/* IFNULL É UMA FUNÇÃO QUE RECEBE UM PARAMETRO PARA SUBSTITUIR UM ESPAÇO NULL
POR UM TEXTO PRE PROGRAMADO */

/* VIEW */

SELECT 	C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'************') AS 'E-MAIL',
		T.TIPO, 
		T.NUMERO,
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE;

/* CRIANDO UMA VIEW */

CREATE VIEW RELATORIO AS 
SELECT 	C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'************') AS 'E-MAIL',
		T.TIPO, 
		T.NUMERO,
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE;


SHOW VIEWS; -- NÃO EXISTE 

SHOW TABLES;
+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| relatorio          |--VIEW CRIADA É MOSTRADA COMO UMA TABELA 
| telefone           |
+--------------------+


/* DELETANDO UMA VIEW */

DROP VIEW RELATORIO;

/* COMO IDENTIFICAR UMA VIEW E NÃO CONFUNDIR COM AS TABELAS */
/*
A MELHOR MANEIRA É ADICIONANDO UM PREFIXO COMO UM V_VIEW 
*/

CREATE VIEW V_RELATORIO AS 
SELECT 	C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM E-MAIL') AS 'E-MAIL',
		T.TIPO, 
		T.NUMERO,
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE;

mysql> SHOW TABLES;
+--------------------+
| Tables_in_comercio |
+--------------------+
| cliente            |
| endereco           |
| produto            |
| telefone           |
| v_relatorio        | -- O PREFIXO V_ IDENTIFICAMOS QUE É UM VIEW E NÃO TABELA
+--------------------+

/* CONSULTAS RESTRITIVAS COM AS VIEWS */

SELECT NOME, ESTADO, NUMERO
FROM V_RELATORIO;

+---------+--------+----------+
| NOME    | ESTADO | NUMERO   |
+---------+--------+----------+
| JORGE   | ES     | 78458743 |
| JORGE   | ES     | 56576876 |
| JOAO    | RJ     | 87866896 |
| CARLOS  | RJ     | 54768899 |
| JOAO    | RJ     | 99667587 |
| ANA     | SP     | 78989765 |
| ANA     | SP     | 99766676 |
| JOAO    | RJ     | 66687899 |
| JORGE   | ES     | 89986668 |
| CARLOS  | RJ     | 88687909 |
| FLAVIO  | MG     | 68976565 |
| FLAVIO  | MG     | 99656675 |
| GIOVANA | RJ     | 33567765 |
| GIOVANA | RJ     | 88668786 |
| GIOVANA | RJ     | 55689654 |
| KARLA   | RJ     | 88687979 |
| DANIELE | ES     | 88965676 |
| EDUARDO | PR     | 89966809 |
| ANTONIO | SP     | 88679978 |
| ANTONIO | PR     | 99655768 |
| ELAINE  | SP     | 89955665 |
| CARMEM  | RJ     | 77455786 |
| CARMEM  | RJ     | 89766554 |
| ADRIANA | RJ     | 77755785 |
| JOICE   | RJ     | 44522578 |
+---------+--------+----------+


/* UPDATE, INSERT E DELETE - DML VIEW */

INSERT INTO V_RELATORIO VALUES(
'ANDREIA', 'F','ANDREIA@UOL.COM', 'CEL','873547864','CENTRO','VITORIA','ES'
);

ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
--NÃO É PERMITIDO FAZER INSERT EM VIEWS COM JOIN

DELETE FROM V_RELATORIO WHERE NOME = 'JORGE';

ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'
--TAMBÉM NÃO PERMITIDO FAZE O DELETE DE UM VIEW COM JOIN 

UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE';

--UM UPDATE É PERMITIDO MSM EM UMA VIEW COM JOIN.

SELECT * FROM V_RELATORIO;

+---------+------+--------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+--------------------+------+----------+------------+----------------+--------+
| JOSE    | M    | JORGE@IG.COM       | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |*-- O NOME JORGE FOI ALTERADO PARA JOSE
| JOSE    | M    | JORGE@IG.COM       | RES  | 56576876 | CENTRO     | VITORIA        | ES     |*
| JOAO    | M    | JOAOA@IG.COM       | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM     | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM       | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM         | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM         | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| JOAO    | M    | JOAOA@IG.COM       | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOSE    | M    | JORGE@IG.COM       | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| CARLOS  | M    | CARLOSA@IG.COM     | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| FLAVIO  | M    | FLAVIO@IG.COM      | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM      | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | CLIENTE SEM E-MAIL | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM E-MAIL | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM E-MAIL | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM    | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM  | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | CLIENTE SEM E-MAIL | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM     | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM    | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM   | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+--------------------+------+----------+------------+----------------+--------+

/* CENARIO DE TESTE */

CREATE TABLE JOGADORES(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO VARCHAR(2)
);

INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS');
INSERT INTO JOGADORES VALUES(2,'GABIGOL','RJ');
INSERT INTO JOGADORES VALUES(3,'GANSO','RJ');
INSERT INTO JOGADORES VALUES(4,'NENÊ','RJ');
INSERT INTO JOGADORES VALUES(5,'LOVE','SP');


CREATE VIEW V_JOGADORES AS 
SELECT NOME, ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;

+----------+--------+
| NOME     | ESTADO |
+----------+--------+
| GUERRERO | RS     |
| GABIGOL  | RJ     |
| GANSO    | RJ     |
| NENÊ     | RJ     |
| LOVE     | SP     |
+----------+--------+

/* NAS VIEW QUE NÃO TENHAM JOIN É POSSIVEL USAR OS COMANDOS DE DELETE E INSERT NAS VIEWS DESDE QUE SIGAM AS ORDEM DAS TABELA */

SELECT * FROM V_RELATORIO
WHERE SEXO = 'F';

/* ORDER BY */

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOÃO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE');

SELECT * FROM ALUNOS
ORDER BY NUMERO; -- ORDENANDO PELO NOME DA COLUNA

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOÃO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 1; -- ORDENANDO PELA COLUNA 1

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | JOÃO    |
|      1 | MARIA   |
|      1 | CLARA   |
|      1 | JANAINA |
|      2 | ZOE     |
|      2 | ANDRE   |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      5 | ANTONIO |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

SELECT * FROM ALUNOS
ORDER BY 2; -- ORDENANDO PELA COLUNA 2

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | ANA     |
|      2 | ANDRE   |
|      5 | ANTONIO |
|      3 | CLARA   |
|      1 | CLARA   |
|      4 | GIOVANI |
|      5 | JANAINA |
|      1 | JANAINA |
|      1 | JOÃO    |
|      4 | MAFRA   |
|      3 | MARCELO |
|      1 | MARIA   |
|      6 | VIVIANE |
|      2 | ZOE     |
+--------+---------+

/* ORDENANDO POR MAIS DE UMA COLUNA */


SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME; -- ORDENANDO PELA COLUNA NUMERO E PELA COLUNA NOME, OU SEJA SE TIVER MAIS NOMES COM O MSM NUMERO ELES SERÃO ORGANIZADOS ENTRE OS NUMERO E NOMES.

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      1 | CLARA   |
|      1 | JANAINA |
|      1 | JOÃO    |
|      1 | MARIA   |
|      2 | ANDRE   |
|      2 | ZOE     |
|      3 | CLARA   |
|      3 | MARCELO |
|      4 | GIOVANI |
|      4 | MAFRA   |
|      5 | ANTONIO |
|      5 | JANAINA |
|      6 | ANA     |
|      6 | VIVIANE |
+--------+---------+

/* MESCLANDO ORDER BY COM PROJEÇÃO */

SELECT NOME FROM ALUNOS
ORDER BY 1, 2; --DESTA FORMA TERIAMOS UM ERRO, POIS O ORDER BY NÃO SABERIA DIZER QUEM É A COLUNA 2, POR ELA ESTAR NA PROJEÇÃO


SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME; -- JÁ DESTA FORMA O ORDER BY SABE QUAL O NOME DA COLUNA QUE ELE PRECISA BUSCAR E JÁ CONSEGUE ENCONTRAR E ORGANIZAR

/*
SEMPRE QUE PRECISAR MESCLAR ORDER BY COM PROJEÇÃO É ACONCELHÁVEL USAR NOMES DE COLUNA AO INVES DE INDICIES
*/

/* ORDER BY DESC / ASC */

SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 1 ASC; --COMPORTAMENTO DEFAULT

SELECT * FROM ALUNOS
ORDER BY 1 DESC;--COMPORTAMENTO DESCENDENTE

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;

+--------+---------+
| NUMERO | NOME    |
+--------+---------+
|      6 | VIVIANE |
|      6 | ANA     |
|      5 | JANAINA |
|      5 | ANTONIO |
|      4 | MAFRA   |
|      4 | GIOVANI |
|      3 | MARCELO |
|      3 | CLARA   |
|      2 | ZOE     |
|      2 | ANDRE   |
|      1 | MARIA   |
|      1 | JOÃO    |
|      1 | JANAINA |
|      1 | CLARA   |
+--------+---------+

SELECT 	C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM E-MAIL') AS 'E-MAIL',
		T.TIPO, 
		T.NUMERO,
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

+---------+------+--------------------+------+----------+------------+----------------+--------+
| NOME    | SEXO | E-MAIL             | TIPO | NUMERO   | BAIRRO     | CIDADE         | ESTADO |
+---------+------+--------------------+------+----------+------------+----------------+--------+
| ADRIANA | F    | ADRIANA@GMAIL.COM  | RES  | 77755785 | CENTRO     | RIO DE JANEIRO | RJ     |
| ANA     | F    | ANA@IG.COM         | CEL  | 99766676 | JARDINS    | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM         | CEL  | 78989765 | JARDINS    | SAO PAULO      | SP     |
| ANTONIO | M    | ANTONIO@UOL.COM    | CEL  | 99655768 | BOM RETIRO | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@IG.COM     | COM  | 88679978 | JARDINS    | SAO PAULO      | SP     |
| CARLOS  | M    | CARLOSA@IG.COM     | CEL  | 88687909 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARLOS  | M    | CARLOSA@IG.COM     | COM  | 54768899 | ESTACIO    | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 89766554 | CENTRO     | RIO DE JANEIRO | RJ     |
| CARMEM  | F    | CARMEM@IG.COM      | RES  | 77455786 | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM  | COM  | 88965676 | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | CLIENTE SEM E-MAIL | CEL  | 89966809 | CENTRO     | CURITIBA       | PR     |
| ELAINE  | F    | ELAINE@GLOBO.COM   | RES  | 89955665 | LAPA       | SAO PAULO      | SP     |
| FLAVIO  | M    | FLAVIO@IG.COM      | CEL  | 99656675 | CASCADURA  | B. HORIZONTE   | MG     |
| FLAVIO  | M    | FLAVIO@IG.COM      | RES  | 68976565 | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | CLIENTE SEM E-MAIL | CEL  | 88668786 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM E-MAIL | CEL  | 33567765 | CENTRO     | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM E-MAIL | COM  | 55689654 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM       | COM  | 66687899 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM       | RES  | 99667587 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOAO    | M    | JOAOA@IG.COM       | CEL  | 87866896 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM    | COM  | 44522578 | CENTRO     | RIO DE JANEIRO | RJ     |
| JOSE    | M    | JORGE@IG.COM       | RES  | 56576876 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM       | CEL  | 78458743 | CENTRO     | VITORIA        | ES     |
| JOSE    | M    | JORGE@IG.COM       | RES  | 89986668 | CENTRO     | VITORIA        | ES     |
| KARLA   | F    | KARLA@GMAIL.COM    | COM  | 88687979 | COPACABANA | RIO DE JANEIRO | RJ     |
+---------+------+--------------------+------+----------+------------+----------------+--------+


/* DELIMITADOR */

SELECT 	C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM E-MAIL') AS 'E-MAIL',
		T.TIPO, 
		T.NUMERO,
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
	INNER JOIN TELEFONE T 
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E 
	ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1; --O ';' É O DELIMITADOR DO COMANDO É QUANDO O BANCO RECEBE A ORDEM DE EXERCUTAR TUDO ANTES DO ;


STATUS --MOSTRA AS CONFIGURAÇÕES USADAS 

C:\Program Files (x86)\MySQL\MySQL Server 5.7\bin\mysql.exe  Ver 14.14 Distrib 5.7.20, for Win32 (AMD64)

Connection id:          3
Current database:       comercio
Current user:           root@localhost
SSL:                    Not in use
Using delimiter:        ;
Server version:         5.7.20-log MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8
Db     characterset:    utf8
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 4 hours 54 min 35 sec

Threads: 1  Questions: 77  Slow queries: 0  Opens: 113  Flush tables: 1  Open tables: 106  Queries per second avg: 0.004
--------------

DELIMITER $ --ALTERA O DELIMITADOR USADO, ESSA PRATICA É USADA QUANDO PRECISAMOS ENVOLVER A PROGRAMAÇÃO DENTRO DO BANCO DE DADOS

/* STORED PROCEDURES */

SELECT 'DIEGO';

DELIMITER $

--CRIA UM PROCEDIMENTO
CREATE PROCEDURE NOME()
BEGIN --INICIA O BLOCO DE PROGRAÇÃO

	QLQR PROGRAMAÇÃO --BLOCO DE PROGRAMAÇÃO
END -- TERMINA O BLOCO DE PROGRAMAÇÃO
$ --REFERE AO BANCO QUE APARTIR DESSE DELIMITADOR E EXECUTAR TODA A QUERY



CREATE PROCEDURE NOME_EMPRESA()
BEGIN
	
	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$

/* CHAMANDO UMA PROCEDURE */

CALL NOME_EMPRESA()$--$ DELIMITADOR EM USO

DELIMITER ;

CALL NOME_EMPRESA();

/* PROCEDURES COM PARAMETROS */

SELECT 10 + 10 AS CONTA;

DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN
	
	SELECT 10 + 10 AS CONTA;

END
$

DELIMITER ;

DROP PROCEDURE CONTA;

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	
	SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$

DELIMITER ;

CALL CONTA(25, 200);/*O NUMERO SEGUE O MSM PARAMETRO DO QUE FOI INDICADO NA PROCEDURE, ONDE O PRIMEIRO NUMERO ANTES DA VIRGULA 
					REPRESENTA O N1 E O SEGUNDO REPORESENTA O N2*/
CALL CONTA(25, 200);
CALL CONTA(1231231, 2131200);
CALL CONTA(24213, 200123);

/* RECAP + PROCEDURES */

SHOW DATABASES;

DROP DATABASE PROJETO;

CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);


INSERT INTO CURSOS VALUES(NULL,'JAVA', 30, 500.00);
INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCO DE DADOS', 40, 700.00);

DELIMITER #

STATUS

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
						   P_HORAS INT(30),
						   P_PRECO FLOAT(10,2))
BEGIN
	
	INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);

END
#

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER',35,3000.00);
CALL CAD_CURSO('POWER BI',20,1000.00);
CALL CAD_CURSO('TABLEAU',30,1200.00);


/* CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS */

DELIMITER #

CREATE PROCEDURE CHECK_CURSO()
BEGIN
	
	SELECT IDCURSO,
		   NOME AS 'CURSO',
		   HORAS,
		   VALOR AS 'PREÇO'
	FROM CURSOS;

END
#

DELIMITER ;


CALL CHECK_CURSO;


DROP PROCEDURE CHECK_CURSO


/* FUNÇÕES DE AGREGAÇÃO */

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO VARCHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)

);

INSERT INTO VENDEDORES VALUES(NULL, 'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL, 'MARIA','F',12312.32,45356.66,6456.20);
INSERT INTO VENDEDORES VALUES(NULL, 'ANTONIO','M',67865.12,45642.12,5464.64);
INSERT INTO VENDEDORES VALUES(NULL, 'CLARA','F',87343.57,23423.23,3145.12);
INSERT INTO VENDEDORES VALUES(NULL, 'ANDERSON','M',23424.32,65751.32,3245.87);
INSERT INTO VENDEDORES VALUES(NULL, 'IVONE','F',87971.54,53453.65,8678.65);
INSERT INTO VENDEDORES VALUES(NULL, 'JOAO','M',14568.43,12362.82,6789.34);
INSERT INTO VENDEDORES VALUES(NULL, 'CELIA','F',23423.12,45645.72,7686.12);


SELECT * FROM VENDEDORES;
+------------+----------+------+----------+-----------+---------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO  | FEVEREIRO | MARCO   |
+------------+----------+------+----------+-----------+---------+
|          1 | CARLOS   | M    | 76234.78 |  88346.87 | 5756.90 |
|          2 | MARIA    | F    | 12312.32 |  45356.66 | 6456.20 |
|          3 | ANTONIO  | M    | 67865.12 |  45642.12 | 5464.64 |
|          4 | CLARA    | F    | 87343.57 |  23423.23 | 3145.12 |
|          5 | ANDERSON | M    | 23424.32 |  65751.32 | 3245.87 |
|          6 | IVONE    | F    | 87971.54 |  53453.65 | 8678.65 |
|          7 | JOAO     | M    | 14568.43 |  12362.82 | 6789.34 |
|          8 | CELIA    | F    | 23423.12 |  45645.72 | 7686.12 |
+------------+----------+------+----------+-----------+---------+



/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

+-----------+
| MAIOR_FEV |
+-----------+
|  88346.87 | -- MAIOR VALOR DE VENDAS DE FEVERIRO 
+-----------+



/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */

SELECT MIN(FEVEREIRO) AS MENOR_FEV
FROM VENDEDORES;

+-----------+
| MENOR_FEV |
+-----------+
|  12362.82 | -- MENOR VALOR DE VENDAS DE FEVEREIRO
+-----------+


/* AVG - TRAZ O VALOR MEDIO DE UMA COLUNA */

SELECT AVG(FEVEREIRO) AS MEDIA_FEV
FROM VENDEDORES;

+--------------+
| MEDIA_FEV    |
+--------------+
| 47497.798340 | -- VALOR MEDIO DE TODA A QUANTIDADE DE FEVEREIRO
+--------------+

/* VARIAS FUNÇÕES + TRUNCATE */

SELECT MAX(JANEIRO) AS MAX_JAN,
	   MIN(JANEIRO) AS MIN_JAN,
	   TRUNCATE( AVG(JANEIRO),2) AS MEDIA_JAN
FROM VENDEDORES;
--FUNC TRUNCATE RECEBE 2 PARAMETROS, 1º UM NUMERO,2º A QUANTIDADE DE CASAS DECIMAIS.

+----------+----------+-----------+
| MAX_JAN  | MIN_JAN  | MEDIA_JAN |
+----------+----------+-----------+
| 87971.54 | 12312.32 |  49142.89 | -- A MEDIA VEM ARREDONDADA PARA APENAS 2 CASAS DECIMAIS, POR CONTA DO USO DA FUNÇÃO TRUNCATE
+----------+----------+-----------+

/* FUNÇÃO DE AGREGAÇÃO SUM() 'SOMA' */

SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

+-----------+
| TOTAL_JAN |
+-----------+
| 393143.20 | --SOMA TODOS OS DADOS DE JANEIRO E RETORNA O VALOR TOTAL
+-----------+


SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

+-----------+-----------+-----------+
| TOTAL_JAN | TOTAL_FEV | TOTAL_MAR |
+-----------+-----------+-----------+
| 393143.20 | 379982.39 |  47222.84 | --SOMA DE CADA COLUNA DA TABELA E TRAZENDO SEUS RESPECTIVOS TOTAIS.
+-----------+-----------+-----------+

/* FUNÇÃO SUM() COM USO DO GROUP BY */

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;

+------+-------------+
| SEXO | TOTAL_MARCO |
+------+-------------+
| F    |    25966.09 |--AGRUPA OS REGISTROS POR SEXO E REALIZA O SOMATORIO DE CADA GRUPO
| M    |    21256.75 |
+------+-------------+

]


SELECT * FROM VENDEDORES;

/* VALOR E NOME DE QUEM VENDEU MENOS NO MES DE MARCO */

SELECT NOME, MARCO AS 'MIN_MARCO'
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES); --SUB QUERY, É ESCRITA UMA QUERY DENTRO DOS PARENTESES PARA QUE SEJA EXECUTADA PRIMEIRO

+-------+-----------+
| NOME  | MIN_MARCO |
+-------+-----------+
| CLARA |   3145.12 |
+-------+-----------+

/* VALOR E NOME DE QUEM VENDEU MAIS NO MES DE MARCO */

SELECT NOME, MARCO AS 'MAX_MARCO'
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

+-------+-----------+
| NOME  | MAX_MARCO |
+-------+-----------+
| IVONE |   8678.65 |
+-------+-----------+

/* VALOR E NOME DE QUEM VENDEU ACIMA DA MEDIA NO MES DE MARCO */


SELECT NOME, FEVEREIRO AS 'ACIMA_DA_MEDIA'
FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES); --O FILTRO FAZ A ASSOCIAÇÃO QUE PRECISA TRAZER OS VENDEDORES QUE TENHAM VENDIDO MAIS QUE A MEDIA

+----------+----------------+
| NOME     | ACIMA_DA_MEDIA |
+----------+----------------+
| CARLOS   |       88346.87 |
| ANDERSON |       65751.32 |
| IVONE    |       53453.65 |
+----------+----------------+

SELECT TRUNCATE(AVG(FEVEREIRO), 2) AS 'MEDIA_FEV' FROM VENDEDORES;

+-----------+
| MEDIA_FEV |
+-----------+
|  47497.79 |-- A MEDIA DE FEVEREIRO PARA TER UMA COMPROVAÇÃO QUE TODOS OS VENDEDORES ESTÃO REALMENTE A CIMA DA MEDIA
+-----------+


/* OPERAÇÕES EM LINHA */

SELECT * FROM VENDEDORES;

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	FROM VENDEDORES;

+----------+----------+-----------+---------+-----------+----------+
| NOME     | JANEIRO  | FEVEREIRO | MARCO   | TOTAL     | MEDIA    |
+----------+----------+-----------+---------+-----------+----------+
| CARLOS   | 76234.78 |  88346.87 | 5756.90 | 170338.55 | 56779.51 |
| MARIA    | 12312.32 |  45356.66 | 6456.20 |  64125.18 | 21375.06 |
| ANTONIO  | 67865.12 |  45642.12 | 5464.64 | 118971.88 | 39657.29 |
| CLARA    | 87343.57 |  23423.23 | 3145.12 | 113911.92 | 37970.64 |
| ANDERSON | 23424.32 |  65751.32 | 3245.87 |  92421.51 | 30807.17 |
| IVONE    | 87971.54 |  53453.65 | 8678.65 | 150103.84 | 50034.61 |
| JOAO     | 14568.43 |  12362.82 | 6789.34 |  33720.59 | 11240.19 |
| CELIA    | 23423.12 |  45645.72 | 7686.12 |  76754.96 | 25584.98 |
+----------+----------+-----------+---------+-----------+----------+

/* APLICANDO UM % */

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   (JANEIRO+FEVEREIRO+MARCO) * .25 AS "DESCONTO",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	FROM VENDEDORES;


+----------+----------+-----------+---------+-----------+----------+----------+
| NOME     | JANEIRO  | FEVEREIRO | MARCO   | TOTAL     | DESCONTO | MEDIA    |
+----------+----------+-----------+---------+-----------+----------+----------+
| CARLOS   | 76234.78 |  88346.87 | 5756.90 | 170338.55 | 42584.64 | 56779.51 |
| MARIA    | 12312.32 |  45356.66 | 6456.20 |  64125.18 | 16031.30 | 21375.06 |
| ANTONIO  | 67865.12 |  45642.12 | 5464.64 | 118971.88 | 29742.97 | 39657.29 |
| CLARA    | 87343.57 |  23423.23 | 3145.12 | 113911.92 | 28477.98 | 37970.64 |
| ANDERSON | 23424.32 |  65751.32 | 3245.87 |  92421.51 | 23105.38 | 30807.17 |
| IVONE    | 87971.54 |  53453.65 | 8678.65 | 150103.84 | 37525.96 | 50034.61 |
| JOAO     | 14568.43 |  12362.82 | 6789.34 |  33720.59 |  8430.15 | 11240.19 |
| CELIA    | 23423.12 |  45645.72 | 7686.12 |  76754.96 | 19188.74 | 25584.98 |
+----------+----------+-----------+---------+-----------+----------+----------+


/* ORGANIZAÇÃO DE CHAVES - CONSTRAINT (REGRA) */

CREATE DATABASE ESPORTE;

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOMEJOGADOR VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR) 
);


INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FALAMENGO',1);


SHOW CREATE TABLE JOGADOR;

+---------+------------------------------------------------------------------------------------------------
| JOGADOR | CREATE TABLE `jogador` (
  `IDJOGADOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOMEJOGADOR` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDJOGADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 |
+---------+------------------------------------------------------------------------------------------------

SHOW CREATE TABLE TIMES;

+-------+--------------------------------------------------------------------------------------------------
| TIMES | CREATE TABLE `times` (
  `IDTIME` int(11) NOT NULL AUTO_INCREMENT,
  `NOMETIME` varchar(30) DEFAULT NULL,
  `ID_JOGADOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTIME`),
  KEY `ID_JOGADOR` (`ID_JOGADOR`),
  CONSTRAINT `times_ibfk_1` FOREIGN KEY (`ID_JOGADOR`) REFERENCES `jogador` (`IDJOGADOR`) --CHAVES CRIADAS AUTOMATICAMENTE RECEBEM NOMES ALEATORIOS COMO NESSE CASO ONDE A CONSTRAINT SE CHAMA `time_ibfk_1`
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 |
+-------+--------------------------------------------------------------------------------------------------

SHOW TABLES;

/* CRIANDO CONSTRAINT POR FORA DAS TABELAS(BOAS PRATICAS) */


CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO VARCHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT
);


ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);


ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;

+----------+-----------------------------------------------------------------------------------------------------------------------------+
| TELEFONE | CREATE TABLE `telefone` (
  `IDTELEFONE` int(11) DEFAULT NULL,
  `TIPO` varchar(3) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  KEY `FK_CLIENTE_TELEFONE` (`ID_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`)--AGORA A CONSTRAINT TEM UM NOME DEFINIDO
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+----------+-----------------------------------------------------------------------------------------------------------------------------+

/* DICIONARIO DE DADOS */

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |--TABELA DO SISTEMA
| comercio           |
| esporte            |
| exercicio          |
| livraria           |
| mysql              |--TABELA DO SISTEMA
| performance_schema |--TABELA DO SISTEMA
+--------------------+
/*ESTAS TABELAS SÃO OS DICIONARIO DO SISTEMA ONDE PRECISAR ENCONTRAR QLQR OBJETO ESTARÃO LÁ */

USE information_schema;

STATUS 

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

+--------------------+--------------+------+-----+---------+-------+
| Field              | Type         | Null | Key | Default | Extra |
+--------------------+--------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(512) | NO   |     |         |       |
| CONSTRAINT_SCHEMA  | varchar(64)  | NO   |     |         |       |* FAZER BUSCA
| CONSTRAINT_NAME    | varchar(64)  | NO   |     |         |       |* FAZER BUSCA
| TABLE_SCHEMA       | varchar(64)  | NO   |     |         |       |* FAZER BUSCA
| TABLE_NAME         | varchar(64)  | NO   |     |         |       |* FAZER BUSCA
| CONSTRAINT_TYPE    | varchar(64)  | NO   |     |         |       |
+--------------------+--------------+------+-----+---------+-------+


SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "TABELA",
	   CONSTRAINT_NAME AS "NOME REGRA",
	   CONSTRAINT_TYPE AS "TIPO"
	   FROM TABLE_CONSTRAINTS
	   WHERE CONSTRAINT_SCHEMA = "ESPORTE";	

+---------+----------+---------------------+-------------+
| BANCO   | TABELA   | NOME REGRA          | TIPO        |
+---------+----------+---------------------+-------------+
| esporte | cliente  | PRIMARY             | PRIMARY KEY |
| esporte | jogador  | PRIMARY             | PRIMARY KEY |
| esporte | telefone | FK_CLIENTE_TELEFONE | FOREIGN KEY |* CONTRAINT CRIADA FORA DA TABELA E NOMEDA
| esporte | times    | PRIMARY             | PRIMARY KEY |
| esporte | times    | times_ibfk_1        | FOREIGN KEY |* CONTRAINT CRIADA DENTRO DA TABELA E NOMEDA AUTOMATICAMENTE
+---------+----------+---------------------+-------------+


/* APAGANDO CONSTRAINTS */

USE ESPORTE

ALTER TABLE TELEFONE
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;



/* ESTRUTURA DE UMA TRIGGER */

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

	QUALQUER COMANDO SQL 

END -> FIM


CREATE DATABASE AULA40;


CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);


CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

-- CRIANDO A TRIGGER

DELIMITER $ --ALTERAR O DELIMITER PARA OS COMANDOS DE sql DENTRO DA TRIGGER NÃO FECHAR A TRIGGER ANTES DA TRIGGER ACABAR

CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW
BEGIN

	INSERT INTO BKP_USUARIO VALUES
	(NULL,OLD.IDUSUARIO,OLD.NOME,OLD.LOGIN);

END 
$

DELIMITER ;


INSERT INTO USUARIO VALUES(NULL,'ANDADE','ANDRADE2009','HEXACAMPEAO');


SELECT * FROM USUARIO ;

+-----------+--------+-------------+-------------+
| IDUSUARIO | NOME   | LOGIN       | SENHA       |
+-----------+--------+-------------+-------------+
|         1 | ANDADE | ANDRADE2009 | HEXACAMPEAO |
+-----------+--------+-------------+-------------+

DELETE FROM USUARIO WHERE IDUSUARIO = 1;

SELECT * FROM BKP_USUARIO;

+----------+-----------+--------+-------------+
| IDBACKUP | IDUSUARIO | NOME   | LOGIN       |
+----------+-----------+--------+-------------+
|        1 |         1 | ANDADE | ANDRADE2009 |
+----------+-----------+--------+-------------+
--APOS O DELETE FICAMOS APENAS COM O BACKUP QUE FOI PROGRAMADO NA TRIGGER


/* AULA 41 */

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);


CREATE DATABASE BACKUP;

USE BACKUP;


CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);


USE LOJA;

		  --BANCO\\TABELA	
INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,'1000','TESTE',0.00); --ADICIONA O VALOR A OUTRO BANCO

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+-------+-------+
| IDBKP | IDPRODUTO | NOME  | VALOR |
+-------+-----------+-------+-------+
|     1 |      1000 | TESTE |  0.00 |
+-------+-----------+-------+-------+


DELIMITER $


CREATE TRIGGER BACKUP_PRODUT
BEFORE INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR); 

END $

DELIMITER ;


INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);


SELECT * FROM PRODUTO;
	--BANCO LOJA--
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;
	--BANCO DE BACKUP--UM BACKUP LOGICO.
+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO BI         |  80.00 |
|     4 |         0 | LIVRO ORACLE     |  70.00 |
|     5 |         0 | LIVRO SQL SERVER | 100.00 |
+-------+-----------+------------------+--------+


DELIMITER $

CREATE TRIGGER BACKUP_PRODUT_DELETE
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR); 

END $

DELIMITER ;


DELETE FROM PRODUTO
WHERE IDPRODUTO = 2;



SELECT * FROM PRODUTO;

+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO BI         |  80.00 |
|     4 |         0 | LIVRO ORACLE     |  70.00 |
|     5 |         0 | LIVRO SQL SERVER | 100.00 |
|     6 |         2 | LIVRO BI         |  80.00 |
+-------+-----------+------------------+--------+



DROP TRIGGER BACKUP_PRODUT;

DELIMITER $


CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR); 

END $

DELIMITER ;


INSERT INTO PRODUTO VALUES(NULL,'LIVRO C#',100.00);

SELECT * FROM PRODUTO;
+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 100.00 |
|         5 | LIVRO C#         | 100.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO BI         |  80.00 |--AQUI QUANDO FAZ O BACKUP O ID AINDA NÃO EXISTE
|     4 |         0 | LIVRO ORACLE     |  70.00 |
|     5 |         0 | LIVRO SQL SERVER | 100.00 |
|     6 |         2 | LIVRO BI         |  80.00 |
|     7 |         5 | LIVRO C#         | 100.00 |--AQUI A TRIGGER TRAS O ID DO PRODUTO DPS DE CRIADO
+-------+-----------+------------------+--------+


ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

SELECT * FROM BACKUP.BKP_PRODUTO;
+-------+-----------+------------------+--------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  | EVENTO |
+-------+-----------+------------------+--------+--------+
|     1 |      1000 | TESTE            |   0.00 | NULL   |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 | NULL   |
|     3 |         0 | LIVRO BI         |  80.00 | NULL   |
|     4 |         0 | LIVRO ORACLE     |  70.00 | NULL   |
|     5 |         0 | LIVRO SQL SERVER | 100.00 | NULL   |
|     6 |         2 | LIVRO BI         |  80.00 | NULL   |
|     7 |         5 | LIVRO C#         | 100.00 | NULL   |
+-------+-----------+------------------+--------+--------+

DROP TRIGGER BACKUP_PRODUT_DELETE;

DELIMITER $

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,'D'); 

END $

DELIMITER ;

DELETE FROM PRODUTO
WHERE IDPRODUTO = 4;


SELECT * FROM PRODUTO;

+-----------+-----------------+--------+
| IDPRODUTO | NOME            | VALOR  |
+-----------+-----------------+--------+
|         1 | LIVRO MODELAGEM |  50.00 |
|         3 | LIVRO ORACLE    |  70.00 |
|         5 | LIVRO C#        | 100.00 |
+-----------+-----------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  | EVENTO |
+-------+-----------+------------------+--------+--------+
|     1 |      1000 | TESTE            |   0.00 | NULL   |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 | NULL   |
|     3 |         0 | LIVRO BI         |  80.00 | NULL   |
|     4 |         0 | LIVRO ORACLE     |  70.00 | NULL   |
|     5 |         0 | LIVRO SQL SERVER | 100.00 | NULL   |
|     6 |         2 | LIVRO BI         |  80.00 | NULL   |
|     7 |         5 | LIVRO C#         | 100.00 | NULL   |
|     8 |         4 | LIVRO SQL SERVER | 100.00 | D      |
+-------+-----------+------------------+--------+--------+


DROP TRIGGER BACKUP_PRODUT;

DELIMITER $


CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR,'I'); 

END $

DELIMITER ;


INSERT INTO PRODUTO VALUES(NULL,'LIVRO JAVA',120.00);


SELECT * FROM PRODUTO;
+-----------+-----------------+--------+
| IDPRODUTO | NOME            | VALOR  |
+-----------+-----------------+--------+
|         1 | LIVRO MODELAGEM |  50.00 |
|         3 | LIVRO ORACLE    |  70.00 |
|         5 | LIVRO C#        | 100.00 |
|         6 | LIVRO JAVA      | 120.00 |
+-----------+-----------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  | EVENTO |
+-------+-----------+------------------+--------+--------+
|     1 |      1000 | TESTE            |   0.00 | NULL   |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 | NULL   |
|     3 |         0 | LIVRO BI         |  80.00 | NULL   |
|     4 |         0 | LIVRO ORACLE     |  70.00 | NULL   |
|     5 |         0 | LIVRO SQL SERVER | 100.00 | NULL   |
|     6 |         2 | LIVRO BI         |  80.00 | NULL   |
|     7 |         5 | LIVRO C#         | 100.00 | NULL   |
|     8 |         4 | LIVRO SQL SERVER | 100.00 | D      |
|     9 |         6 | LIVRO JAVA       | 120.00 | I      |
+-------+-----------+------------------+--------+--------+

/* AULA 42 - TRIGGER DE AUDITORIA */

DROP DATABASE LOJA;
DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);




INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',100.00);


CREATE DATABASE BACKUP;

USE BACKUP;



CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR_ORIGINAL FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);

USE LOJA;

SELECT * FROM PRODUTO;

DELIMITER $

CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN

	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,NEW.VALOR,NOW(),CURRENT_USER(),'U');

END $

DELIMITER ;

UPDATE PRODUTO SET VALOR = 110.00
WHERE IDPRODUTO = 4;

SELECT * FROM PRODUTO;

+-----------+------------------+--------+
| IDPRODUTO | NOME             | VALOR  |
+-----------+------------------+--------+
|         1 | LIVRO MODELAGEM  |  50.00 |
|         2 | LIVRO BI         |  80.00 |
|         3 | LIVRO ORACLE     |  70.00 |
|         4 | LIVRO SQL SERVER | 110.00 |
+-----------+------------------+--------+

SELECT * FROM BACKUP.BKP_PRODUTO;

+----------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
| IDBACKUP | IDPRODUTO | NOME             | VALOR_ORIGINAL | VALOR_ALTERADO | DATA                | USUARIO        | EVENTO |
+----------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+
|        1 |         4 | LIVRO SQL SERVER |         100.00 |         110.00 | 2021-05-24 15:35:01 | root@localhost | U      |
|        2 |         4 | LIVRO SQL SERVER |         110.00 |         110.00 | 2021-05-24 15:35:20 | root@localhost | U      |
+----------+-----------+------------------+----------------+----------------+---------------------+----------------+--------+




/* CURSORES */

CREATE DATABASE CURSORES;

USE CURSORES;


CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT
);


INSERT INTO VENDEDORES VALUES(NULL,'MAFRA',21312,12313,12314);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA',23425,456456,23423);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO',0890,23523,324234);
INSERT INTO VENDEDORES VALUES(NULL,'LILIAN',9089678,89089,8908);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO',34537,876,45678);
INSERT INTO VENDEDORES VALUES(NULL,'GLORIA',54363,673541,345643);


SELECT * FROM VENDEDORES;

SELECT NOME, (JAN+FEV+MAR) AS TOTAL FROM VENDEDORES;
SELECT NOME, (JAN+FEV+MAR) AS TOTAL, (JAN+FEV+MAR)/3 AS MEDIA FROM VENDEDORES;


CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);
 

DELIMITER $

CREATE PROCEDURE INSEREDADOS()
BEGIN

	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);

	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;

	OPEN REG;

	REPEAT

		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN

			SET VTOTAL = VAR1 + VAR2 + VAR3;
			SET VMEDIA = VTOTAL / 3;
			INSERT INTO VEND_TOTAL VALUES(VNOME, VAR1, VAR2,VAR3,VTOTAL,VMEDIA);
		END IF;
	UNTIL FIM END REPEAT;
	CLOSE REG;
END$

DELIMITER ;


SELECT * FROM VENDEDORES;

SELECT * FROM VEND_TOTAL;

CALL INSEREDADOS();


/* 
    PRIMEIRA FORMA NORMAL
    ATOMICIDADE - UM CAMPO NÃO PODE SER DIVISIVEL
    UM CAMPO NÃO PODE SER VETORIZADO
    TER UM PK PRIMAY KEY
*/


/*
    SEGUNDA E TERCEIRA FORMAS NORMAIS 
*/

CREATE DATABASE CONSULTORIO;

USE CONSULTORIO;

CREATE TABLE PACIENTE(
    IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(50),
    NASCIMENTO DATE
);

CREATE TABLE MEDICO(
    IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    SEXO CHAR(1),
    ESPECIALIDADE VARCHAR(30),
    FUNCIONARIO ENUM('S','N')
);
CREATE TABLE HOSPITAL(
    IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    BAIRRO VARCHAR(30),
    CIDADE VARCHAR(30),
    ESTADO CHAR(2)
);
CREATE TABLE CONSULTA(
    IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PACIENTE INT,
    ID_MEDICO INT,
    ID_HOSPITAL INT,
    DATA DATETIME,
    DIAGNOSTICO VARCHAR(50)
);
CREATE TABLE INTERNACAO(
    IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
    ENTRADA DATETIME,
    QUARTO INT,
    SAIDA DATETIME,
    OBSERVACOES VARCHAR(50),
    ID_CONSULTA INT UNIQUE
);
/* CRIANDO CONSTRAINTS */

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY(ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY(ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY(ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_INTERNACAO_CONSULTA
FOREIGN KEY(ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);





















































































