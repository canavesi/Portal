--
-- Create Schema Script 
--   Database Version   : 11.2.0.1.0 
--   TOAD Version       : 9.0.1.8 
--   DB Connect String  : TESTE 
--   Schema             : PORTAL 
--   Script Created by  : ARTBOX 
--   Script Created at  : 21/06/2021 15:03:13 
--   Physical Location  :  
--   Notes              :  
--

-- Object Counts: 
--   Indexes: 7         Columns: 8          
--   Object Privileges: 9 
--   Packages: 2        Lines of Code: 166 
--   Package Bodies: 2  Lines of Code: 557 
--   Sequences: 9 
--   Tables: 7          Columns: 44         Constraints: 15     
--   Triggers: 1 
--   Types: 1 
--   Views: 1           


CREATE OR REPLACE Type obt_end As Object
(
--<Attribute> <Datatype>,
   seq_logradouro Number,
   tpo            Varchar2(3),
   logradouro     Varchar2(60),
   cep            Varchar2(10),
   bairro         Varchar2(40),
   cidade         Varchar2(40),
   uf             Varchar2(2),
   v_endereco     Varchar2(120),

   Constructor Function obt_end(p_seq_logradouro Number, p_num number, p_comp varchar2) Return Self As Result,

   Member Function mostra_endereco Return Varchar2,

-- Member functions and procedures
--Member Procedure < procedurename > (< parameter > < datatype >)
   Member Function endereco(p_seq_logradouro Number) Return Varchar2
)
/

SHOW ERRORS;


CREATE SEQUENCE SEQ_PT_APLICACAO_GRUPO
  START WITH 5
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SEQ_PT_APLICACAO_ITEM
  START WITH 10
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SEQ_PT_DOMINIOS
  START WITH 34
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SEQ_PT_SISTEMA
  START WITH 5
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SQ_BAIRRO
  START WITH 197
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SQ_CIDADE
  START WITH 12
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SQ_LOGRADOURO
  START WITH 3457
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SQ_TIPO_LOGRADOURO
  START WITH 5
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE SEQUENCE SQ_UNIDADE_FEDERATIVA
  START WITH 3
  MAXVALUE 9999999999999999999999999999
  MINVALUE 0
  NOCYCLE
  NOCACHE
  NOORDER;


CREATE TABLE PT_DOMINIOS
(
  PDO_SQ         NUMBER                         NOT NULL,
  PDO_NOME       VARCHAR2(40 BYTE)              NOT NULL,
  PDO_DOMINIO    VARCHAR2(40 BYTE)              NOT NULL,
  PDO_VALOR      VARCHAR2(40 BYTE)              NOT NULL,
  PDO_DESCRICAO  VARCHAR2(40 BYTE)              NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE CIDADE
(
  SEQ_CIDADE  NUMBER                            NOT NULL,
  NOM_CIDADE  VARCHAR2(40 BYTE)                 NOT NULL,
  DSC_SIGLA   VARCHAR2(3 BYTE)                  NOT NULL,
  DMN_UF      VARCHAR2(2 BYTE)                  NOT NULL,
  STA_BLOQ    VARCHAR2(1 BYTE)                  DEFAULT 'N'                   NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE PT_APLICACAO_ITEM
(
  PPI_SQ           NUMBER(4)                    NOT NULL,
  PSA_SQ           NUMBER(3)                    NOT NULL,
  PAG_SQ           NUMBER(3)                    NOT NULL,
  PPI_NM_ITEM      VARCHAR2(40 BYTE),
  PPI_NM_PROGRAMA  VARCHAR2(40 BYTE),
  PPI_FL_BLOQ      VARCHAR2(1 BYTE)             DEFAULT 'N'                   NOT NULL,
  PPI_FL_VISIVEL   VARCHAR2(1 BYTE)             DEFAULT 'N'                   NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE LOGRADOURO
(
  SEQ_LOGRADOURO      NUMBER                    NOT NULL,
  SEQ_CIDADE          NUMBER                    NOT NULL,
  SEQ_BAIRRO          NUMBER                    NOT NULL,
  DMN_TPO_LOGRADOURO  VARCHAR2(3 BYTE)          NOT NULL,
  NOM_LOGRADOURO      VARCHAR2(60 BYTE)         NOT NULL,
  COD_CEP             VARCHAR2(10 BYTE)         NOT NULL,
  STA_BLOQ            VARCHAR2(1 BYTE)          DEFAULT 'N'                   NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE PT_SISTEMA
(
  PSA_SQ               NUMBER(3)                NOT NULL,
  PSA_DESCRICAO        VARCHAR2(40 BYTE)        NOT NULL,
  PSA_PATH_FMB         VARCHAR2(120 BYTE)       NOT NULL,
  PSA_PATH_ICON        VARCHAR2(120 BYTE)       NOT NULL,
  PSA_PATH_EXCEL       VARCHAR2(120 BYTE),
  PSA_PATH_IMAGENS     VARCHAR2(120 BYTE),
  PSA_ARQUIVO_IMAGENS  VARCHAR2(120 BYTE),
  PSA_LOGIN            VARCHAR2(40 BYTE),
  PSA_SENHA            VARCHAR2(40 BYTE),
  PSA_DATABASE         VARCHAR2(40 BYTE),
  PSA_SIGLA            VARCHAR2(3 BYTE)         NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE PT_APLICACAO_GRUPO
(
  PAG_SQ          NUMBER(3)                     NOT NULL,
  PSA_SQ          NUMBER(3)                     NOT NULL,
  PAG_NM_GRUPO    VARCHAR2(40 BYTE)             NOT NULL,
  PAG_FL_BLOQ     VARCHAR2(1 BYTE)              DEFAULT 'N'                   NOT NULL,
  PAG_FL_VISIVEL  VARCHAR2(1 BYTE)              DEFAULT 'S'                   NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE BAIRRO
(
  SEQ_BAIRRO  NUMBER                            NOT NULL,
  SEQ_CIDADE  NUMBER                            NOT NULL,
  NOM_BAIRRO  VARCHAR2(40 BYTE)                 NOT NULL,
  STA_BLOQ    VARCHAR2(1 BYTE)                  DEFAULT 'N'                   NOT NULL
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX PDO_UK01 ON PT_DOMINIOS
(PDO_DOMINIO, PDO_VALOR)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PDO_PK ON PT_DOMINIOS
(PDO_SQ)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PSA_PK ON PT_SISTEMA
(PSA_SQ)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PAO_PK ON PT_APLICACAO_GRUPO
(PAG_SQ)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX LOGRADOURO_PK ON LOGRADOURO
(SEQ_LOGRADOURO)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX BAIRRO_PK ON BAIRRO
(SEQ_BAIRRO)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX CIDADE_PK ON CIDADE
(SEQ_CIDADE)
LOGGING
NOPARALLEL;


CREATE OR REPLACE PACKAGE pkg_send_email IS

  ----------------------- Customizable Section -----------------------

  -- Customize the SMTP host, port and your domain name below.
  smtp_host   VARCHAR2(256) := 'relay.transitbrasil.com.br';
--  smtp_host   VARCHAR2(256) := '140.1.2.55';
  smtp_port   PLS_INTEGER   := 25;
  smtp_domain VARCHAR2(256) := 'transitbrasil.com.br';

  -- Customize the signature that will appear in the email's MIME header.
  -- Useful for versioning.
  MAILER_ID   CONSTANT VARCHAR2(256) := 'Mailer by Oracle UTL_SMTP';

  --------------------- End Customizable Section ---------------------

  -- A unique string that demarcates boundaries of parts in a multi-part email
  -- The string should not appear inside the body of any part of the email.
  -- Customize this if needed or generate this randomly dynamically.
  BOUNDARY        CONSTANT VARCHAR2(256) := '-----7D81B75CCC90D2974F7A1CBD';

  FIRST_BOUNDARY  CONSTANT VARCHAR2(256) := '--' || BOUNDARY || utl_tcp.CRLF;
  LAST_BOUNDARY   CONSTANT VARCHAR2(256) := '--' || BOUNDARY || '--' ||
                                              utl_tcp.CRLF;

  -- A MIME type that denotes multi-part email (MIME) messages.
  MULTIPART_MIME_TYPE CONSTANT VARCHAR2(256) := 'multipart/mixed; boundary="'||
                                                  BOUNDARY || '"';
  MAX_BASE64_LINE_WIDTH CONSTANT PLS_INTEGER   := 76 / 4 * 3;

  -- A simple email API for sending email in plain text in a single call.
  -- The format of an email address is one of these:
  --   someone@some-domain
  --   "Someone at some domain" <someone@some-domain>
  --   Someone at some domain <someone@some-domain>
  -- The recipients is a list of email addresses  separated by
  -- either a "," or a ";"
  PROCEDURE mail(sender     IN VARCHAR2,
		 recipients IN VARCHAR2,
		 subject    IN VARCHAR2,
		 message    IN VARCHAR2);

  -- Extended email API to send email in HTML or plain text with no size limit.
  -- First, begin the email by begin_mail(). Then, call write_text() repeatedly
  -- to send email in ASCII piece-by-piece. Or, call write_mb_text() to send
  -- email in non-ASCII or multi-byte character set. End the email with
  -- end_mail().
  FUNCTION begin_mail(sender     IN VARCHAR2,
		      recipients IN VARCHAR2,
		      subject    IN VARCHAR2,
		      mime_type  IN VARCHAR2    DEFAULT 'text/plain',
		      priority   IN PLS_INTEGER DEFAULT NULL)
		      RETURN utl_smtp.connection;

  -- Write email body in ASCII
  PROCEDURE write_text(conn    IN OUT NOCOPY utl_smtp.connection,
		       message IN VARCHAR2);

  -- Write email body in non-ASCII (including multi-byte). The email body
  -- will be sent in the database character set.
  PROCEDURE write_mb_text(conn    IN OUT NOCOPY utl_smtp.connection,
			  message IN            VARCHAR2);

  -- Write email body in binary
  PROCEDURE write_raw(conn    IN OUT NOCOPY utl_smtp.connection,
		      message IN RAW);

  -- APIs to send email with attachments. Attachments are sent by sending
  -- emails in "multipart/mixed" MIME format. Specify that MIME format when
  -- beginning an email with begin_mail().

  -- Send a single text attachment.
  PROCEDURE attach_text(conn         IN OUT NOCOPY utl_smtp.connection,
			data         IN VARCHAR2,
			mime_type    IN VARCHAR2 DEFAULT 'text/plain',
			inline       IN BOOLEAN  DEFAULT TRUE,
			filename     IN VARCHAR2 DEFAULT NULL,
		        last         IN BOOLEAN  DEFAULT FALSE);

  -- Send a binary attachment. The attachment will be encoded in Base-64
  -- encoding format.
  PROCEDURE attach_base64(conn         IN OUT NOCOPY utl_smtp.connection,
			  data         IN RAW,
			  mime_type    IN VARCHAR2 DEFAULT 'application/octet',
			  inline       IN BOOLEAN  DEFAULT TRUE,
			  filename     IN VARCHAR2 DEFAULT NULL,
			  last         IN BOOLEAN  DEFAULT FALSE);

  -- Send an attachment with no size limit. First, begin the attachment
  -- with begin_attachment(). Then, call write_text repeatedly to send
  -- the attachment piece-by-piece. If the attachment is text-based but
  -- in non-ASCII or multi-byte character set, use write_mb_text() instead.
  -- To send binary attachment, the binary content should first be
  -- encoded in Base-64 encoding format using the demo package for 8i,
  -- or the native one in 9i. End the attachment with end_attachment.
  PROCEDURE begin_attachment(conn         IN OUT NOCOPY utl_smtp.connection,
			     mime_type    IN VARCHAR2 DEFAULT 'text/plain',
			     inline       IN BOOLEAN  DEFAULT TRUE,
			     filename     IN VARCHAR2 DEFAULT NULL,
			     transfer_enc IN VARCHAR2 DEFAULT NULL);

  -- End the attachment.
  PROCEDURE end_attachment(conn IN OUT NOCOPY utl_smtp.connection,
			   last IN BOOLEAN DEFAULT FALSE);

  -- End the email.
  PROCEDURE end_mail(conn IN OUT NOCOPY utl_smtp.connection);

  -- Extended email API to send multiple emails in a session for better
  -- performance. First, begin an email session with begin_session.
  -- Then, begin each email with a session by calling begin_mail_in_session
  -- instead of begin_mail. End the email with end_mail_in_session instead
  -- of end_mail. End the email session by end_session.
  FUNCTION begin_session RETURN utl_smtp.connection;

  -- Begin an email in a session.
  PROCEDURE begin_mail_in_session(conn       IN OUT NOCOPY utl_smtp.connection,
				  sender     IN VARCHAR2,
				  recipients IN VARCHAR2,
				  subject    IN VARCHAR2,
				  mime_type  IN VARCHAR2  DEFAULT 'text/plain',
				  priority   IN PLS_INTEGER DEFAULT NULL);

  -- End an email in a session.
  PROCEDURE end_mail_in_session(conn IN OUT NOCOPY utl_smtp.connection);

  -- End an email session.
  PROCEDURE end_session(conn IN OUT NOCOPY utl_smtp.connection);

   function envia_email ( premetente    in     varchar2,
                          pdestinatario in     varchar2,
                          passunto      in     varchar2 default ' ',
                          pmensagem     in     varchar2 default ' ',
                          pattach       in     varchar2 default ' ',
                          perro         in out varchar2 ) return boolean;

   function envia_html ( premetente    in     varchar2,
                         pdestinatario in     varchar2,
                         passunto      in     varchar2 default ' ',
                         pmensagem     in     varchar2 default ' ',
                         perro         in out varchar2 ) return boolean;

   function tipo_arq ( pattach in varchar2,
                       pmime      out varchar2,
                       perro      out varchar2 ) return boolean;

end pkg_send_email;
/

SHOW ERRORS;


CREATE OR REPLACE Package pkg_consistir_dados Is

   -- Author  : CARLOS
   -- Created : 17/01/2021 13:07:23
   -- Purpose : Validar entrada de dados em tabelas.

   Function fnc_tira_ascento(p_reg In Varchar2) Return Varchar2;

   Function fnc_tira_caracter_esp(p_reg In Varchar2) Return Varchar2;

   Function fnc_retorna_alfanumerico(p_reg In Varchar2) Return Varchar2;

   Function fnc_retorna_numero(p_reg In Varchar2) Return Varchar2;

   Function fnc_retorna_num_inteiro(p_reg In Varchar2) Return Varchar2;

   Function fnc_retorna_alfabeto(p_reg In Varchar2) Return Varchar2;

End pkg_consistir_dados;
/

SHOW ERRORS;


CREATE OR REPLACE PACKAGE BODY pkg_send_email IS

-- -------------------------------------------------------------------------------------------------------------------------------------
function envia_email ( premetente    in     varchar2,
                       pdestinatario in     varchar2,
                       passunto      in     varchar2 default ' ',
                       pmensagem     in     varchar2 default ' ',
                       pattach       in     varchar2 default ' ',
                       perro         in out varchar2 ) return boolean is
   ret_ boolean;
begin

   if ( pattach is null ) then
      ret_ := envia_html ( premetente,
                           pdestinatario,
                           passunto,
                           pmensagem,
                           perro );
      if ( ret_ = false ) then
         return false;
      end if;
   else
/*      ret_ := envia_at ( premetente,
                         pdestinatario,
                         passunto,
                         pmensagem,
                         pattach,
                         perro );*/
      if ( ret_ = false ) then
         return false;
      end if;

   end if;

   /*begin
      insert into sis_email_hist ( data, usuario, remetente, destinatario,
                                   assunto, mensagem, arquivo )
      values ( sysdate, user, premetente, pdestinatario,
               passunto, pmensagem, pattach );
   exception
      when others then
         perro := 'Problemas inserindo no log de envio. ' || sqlerrm;
         return false;
   end;*/

   return true;

exception
   when others then
      perro := 'Problemas enviando e-mail. ' || sqlerrm;
      return false;
end envia_email;

-- -------------------------------------------------------------------------------------------------------------------------------------
function envia_html ( premetente    in     varchar2,
                      pdestinatario in     varchar2,
                      passunto      in     varchar2 default ' ',
                      pmensagem     in     varchar2 default ' ',
                      perro         in out varchar2 ) return boolean is
   conn utl_smtp.connection;
begin
   conn := begin_mail( sender     => premetente,
                                      recipients => pdestinatario,
                                      subject    => passunto,
                                      mime_type  => 'text/html');

   pkg_send_email.write_text( conn    => conn,
                              message => pmensagem );
  
   end_mail( conn => conn );

   return true;

exception
   when others then
      perro := 'Problemas enviando e-mail html. ' || sqlerrm;
      return false;
end envia_html;

-- -------------------------------------------------------------------------------------------------------------------------------------
function tipo_arq ( pattach in     varchar2,
                    pmime      out varchar2,
                    perro      out varchar2 ) return boolean is
   tipo_ varchar2(10);
begin

   for i in reverse 1 .. length(pattach) loop 
      if ( substr(pattach,i,1) = '.' ) then
         tipo_ := upper(substr(pattach,i+1));
         exit;
      end if;
   end loop;

   if ( tipo_ = 'TXT' ) then
      pmime := 'image/gif';
   elsif ( tipo_ = 'GIF' ) then
      pmime := 'image/gif';
   elsif ( tipo_ = 'CSV' ) then
      pmime := 'image/gif';
   elsif ( tipo_ = 'PDF' ) then
      pmime := 'application/pdf';
   else
      perro := 'Tipo de arquivo não identificado.';
      return false;
   end if;

   return true;

exception
   when others then
      perro := 'Problemas verificando tipo de arquivo. ' || sqlerrm;
      return false;
end tipo_arq;
-- -------------------------------------------------------------------------------------------------------------------------------------

  -- Return the next email address in the list of email addresses, separated
  -- by either a "," or a ";".  The format of mailbox may be in one of these:
  --   someone@some-domain
  --   "Someone at some domain" <someone@some-domain>
  --   Someone at some domain <someone@some-domain>
  FUNCTION get_address(addr_list IN OUT VARCHAR2) RETURN VARCHAR2 IS

    addr VARCHAR2(256);
    i    pls_integer;

    FUNCTION lookup_unquoted_char(str  IN VARCHAR2,
				  chrs IN VARCHAR2) RETURN pls_integer AS
      c            VARCHAR2(5);
      i            pls_integer;
      len          pls_integer;
      inside_quote BOOLEAN;
    BEGIN
       inside_quote := false;
       i := 1;
       len := length(str);
       WHILE (i <= len) LOOP

	 c := substr(str, i, 1);

	 IF (inside_quote) THEN
	   IF (c = '"') THEN
	     inside_quote := false;
	   ELSIF (c = '\') THEN
	     i := i + 1; -- Skip the quote character
	   END IF;
	   GOTO next_char;
	 END IF;

	 IF (c = '"') THEN
	   inside_quote := true;
	   GOTO next_char;
	 END IF;

	 IF (instr(chrs, c) >= 1) THEN
	    RETURN i;
	 END IF;

	 <<next_char>>
	 i := i + 1;

       END LOOP;

       RETURN 0;

    END;

  BEGIN

    addr_list := ltrim(addr_list);
    i := lookup_unquoted_char(addr_list, ',;');
    IF (i >= 1) THEN
      addr      := substr(addr_list, 1, i - 1);
      addr_list := substr(addr_list, i + 1);
    ELSE
      addr := addr_list;
      addr_list := '';
    END IF;

    i := lookup_unquoted_char(addr, '<');
    IF (i >= 1) THEN
      addr := substr(addr, i + 1);
      i := instr(addr, '>');
      IF (i >= 1) THEN
	addr := substr(addr, 1, i - 1);
      END IF;
    END IF;

    RETURN addr;
  END;

  -- Write a MIME header
  PROCEDURE write_mime_header(conn  IN OUT NOCOPY utl_smtp.connection,
			      name  IN VARCHAR2,
			      value IN VARCHAR2) IS
  BEGIN
    utl_smtp.write_data(conn, name || ': ' || value || utl_tcp.CRLF);
  END;

  -- Mark a message-part boundary.  Set <last> to TRUE for the last boundary.
  PROCEDURE write_boundary(conn  IN OUT NOCOPY utl_smtp.connection,
			   last  IN            BOOLEAN DEFAULT FALSE) AS
  BEGIN
    IF (last) THEN
      utl_smtp.write_data(conn, LAST_BOUNDARY);
    ELSE
      utl_smtp.write_data(conn, FIRST_BOUNDARY);
    END IF;
  END;

  ------------------------------------------------------------------------
  PROCEDURE mail(sender     IN VARCHAR2,
		 recipients IN VARCHAR2,
		 subject    IN VARCHAR2,
		 message    IN VARCHAR2) IS
    conn utl_smtp.connection;
  BEGIN
    conn := begin_mail(sender, recipients, subject);
    write_text(conn, message);
    end_mail(conn);
  END;

  ------------------------------------------------------------------------
  FUNCTION begin_mail(sender     IN VARCHAR2,
		      recipients IN VARCHAR2,
		      subject    IN VARCHAR2,
		      mime_type  IN VARCHAR2    DEFAULT 'text/plain',
		      priority   IN PLS_INTEGER DEFAULT NULL)
		      RETURN utl_smtp.connection IS
    conn utl_smtp.connection;
  BEGIN
    conn := begin_session;
    begin_mail_in_session(conn, sender, recipients, subject, mime_type,
      priority);
    RETURN conn;
  END;

  ------------------------------------------------------------------------
  PROCEDURE write_text(conn    IN OUT NOCOPY utl_smtp.connection,
		       message IN VARCHAR2) IS
  BEGIN
    utl_smtp.write_data(conn, message);
  END;

  ------------------------------------------------------------------------
  PROCEDURE write_mb_text(conn    IN OUT NOCOPY utl_smtp.connection,
			  message IN            VARCHAR2) IS
  BEGIN
    utl_smtp.write_raw_data(conn, utl_raw.cast_to_raw(message));
  END;

  ------------------------------------------------------------------------
  PROCEDURE write_raw(conn    IN OUT NOCOPY utl_smtp.connection,
		      message IN RAW) IS
  BEGIN
    utl_smtp.write_raw_data(conn, message);
  END;

  ------------------------------------------------------------------------
  PROCEDURE attach_text(conn         IN OUT NOCOPY utl_smtp.connection,
			data         IN VARCHAR2,
			mime_type    IN VARCHAR2 DEFAULT 'text/plain',
			inline       IN BOOLEAN  DEFAULT TRUE,
			filename     IN VARCHAR2 DEFAULT NULL,
		        last         IN BOOLEAN  DEFAULT FALSE) IS
  BEGIN
    begin_attachment(conn, mime_type, inline, filename);
    write_text(conn, data);
    end_attachment(conn, last);
  END;

  ------------------------------------------------------------------------
  PROCEDURE attach_base64(conn         IN OUT NOCOPY utl_smtp.connection,
			  data         IN RAW,
			  mime_type    IN VARCHAR2 DEFAULT 'application/octet',
			  inline       IN BOOLEAN  DEFAULT TRUE,
			  filename     IN VARCHAR2 DEFAULT NULL,
			  last         IN BOOLEAN  DEFAULT FALSE) IS
    i   PLS_INTEGER;
    len PLS_INTEGER;
  BEGIN

    begin_attachment(conn, mime_type, inline, filename, 'base64');

    -- Split the Base64-encoded attachment into multiple lines
    i   := 1;
    len := utl_raw.length(data);
    WHILE (i < len) LOOP
       IF (i + MAX_BASE64_LINE_WIDTH < len) THEN
	 utl_smtp.write_raw_data(conn,
	    utl_encode.base64_encode(utl_raw.substr(data, i,
	    MAX_BASE64_LINE_WIDTH)));
       ELSE
	 utl_smtp.write_raw_data(conn,
	   utl_encode.base64_encode(utl_raw.substr(data, i)));
       END IF;
       utl_smtp.write_data(conn, utl_tcp.CRLF);
       i := i + MAX_BASE64_LINE_WIDTH;
    END LOOP;

    end_attachment(conn, last);

  END;

  ------------------------------------------------------------------------
  PROCEDURE begin_attachment(conn         IN OUT NOCOPY utl_smtp.connection,
			     mime_type    IN VARCHAR2 DEFAULT 'text/plain',
			     inline       IN BOOLEAN  DEFAULT TRUE,
			     filename     IN VARCHAR2 DEFAULT NULL,
			     transfer_enc IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    write_boundary(conn);
    write_mime_header(conn, 'Content-Type', mime_type);

    IF (filename IS NOT NULL) THEN
       IF (inline) THEN
	  write_mime_header(conn, 'Content-Disposition',
	    'inline; filename="'||filename||'"');
       ELSE
	  write_mime_header(conn, 'Content-Disposition',
	    'attachment; filename="'||filename||'"');
       END IF;
    END IF;

    IF (transfer_enc IS NOT NULL) THEN
      write_mime_header(conn, 'Content-Transfer-Encoding', transfer_enc);
    END IF;

    utl_smtp.write_data(conn, utl_tcp.CRLF);
  END;

  ------------------------------------------------------------------------
  PROCEDURE end_attachment(conn IN OUT NOCOPY utl_smtp.connection,
			   last IN BOOLEAN DEFAULT FALSE) IS
  BEGIN
    utl_smtp.write_data(conn, utl_tcp.CRLF);
    IF (last) THEN
      write_boundary(conn, last);
    END IF;
  END;

  ------------------------------------------------------------------------
  PROCEDURE end_mail(conn IN OUT NOCOPY utl_smtp.connection) IS
  BEGIN
    end_mail_in_session(conn);
    end_session(conn);
  END;

  ------------------------------------------------------------------------
  FUNCTION begin_session RETURN utl_smtp.connection IS
    conn utl_smtp.connection;
  BEGIN
    -- open SMTP connection
    conn := utl_smtp.open_connection(smtp_host, smtp_port);
    utl_smtp.helo(conn, smtp_domain);
    RETURN conn;
  END;

  ------------------------------------------------------------------------
  PROCEDURE begin_mail_in_session(conn       IN OUT NOCOPY utl_smtp.connection,
				  sender     IN VARCHAR2,
				  recipients IN VARCHAR2,
				  subject    IN VARCHAR2,
				  mime_type  IN VARCHAR2  DEFAULT 'text/plain',
				  priority   IN PLS_INTEGER DEFAULT NULL) IS
    my_recipients VARCHAR2(32767) := recipients;
    my_sender     VARCHAR2(32767) := sender;
  BEGIN

    -- Specify sender's address (our server allows bogus address
    -- as long as it is a full email address (xxx@yyy.com).
    utl_smtp.mail(conn, get_address(my_sender));

    -- Specify recipient(s) of the email.
    WHILE (my_recipients IS NOT NULL) LOOP
      utl_smtp.rcpt(conn, get_address(my_recipients));
    END LOOP;

    -- Start body of email
    utl_smtp.open_data(conn);

    -- Set "From" MIME header
    write_mime_header(conn, 'From', sender);

    -- Set "To" MIME header
    write_mime_header(conn, 'To', recipients);

    -- Set "Subject" MIME header
    write_mime_header(conn, 'Subject', subject);

    -- Set "Content-Type" MIME header
    write_mime_header(conn, 'Content-Type', mime_type);

    -- Set "X-Mailer" MIME header
    write_mime_header(conn, 'X-Mailer', MAILER_ID);

    -- Set priority:
    --   High      Normal       Low
    --   1     2     3     4     5
    IF (priority IS NOT NULL) THEN
      write_mime_header(conn, 'X-Priority', priority);
    END IF;

    -- Send an empty line to denotes end of MIME headers and
    -- beginning of message body.
    utl_smtp.write_data(conn, utl_tcp.CRLF);

    IF (mime_type LIKE 'multipart/mixed%') THEN
      write_text(conn, 'This is a multi-part message in MIME format.' ||
	utl_tcp.crlf);
    END IF;

  END;

  ------------------------------------------------------------------------
  PROCEDURE end_mail_in_session(conn IN OUT NOCOPY utl_smtp.connection) IS
  BEGIN
    utl_smtp.close_data(conn);
  END;

  ------------------------------------------------------------------------
  PROCEDURE end_session(conn IN OUT NOCOPY utl_smtp.connection) IS
  BEGIN
    utl_smtp.quit(conn);
  END;


end pkg_send_email;
/

SHOW ERRORS;


CREATE OR REPLACE Package Body pkg_consistir_dados Is

   -- Author  : CARLOS
   -- Created : 17/01/2021 13:07:23
   -- Purpose : Validar entrada de dados em tabelas.

   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   -- Retorna sem assentos
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   Function fnc_tira_ascento(p_reg In Varchar2) Return Varchar2 Is
   
	  v_reg Varchar2(5000) := Null;
   
   Begin
   
	  v_reg := translate(p_reg,
						 'ÁÃÂÀÄÉÊËÈÍÎÌÏÓÕÔÖÒÚÛÜÙÇáãâàäéêëèíîìïóõôöòúûüùç*"%/;><&=+-~^$#@!¿()[]{}?°ºª§´`^~',
						 'AAAAAEEEEIIIIOOOOOUUUUCaaaaaeeeeiiiiooooouuuuc');
   
	  Return v_reg;
   
   Exception
   
	  When Others Then
		 raise_application_error(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || Sqlerrm);
   End fnc_tira_ascento;

   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   -- Retorna variavel sem caracteres especias
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   Function fnc_tira_caracter_esp(p_reg In Varchar2) Return Varchar2 Is
   
	  v_reg Varchar2(5000) := Null;
   
   Begin
   
	  v_reg := translate(p_reg, 'A*"%/;><&=+-~^$#@!¿()[]{}?°ºª§´`^~', 'A');
   
	  Return v_reg;
   
   Exception
   
	  When Others Then
		 raise_application_error(-20024, 'Erro. FUNCTION FNC_TIRA_CARACTER_ESP' || Sqlerrm);
   End fnc_tira_caracter_esp;
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   -- Retorna variavel Alfanumerico sem caracteres especiais
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   Function fnc_retorna_alfanumerico(p_reg In Varchar2) Return Varchar2 Is
   
	  v_reg Varchar2(5000) := Null;
   
   Begin
   
	  v_reg := translate(p_reg,
						 'ABCDEFGHIJKLMNOPQRSTUVXYWZabcdefghijklmnopqrstuvxywz0123456789ÁÃÂÀÄÉÊËÈÍÎÌÏÓÕÔÖÒÚÛÜÙÇáãâàäéêëèíîìïóõôöòúûüùç*"%/;><&=+-~^$#@!¿()[]{}?°ºª§´`^~',
						 'ABCDEFGHIJKLMNOPQRSTUVXYWZabcdefghijklmnopqrstuvxywz0123456789AAAAAEEEEIIIIOOOOOUUUUCaaaaaeeeeiiiiooooouuuuc');
   
	  Return v_reg;
   
   Exception
   
	  When Others Then
		 raise_application_error(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || Sqlerrm);
   End fnc_retorna_alfanumerico;

   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   -- Retorna variavel numérica Com decimais '.'
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   Function fnc_retorna_numero(p_reg In Varchar2) Return Varchar2 Is
   
	  v_reg Varchar2(5000) := Null;
   
   Begin
   
	  v_reg := translate(upper(p_reg),
						 '0123456789ABCDEFGHIJKLMNOPQRSTUVXYWZ ÁÃÂÀÄÉÊËÈÍÎÌÏÓÕÔÖÒÚÛÜÙÇ*"%/;:><&=+-~^$#@!¿()[]{}?°ºª§´`^~',
						 '0123456789');
   
	  Return v_reg;
   
   Exception
   
	  When Others Then
		 raise_application_error(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || Sqlerrm);
   End fnc_retorna_numero;

   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   -- Retorna variavel numérica Inteira
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   Function fnc_retorna_num_inteiro(p_reg In Varchar2) Return Varchar2 Is
   
	  v_reg Varchar2(5000) := Null;
   
   Begin
   
	  v_reg := translate(upper(p_reg),
						 '0123456789ABCDEFGHIJKLMNOPQRSTUVXYWZ ÁÃÂÀÄÉÊËÈÍÎÌÏÓÕÔÖÒÚÛÜÙÇ*"%/;:><&=+-~^$#@!¿()[]{}?°ºª§´`^~.,',
						 '0123456789');
   
	  Return v_reg;
   
   Exception
   
	  When Others Then
		 raise_application_error(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || Sqlerrm);
   End fnc_retorna_num_inteiro;

   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   -- Retorna Alfabeto sem numeros ou caracteres especiais
   --#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#--#
   Function fnc_retorna_alfabeto(p_reg In Varchar2) Return Varchar2 Is
   
	  v_reg Varchar2(5000) := Null;
   
   Begin
   
	  v_reg := translate(p_reg,
						 'ABCDEFGHIJKLMNOPQRSTUVXYWZabcdefghijklmnopqrstuvxywzÁÃÂÀÄÉÊËÈÍÎÌÏÓÕÔÖÒÚÛÜÙÇáãâàäéêëèíîìïóõôöòúûüùç0123456789:*"%/;><&=+-~^$#@!¿()[]{}?°ºª§´`^~',
						 'ABCDEFGHIJKLMNOPQRSTUVXYWZabcdefghijklmnopqrstuvxywzAAAAAEEEEIIIIOOOOOUUUUCaaaaaeeeeiiiiooooouuuuc');
   
	  Return v_reg;
   
   Exception
   
	  When Others Then
		 raise_application_error(-20024, 'Erro. FUNCTION FNC_TIRA_ASCENTO' || Sqlerrm);
   End fnc_retorna_alfabeto;

End pkg_consistir_dados;
/

SHOW ERRORS;


CREATE OR REPLACE VIEW VW_ENDERECOS
AS 
Select 	lg.seq_logradouro, lg.dmn_tpo_logradouro,
		lg.nom_logradouro, lg.cod_cep, br.nom_bairro, cd.nom_cidade, cd.dmn_uf
From   portal.logradouro lg, portal.bairro br, portal.cidade cd
Where  lg.seq_bairro = br.seq_bairro And
  	   lg.seq_cidade = cd.seq_cidade;


CREATE OR REPLACE TRIGGER TRG_PT_DOMINIOS_biu
   Before Insert or update On PT_DOMINIOS
   For Each Row
Begin

  --+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
  -- Sequência
  --+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
  If :New.pdo_sq Is Null Then
   Select seq_pt_dominios.Nextval Into :New.pdo_sq From dual;
  End If;

  :New.pdo_dominio   := upper(:New.pdo_dominio);
  :New.pdo_valor     := upper(:New.pdo_valor);
  :New.pdo_descricao := upper(:New.pdo_descricao);

Exception
  When Others Then
   raise_application_error(-20000, 'Erro ao inserir sequence. TRG_PT_DOMINIOS_biu' || Sqlerrm);

End;
/
SHOW ERRORS;



ALTER TABLE PT_DOMINIOS ADD (
  CONSTRAINT PDO_PK
 PRIMARY KEY
 (PDO_SQ));

ALTER TABLE CIDADE ADD (
  CONSTRAINT AVCON_1606244228_STA_B_000
 CHECK (STA_BLOQ IN ('N', 'S')),
  CONSTRAINT CIDADE_PK
 PRIMARY KEY
 (SEQ_CIDADE));

ALTER TABLE LOGRADOURO ADD (
  CONSTRAINT AVCON_1606244228_STA_B_002
 CHECK (STA_BLOQ IN ('N', 'S')),
  CONSTRAINT LOGRADOURO_PK
 PRIMARY KEY
 (SEQ_LOGRADOURO));

ALTER TABLE PT_SISTEMA ADD (
  CONSTRAINT PSA_PK
 PRIMARY KEY
 (PSA_SQ));

ALTER TABLE PT_APLICACAO_GRUPO ADD (
  CONSTRAINT PAO_PK
 PRIMARY KEY
 (PAG_SQ));

ALTER TABLE BAIRRO ADD (
  CONSTRAINT AVCON_1606244228_STA_B_001
 CHECK (STA_BLOQ IN ('N', 'S')),
  CONSTRAINT BAIRRO_PK
 PRIMARY KEY
 (SEQ_BAIRRO));

ALTER TABLE PT_APLICACAO_ITEM ADD (
  CONSTRAINT PAM_PAO_FK 
 FOREIGN KEY (PAG_SQ) 
 REFERENCES PT_APLICACAO_GRUPO (PAG_SQ),
  CONSTRAINT PAM_PSA_FK 
 FOREIGN KEY (PSA_SQ) 
 REFERENCES PT_SISTEMA (PSA_SQ));

ALTER TABLE LOGRADOURO ADD (
  CONSTRAINT LOO_BAO_FK 
 FOREIGN KEY (SEQ_BAIRRO) 
 REFERENCES BAIRRO (SEQ_BAIRRO),
  CONSTRAINT LOO_CIE_FK 
 FOREIGN KEY (SEQ_CIDADE) 
 REFERENCES CIDADE (SEQ_CIDADE));

ALTER TABLE PT_APLICACAO_GRUPO ADD (
  CONSTRAINT PAO_PSA_FK 
 FOREIGN KEY (PSA_SQ) 
 REFERENCES PT_SISTEMA (PSA_SQ));

ALTER TABLE BAIRRO ADD (
  CONSTRAINT BAO_CIE_FK 
 FOREIGN KEY (SEQ_CIDADE) 
 REFERENCES CIDADE (SEQ_CIDADE));

GRANT SELECT ON  BAIRRO TO ARTBOX;

GRANT REFERENCES, SELECT ON  CIDADE TO ARTBOX;

GRANT SELECT ON  LOGRADOURO TO ARTBOX;

GRANT EXECUTE, DEBUG ON  OBT_END TO ARTBOX;

GRANT EXECUTE, DEBUG ON  PKG_CONSISTIR_DADOS TO ARTBOX;

GRANT EXECUTE, DEBUG ON  PKG_CONSISTIR_DADOS TO FINANCEIRO;

GRANT SELECT ON  BAIRRO TO ROLE_SISTEMA;

GRANT SELECT ON  CIDADE TO ROLE_SISTEMA;

GRANT SELECT ON  LOGRADOURO TO ROLE_SISTEMA;

