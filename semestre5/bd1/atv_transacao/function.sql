create or replace function transferencia(
    numeric,
    integer,
    integer
)
returns integer
language plpgsql
as $$
    declare
        valor alias for $1;
        id_pagador alias for $2;
        id_recebedor alias for $3;
        saldoDisp numeric;
    begin
        select saldo from conta into saldoDisp where id = id_pagador;
        if saldoDisp < valor then
            return 1;
        end if;

        if valor <= 0 then
            return 2;
        end if;

        select id into id_pagador from conta where id = id_pagador;
        if id_pagador is null then
            return 3;
        end if;

        select id into id_recebedor from conta where id = id_recebedor;
        if id_recebedor is null then
            return 4;
        end if;

        if id_pagador = id_recebedor then
            return 5;
        end if;

        return 0;
    end;
$$;

create or replace procedure transf
(
    t_valor numeric,
    t_id_pagador smallint,
    t_id_recebedor smallint
)
language plpgsql as
$$
    declare
        errorCode integer;
    begin
        errorCode := transferencia(t_valor, t_id_pagador, t_id_recebedor);
        if errorCode = 0 then
            insert into transacoes(valor, id_conta, id_conta1) values (t_valor, t_id_pagador, t_id_recebedor);
            update conta set saldo = saldo - t_valor where id = t_id_pagador;
            update conta set saldo = saldo + t_valor where id = t_id_recebedor;
            perform pg_sleep(2);
            raise notice 'Transferencia realizada com sucesso!';
            commit;
        elsif errorCode = 1 then
            raise notice 'ERRO: Saldo insuficiente!';
            rollback;
        elsif errorCode = 2 then
            raise notice 'ERRO: Valor invalido!';
            rollback;
        elsif errorCode = 3 then
            raise notice 'ERRO: Pagador nao encontrado!';
            rollback;
        elsif errorCode = 4 then
            raise notice 'ERRO: Recebedor nao encontrado!';
            rollback;
        elsif errorCode = 5 then
            raise notice 'ERRO: Nao pode transferir pra mesma conta!';
            rollback;
        end if;
    end;
$$;