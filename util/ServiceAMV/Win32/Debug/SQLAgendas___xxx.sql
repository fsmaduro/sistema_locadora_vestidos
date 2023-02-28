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
   Cast(null as varchar(1000))

    as DESCRICAO
FROM TABAGENDA A
LEFT JOIN tabperfil P on a.idperfil = p.codigo
left join tabprodutos pr on a.codigoproduto = pr.codigo

where Coalesce(A.sincronizada,0) = 0
  --and a.idpedidoagenda > 0
--where



ORDER BY A.DATA

