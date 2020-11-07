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
