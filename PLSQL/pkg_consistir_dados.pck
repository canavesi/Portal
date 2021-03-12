CREATE OR REPLACE PACKAGE PKG_CONSISTIR_DADOS IS

	 -- Author  : CARLOS
	 -- Created : 17/01/2021 13:07:23
	 -- Purpose : Validar entrada de dados em tabelas.

	 FUNCTION FNC_TIRA_ASCENTO(P_REG IN VARCHAR2) RETURN VARCHAR2;

	 FUNCTION FNC_VALIDA_CHAR(P_REG IN VARCHAR2) RETURN VARCHAR2;

	 FUNCTION FNC_VALIDA_NUMERO(P_REG IN VARCHAR2) RETURN VARCHAR2;

END PKG_CONSISTIR_DADOS;
/
CREATE OR REPLACE PACKAGE BODY PKG_CONSISTIR_DADOS IS

	 -- Author  : CARLOS
	 -- Created : 17/01/2021 13:07:23
	 -- Purpose : Validar entrada de dados em tabelas.
	 --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#

-- Retorna variavel sem assentos
--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
	 FUNCTION FNC_TIRA_ASCENTO(P_REG IN VARCHAR2) RETURN VARCHAR2 IS
	 
			V_REG VARCHAR2(5000) := NULL;
	 
	 BEGIN
	 
			V_REG := TRANSLATE(P_REG,
												 'ÁÃÂÀÄÉÊËÈÍÎÌÏÓÕÔÖÒÚÛÜÙÇבדגאהיךכטםמלןףץפצעתûüשח*"%/;><&=+-~^$#@!¿[]{}?°÷×§´`^~¨',
												 'AAAAAEEEEIIIIOOOOOUUUUCaaaaaeeeeiiiiooooouuuuc');
	 
			RETURN V_REG;
	 
	 EXCEPTION
	 
			WHEN OTHERS THEN
				 RAISE_APPLICATION_ERROR(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || SQLERRM);
	 END FNC_TIRA_ASCENTO;

--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
	 -- Retorna variavel Alfanumerico sem caracteres especiais
--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
	 FUNCTION FNC_VALIDA_CHAR(P_REG IN VARCHAR2) RETURN VARCHAR2 IS
	 
			V_REG VARCHAR2(5000) := NULL;
	 
	 BEGIN
	 
			V_REG := TRANSLATE(P_REG,
												 'A*"%/;><&=+-~^$#@!¿[]{}?°÷×§´`^~¨',
												 'A');
	 
			RETURN V_REG;
	 
	 EXCEPTION
	 
			WHEN OTHERS THEN
				 RAISE_APPLICATION_ERROR(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || SQLERRM);
	 END FNC_VALIDA_CHAR;

--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
	 -- Retorna variavel numיrica
--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
	 FUNCTION FNC_VALIDA_NUMERO(P_REG IN VARCHAR2) RETURN VARCHAR2 IS
	 
			V_REG VARCHAR2(5000) := NULL;
	 
	 BEGIN
	    -- CONVERTE ABC123 PARA ABC, DEPOIS TROCA ABC POR ' ' E LTRIM. 
			V_REG := LTRIM(translate(P_REG, translate(P_REG, '1234567890', ' ') , ' '));
	 
			RETURN V_REG;
	 
	 EXCEPTION
	 
			WHEN OTHERS THEN
				 RAISE_APPLICATION_ERROR(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || SQLERRM);
	 END FNC_VALIDA_NUMERO;

END PKG_CONSISTIR_DADOS;
/
