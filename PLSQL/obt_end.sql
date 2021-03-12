--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
--+ Criação do Object Type (L04_01.SQL)
--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
CREATE OR REPLACE TYPE OBT_END AS OBJECT
(
       --<Attribute> <Datatype>,
       SEQ_LOGRADOURO  NUMBER,
       TPO              VARCHAR2(3),
       LOGRADOURO       VARCHAR2(60),
       CEP              VARCHAR2(10),
       BAIRRO           VARCHAR2(40),
       CIDADE           VARCHAR2(40),
       UF               VARCHAR2(2),

       -- Member functions and procedures
       --Member Procedure < procedurename > (< parameter > < datatype >)
       MEMBER FUNCTION ETIQUETA RETURN VARCHAR2);

/
DESC OBT_END




