/*CAMPOS NECESSÁRIOS
CODIGO,
IDMASTER_SINC,
DATAINCIO,
DATAFIM,
HORAINICIO,
HORAFIM,
DESCRICAO,
NOMEPERFIL
*/

SELECT
   A.CODIGO,
   A.IDMASTER_SINC,
   P.NOME AS NOMEPERFIL,
   A.DATA AS DATAINICIO,
   A.HORA AS HORAINICIO,
   A.DATAFIM,
   A.HORAFIM,
   Cast('Perfil: '||Coalesce(P.codigo,'')||' - '||Coalesce(P.NOME,'')||ascii_char(13)||

   COALESCE('Telefone: '||P.TELCELULAR||ascii_char(13),'')||

   COALESCE('Produtos: '||((select first 1 list(distinct p.descricao)
                             from tabcontrato c
                            inner join tabmovimentacaocontrato m on (c.codigo = m.codigo)
                            inner join tabcontratodetalhe d on (c.codigo = d.codigo)
                            inner join tabprodutos p on (d.codigoproduto = p.codigo)
                            where m.tipo in (1,2,3,4)
                              and m.codigoregistro = a.codigo ))||ascii_char(13),'')||


  COALESCE('Data Evento: ' ||(select distinct extract(day from P.DATAEVENTO) || '/' || extract(month from P.DATAEVENTO) || '/' || extract(year from P.DATAEVENTO)
                                       from TABPEDIDOAGENDAMENTO P
                                      WHERE A.idpedidoagenda = P.codigo)||ascii_char(13),'')||


  COALESCE('Tipo Convidado: ' ||(SELECT first 1 LIST(DISTINCT CO.NOME)
                                   FROM TABACOMPANHANTESPEDIDOAGENDA AC
                                   left join TABTIPOCONVIDADO CO on (AC.CODIGOTIPOCONVIDADO = CO.CODIGO)
                                   WHERE A.idpedidoagenda = AC.codigopedido
                                   AND AC.codigoperfil = A.idperfil
                                   and AC.TIPOAGENDAMENTO = 1 )||ascii_char(13),'')||

   Case when Coalesce(a.idpedidoagenda,0) = 0 then '' else 'Pedido de Agenda: '||A.idpedidoagenda||ascii_char(13) end||

   'Situação: '||
   Upper(Trim(Case when Coalesce(A.situacao,1) = 1 then 'Em Aberto'
             when Coalesce(A.situacao,1) = 2 then 'Cancelada'||' - Motivo: '||Coalesce(a.motivocancelamento,'')
             when Coalesce(A.situacao,1) = 3 then 'Confirmada'
             when Coalesce(A.situacao,1) = 4 then 'Finalizada' else '' End))||ascii_char(13)||ascii_char(13)||

   COALESCE('DESCRIÇÃO: '||ascii_char(13)||
   A.descricao||ascii_char(13)||ascii_char(13),'')||


   COALESCE('PREFERENCIAS: '||ascii_char(13)||
   (select first 1 list(DISTINCT xpto, ascii_char(13))
   from (Select Trim(Case when px.tipo = 1 then 'Peça'
                     when px.tipo = 2 then 'Acessórios'
                     when px.tipo = 3 then 'Marca'
                     when px.tipo = 4 then 'Estilo'
                     when px.tipo = 5 then 'Cor'
                     when px.tipo = 6 then 'Exigencia'
                else 'OUTRAS' END||ascii_char(13)||List(DISTINCT Coalesce(px.descricao,''),ascii_char(13))) as xpto
      from tabpreferenciaspessoas pp
      left join tabpreferencias px on pp.codigopreferencia = px.codigo
      where pp.codigopessoa = a.idperfil
        and pp.codigopedido = a.idpedidoagenda
        group by px.tipo ))||ascii_char(13)
   , '') ||


   COALESCE('MANEQUIM: '||
   (SELECT LIST(distinct Coalesce(PM.valor,'0'),ascii_char(13))
      FROM tabpessomanequim PM
      LEFT JOIN tabtipomanequim TM ON PM.codigotipomanequim = TM.codigo
      LEFT JOIN TABTIPOMANEQUIMVALORPADRAO TMP ON TMP.codigotipomanequim = PM.codigotipomanequim and pm.valor between tmp.valorinicial and coalesce(tmp.valorfinal,tmp.valorinicial)
     WHERE PM.codigoperfil = a.idperfil)
    , '') as varchar(1000)) as DESCRICAO


FROM TABAGENDA A
LEFT JOIN tabperfil P on a.idperfil = p.codigo
left join tabprodutos pr on a.codigoproduto = pr.codigo

where Coalesce(A.sincronizada,0) = 0
  --and a.idpedidoagenda > 0
--where



ORDER BY A.DATA