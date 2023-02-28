program SysLocar;

uses
  Forms,
  Windows,
  Dialogs,
  SysUtils,
  untRelLog in '..\untRelLog.pas' {frmRelLog},
  form_acesso_sistema in '..\form_acesso_sistema.pas' {acesso_sistema},
  form_aguarde in '..\form_aguarde.pas' {frmAguarde},
  form_alterar_senha in '..\form_alterar_senha.pas' {alterar_senha},
  form_cadastro_pedido_agenda in '..\form_cadastro_pedido_agenda.pas' {cadastro_pedido_agenda},
  form_aniversariantes in '..\form_aniversariantes.pas' {AniversariantesDia},
  form_principal in '..\form_principal.pas' {principal},
  form_valor_universal in '..\form_valor_universal.pas' {Valor_Universal},
  form_valor_universal_BD in '..\form_valor_universal_BD.pas' {Valor_Universal_BD},
  untDados in '..\untDados.pas' {Dados: TDataModule},
  untFiltroLog in '..\untFiltroLog.pas' {frmFiltroLog},
  untPesquisa in '..\untPesquisa.pas' {frmPesquisa},
  form_cadastro_usuarios in '..\form_cadastro_usuarios.pas' {cadastro_usuarios},
  Ext in '..\Ext.pas',
  form_escolha in '..\form_escolha.pas' {EscolhaUniversal},
  funcao in '..\funcao.pas',
  form_inserir_manequim in '..\form_inserir_manequim.pas' {inserir_manequim},
  form_configuracoes in '..\form_configuracoes.pas' {frmConfiguracoes},
  untBackup in '..\untBackup.pas' {frmBackup},
  untAbertura in 'untAbertura.pas' {frmAbertura},
  untaniversariante in '..\untaniversariante.pas' {frmAniversariante},
  form_cadastro_municipios in '..\form_cadastro_municipios.pas' {cadastro_municipios},
  form_cadastro_Tipo_Manequim in '..\form_cadastro_Tipo_Manequim.pas' {cadastro_Tipo_Manequim},
  form_cadastro_produto in '..\form_cadastro_produto.pas' {cadastro_produto},
  form_cadastro_situacao_produto in '..\form_cadastro_situacao_produto.pas' {cadastro_situacao_produto},
  form_cadastro_tipo_documento in '..\form_cadastro_tipo_documento.pas' {cadastro_tipo_documento},
  form_cadastro_Tipo_Convidado in '..\form_cadastro_Tipo_Convidado.pas' {cadastro_tipo_convidado},
  form_cadastro_Servicos in '..\form_cadastro_Servicos.pas' {cadastro_Tipo_Servicos},
  form_buscar_nome in '..\form_buscar_nome.pas' {buscar_nome},
  form_inserir_preferencias in '..\form_inserir_preferencias.pas' {inserir_preferencias},
  form_cadastro_prospect in '..\form_cadastro_prospect.pas' {cadastro_prospect},
  form_carregar_Foto in '..\form_carregar_Foto.pas' {carregar_Foto},
  form_cadastro_localizacao in '..\form_cadastro_localizacao.pas' {cadastro_localizacao},
  form_cadastro_preferencia in '..\form_cadastro_preferencia.pas' {cadastro_preferencia},
  form_cadastro_Avaliacao in '..\form_cadastro_Avaliacao.pas' {cadastro_Avaliacao},
  form_inserir_avaliacao in '..\form_inserir_avaliacao.pas' {inserir_avaliacao},
  form_cadastro_banco in '..\form_cadastro_banco.pas' {cadastro_Banco},
  form_cadastro_Evento in '..\form_cadastro_Evento.pas' {cadastro_evento},
  form_cadastro_questionario in '..\form_cadastro_questionario.pas' {cadastro_questionario},
  untAcompanhaOrdemServico in '..\untAcompanhaOrdemServico.pas' {frmAcompanhaOrdemServico},
  form_visualizar_historico in '..\form_visualizar_historico.pas' {visualizar_historico},
  untConsultaProdutos in '..\untConsultaProdutos.pas' {frmConsultaProdutos},
  untARARAS in '..\untARARAS.pas' {frmARARAS},
  untARARA in '..\untARARA.pas' {frmARARA},
  untAgenda in '..\untAgenda.pas' {frmAgenda},
  untCadastroAgenda in '..\untCadastroAgenda.pas' {frmCadastroAgenda},
  form_cadastro_perfil in '..\form_cadastro_perfil.pas' {cadastro_perfil},
  untOrdemServico in '..\untOrdemServico.pas' {frmOrdemServico},
  untAgendarPedido in '..\untAgendarPedido.pas' {frmAgendarPedido},
  form_cadastro_forma_pagamento in '..\form_cadastro_forma_pagamento.pas' {cadastro_forma_pagamento},
  untAcompanhaOrcamento in '..\untAcompanhaOrcamento.pas' {frmAcompanhaOrcamento},
  untArarasAgenda in '..\untArarasAgenda.pas' {frmArarasAgenda},
  untDtmRelatorios in '..\untDtmRelatorios.pas' {frmDtmRelatorios},
  untContrato in '..\untContrato.pas' {frmContrato},
  untOrcamento in '..\untOrcamento.pas' {frmOrcamento},
  form_cadastro_Tipo_Perfil in '..\form_cadastro_Tipo_Perfil.pas' {cadastro_Tipo_Perfil},
  untAcompanhaPedidoAgenda in '..\untAcompanhaPedidoAgenda.pas' {frmAcompanhaPedidoAgenda},
  untFinanceiro in '..\untFinanceiro.pas' {frmFinanceiro},
  untContratoTerceiros in '..\untContratoTerceiros.pas' {frmContratoTerceiros},
  untAtendimento in '..\untAtendimento.pas' {frmAtendimento},
  untAcompanhaContrato in '..\untAcompanhaContrato.pas' {frmAcompanhaContrato},
  untAcompanhaFinanceiro in '..\untAcompanhaFinanceiro.pas' {frmAcompanhaFinanceiro},
  untAcompanhaHistoricoProduto in '..\untAcompanhaHistoricoProduto.pas' {frmAcompanhaHistoricoProduto},
  untCadastroPlanoContas in '..\untCadastroPlanoContas.pas' {frmCadastroPlanoContas},
  untCadastroCentroCusto in '..\untCadastroCentroCusto.pas' {frmCadastroCentroCusto},
  untApuracaoMensal in '..\untApuracaoMensal.pas' {frmApuracaoMensal},
  untCadastroExplicacao in '..\untCadastroExplicacao.pas' {frmCadastroExplicacao},
  untPrevisaoOrcamento in '..\untPrevisaoOrcamento.pas' {frmPrevisaoOrcamento},
  untAcompanhaPrevistoRealizado in '..\untAcompanhaPrevistoRealizado.pas' {frmAcompanhaPrevistoRealizado},
  untConfigPesquisa in '..\untConfigPesquisa.pas' {frmConfigPesquisa},
  untClasseLembrete in '..\untClasseLembrete.pas',
  untNotificacoes in '..\untNotificacoes.pas' {frmNotificacoes},
  untAgendasDia in '..\untAgendasDia.pas' {frmAgendasDia},
  untConfigSincronismo in '..\untConfigSincronismo.pas' {frmConfigSincronismo},
  untAcompanhaPerformance in '..\untAcompanhaPerformance.pas' {frmAcompanhaPerformance},
  untMalaDireta in '..\untMalaDireta.pas' {frmMalaDireta},
  form_cadastro_Tipo_Foto in '..\form_cadastro_Tipo_Foto.pas' {cadastro_Tipo_Foto},
  untControleVersao in '..\untControleVersao.pas',
  versao in '..\versao.pas',
  untInfVersao in '..\untInfVersao.pas' {frmInfVersao};

{$R *.res}

//Var HprevHist : HWND;

begin
  Application.Initialize;

  ShortDateFormat := 'DD/MM/YYYY';

  Application.MainFormOnTaskbar := True;
  Application.Title := 'SysLocar';
  frmAbertura := TfrmAbertura.Create(Application);
  frmAbertura.show;
  Application.ProcessMessages;
  frmAbertura.AbrirSistema;
  frmAbertura.Close;
  Application.Run;
end.
