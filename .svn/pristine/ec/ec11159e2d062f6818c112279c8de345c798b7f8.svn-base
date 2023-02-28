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
   Cast('Perfil: '||Coalesce(P.codigo,'')||' - '||Coalesce(P.NOME,'')||' == '||
   'Produto: '||Coalesce(Pr.codigo,'')||' - '||Coalesce(pr.descricao,'')||' == '||
   Case when Coalesce(a.idpedidoagenda,0) = 0 then '' else 'Pedido de Agenda: '||A.idpedidoagenda||' == ' end||
   'Situação: '||
   Upper(Trim(Case when Coalesce(A.situacao,1) = 1 then 'Em Aberto'
             when Coalesce(A.situacao,1) = 2 then 'Cancelada'||' - Motivo: '||Coalesce(a.motivocancelamento,'')
             when Coalesce(A.situacao,1) = 3 then 'Confirmada'
             when Coalesce(A.situacao,1) = 4 then 'Finalizada' else '' End))||' == '||

   'DESCRIÇÃO: '||
   A.descricao||' == '||

   'PREFERENCIAS: '||
   COALESCE(
   (Select Trim('('||Case when px.tipo = 1 then 'Peça'
                     when px.tipo = 1 then 'Acessórios'
                     when px.tipo = 1 then 'Marca'
                     when px.tipo = 1 then 'Estilo'
                     when px.tipo = 1 then 'Cor'
                     when px.tipo = 1 then 'Exigencia'
                else 'OUTRAS' END||': '|| List(Coalesce(px.descricao,''),','))
      from tabpreferenciaspessoas pp
      left join tabpreferencias px on pp.codigopreferencia = px.codigo
      where pp.codigopessoa = a.idperfil
        and pp.codigopedido = a.idpedidoagenda
        group by px.tipo )
   , '') ||' == '||

   'MANEQUIM: '||
   COALESCE(
   (SELECT LIST(Coalesce(TM.descricao,'')||': '||Coalesce(PM.valor,'0')||' - '||Coalesce(TMP.descricao,'0'),', ')
      FROM tabpessomanequim PM
      LEFT JOIN tabtipomanequim TM ON PM.codigotipomanequim = TM.codigo
      LEFT JOIN TABTIPOMANEQUIMVALORPADRAO TMP ON TMP.codigotipomanequim = PM.codigotipomanequim and pm.valor between tmp.valorinicial and coalesce(tmp.valorfinal,tmp.valorinicial)
     WHERE PM.codigoperfil = a.idperfil)
    , '') as varchar(1000))

    as DESCRICAO
FROM TABAGENDA A
LEFT JOIN tabperfil P on a.idperfil = p.codigo
left join tabprodutos pr on a.codigoproduto = pr.codigo

where Coalesce(A.sincronizada,0) = 0
  --and a.idpedidoagenda > 0
--where



ORDER BY A.DATA

