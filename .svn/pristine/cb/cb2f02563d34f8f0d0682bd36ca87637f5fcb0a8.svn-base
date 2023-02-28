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

SELECT X.CODIGO, X.TIPO, X.IDMASTER_SINC, CAST(X.INICIO AS DATE) AS DATAINICIO, CAST(X.FINAL AS DATE) DATAFIM,
       CAST(X.INICIO AS TIME) AS HORAINICIO, CAST(X.FINAL AS TIME) HORAFIM,
       cast(X.CAPTION3||' - '||X.CAPTION2 as varchar(1000)) AS DESCRICAO,
       Cast(X.NOMEPERFIS as varchar(1000)) AS NOMEPERFIL
  FROM(

select X.CODIGO, X.IDMASTER_SINC, x.sincronizada, X.IDPEDIDOAGENDA, X.INICIO, X.FINAL, X.TIPO, X.NOMEACAO, X.OPCOES, X.NOMESITUACAO,
       X.DATA, X.CODIGOCONTRATO, X.NOMEPERFIS,

       X.CAPTION ||

       case
         when TIPOAGENDA is not null then ' - ' || TIPOAGENDA
         else ''
       end CAPTION2,

       list(trim(X.PERFIL || ', ' ||

       case
         when E.NOME is null then ''
         else 'Evento: ' || E.NOME || ', '
       end ||

       case
         when X.DATAEVENTO is null then ''
         else 'Data Evento: ' || extract(day from X.DATAEVENTO) || '/' || extract(month from X.DATAEVENTO) || '/' || extract(year from X.DATAEVENTO) || ', ' ||

       case X.HORARIOEVENTO
         when 1 then 'Manhã'
         when 2 then 'Almoço'
         when 3 then 'Tarde'
         when 4 then 'Noite'
       end
       end ),' ** ') as CAPTION3

from

(

select X.CODIGO, X.IDMASTER_SINC, x.sincronizada, X.IDPEDIDOAGENDA, X.DATA, X.INICIO, X.FINAL, X.TIPO, X.NOMEACAO, X.CAPTION, X.OPCOES,
       X.NOMESITUACAO, X.DATAEVENTO, X.HORARIOEVENTO, X.CODIGOEVENTO, X.TIPOAGENDA, X.CODIGOCONTRATO, list(X.PERFIL, ' - ') as PERFIL,
       list(X.NOMEPERFIL,', ') as NOMEPERFIS

from (

select distinct A.CODIGO, A.IDMASTER_SINC, a.sincronizada, A.IDPEDIDOAGENDA, A.DATA, coalesce(P.NOME, '') AS NOMEPERFIL,
                (A.DATA + A.HORA) as INICIO,
                (A.DATAFIM + A.HORAFIM) as FINAL, coalesce(M.TIPO, 0) as TIPO, A.DESCRICAO as NOMEACAO,

                'Perfil: ' || coalesce(P.NOME, '') || '' ||

                coalesce(', Tam.:' ||(select first 1 cast(MAN.VALOR as numeric(15))
                                    from TABPESSOMANEQUIM MAN
                                    where MAN.CODIGOPERFIL = P.CODIGO), '') ||

                case
                  when AC.CODIGOTIPOCONVIDADO is null then ''
                  else ', Tipo: ' || CO.NOME || ''
                end ||', '||

                coalesce((select list(distinct PREFERENCIA, ', ') PREFERENCIA
                          from (

                          select CODIGOPESSOA,
                                 list(trim(TIPODESCRICAO) || ': ' || trim(DESCRICAO), ' - ') as PREFERENCIA
                          from (select PP.CODIGOPESSOA, P.TIPO, PP.CODIGOPEDIDO, PP.ID,
                                       case P.TIPO
                                         when 1 then 'Peça'
                                         when 2 then 'Acessórios'
                                         when 3 then 'Marca'
                                         when 4 then 'Estilo'
                                         when 5 then 'Cor'
                                         when 6 then 'Exigência'
                                       end as TIPODESCRICAO,
                                       list(P.DESCRICAO, ',') as DESCRICAO
                                from TABPREFERENCIASPESSOAS PP
                                inner join TABPREFERENCIAS P on PP.CODIGOPREFERENCIA = P.CODIGO
                                group by 1, 2, 3, 4, 5

                                order by P.TIPO

                          ) Y

                          where Y.CODIGOPESSOA = P.CODIGO
                            AND Y.CODIGOPEDIDO = A.IDPEDIDOAGENDA
                            AND Y.ID = AC.ID

                          group by 1

                          )

                ), '')

                ||COALESCE(', Obs: '||ac.observacoes,'')

                as PERFIL,

                case
                  when coalesce(A.IDPEDIDOAGENDA, 0) = 0 then ''
                  else ' Pedido Ag.: ' || A.IDPEDIDOAGENDA
                end || ' Situação: ' || upper(trim(
                case
                  when coalesce(A.SITUACAO, 1) = 1 then 'Em Aberto'
                  when coalesce(A.SITUACAO, 1) = 2 then 'Cancelada' || ' - Motivo: ' || coalesce(A.MOTIVOCANCELAMENTO, '')
                  when coalesce(A.SITUACAO, 1) = 3 then 'Confirmada'
                  when coalesce(A.SITUACAO, 1) = 4 then 'Finalizada'
                  else ''
                end)) as CAPTION,

                2 as OPCOES,
                trim(
                case
                  when A.SITUACAO = 1 then 'Em Aberto'
                  when A.SITUACAO = 2 then 'Cancelada'
                  when A.SITUACAO = 3 then 'Confirmada'
                  when A.SITUACAO = 4 then 'Finalizada'
                  else ''
                end) as NOMESITUACAO,

                COALESCE((select distinct CASE WHEN A.IDEVENTO IS NULL THEN PA.DATAEVENTO ELSE E.DATAEVENTO END
                   from TABPEDIDOAGENDAMENTOEVENTOS E
                  where E.CODIGO = PA.CODIGO and
                        E.ID = AC.IDEVENTO), PA.DATAEVENTO) as DATAEVENTO,

               COALESCE((select distinct CASE WHEN A.IDEVENTO IS NULL THEN PA.HORARIOEVENTO ELSE E.HORARIOEVENTO END
                  from TABPEDIDOAGENDAMENTOEVENTOS E
                 where E.CODIGO = PA.CODIGO and
                       E.ID = AC.IDEVENTO),PA.HORARIOEVENTO) as HORARIOEVENTO,

               COALESCE((select distinct CASE WHEN A.IDEVENTO IS NULL THEN PA.CODIGOEVENTO ELSE E.CODIGOEVENTO END
                  from TABPEDIDOAGENDAMENTOEVENTOS E
                 where E.CODIGO = PA.CODIGO and
                       E.ID = AC.IDEVENTO),PA.CODIGOEVENTO) as CODIGOEVENTO,

                case M.TIPO
                  when 0 then 'Agenda'
                  when 1 then 'Agenda'
                  when 2 then 'Ag.Prova'
                  when 3 then 'Ag.Retirada'
                  when 4 then 'Ag.Devolução'
                end TIPOAGENDA,

                coalesce(C.CODIGO, M.CODIGO) as CODIGOCONTRATO

from TABAGENDA A
left join TABPEDIDOAGENDAMENTO PA on (A.IDPEDIDOAGENDA = PA.CODIGO)
left join TABACOMPANHANTESPEDIDOAGENDA AC on (PA.CODIGO = AC.CODIGOPEDIDO)
left join TABPERFIL P on coalesce(AC.CODIGOPERFIL, A.IDPERFIL) = P.CODIGO
left join TABTIPOCONVIDADO CO on (AC.CODIGOTIPOCONVIDADO = CO.CODIGO)
left join TABMOVIMENTACAOCONTRATO M on (A.CODIGO = M.CODIGOREGISTRO and M.TIPO in (1, 2, 3, 4))
left join TABCONTRATO C on (C.CODIGOAGENDA = A.CODIGO)

where 1 = 1

--where

order by A.DATA, AC.TIPOAGENDAMENTO

) X

group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17

) X

left join TABEVENTO E on (E.CODIGO = X.CODIGOEVENTO)  

group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14


) X

where Coalesce(X.TIPO,0) IN (0,1,2)
and Coalesce((Select min(s.sincronizado) from tabcontolesincagenda s where s.idagenda = x.codigo),x.sincronizada,0) = 0


ORDER BY x.inicio