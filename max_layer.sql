with constraint_on_unique_layers as (select idconstraint, count(distinct layer) as unique_count  from constrinfo join entity e on constrinfo.identity = e.identity
group by idconstraint having count(constrinfo.identity) = 2 and count(distinct layer) = 2)

select count(e2.identity), layer
from constraint_on_unique_layers
    join constrinfo using(idconstraint)
    join entity e2 on constrinfo.identity = e2.identity
group by layer order by count(e2.identity) desc limit 1;
