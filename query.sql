with t1 as (SELECT * FROM public.constr NATURAL INNER JOIN public.constrinfo NATURAL INNER JOIN public.entity),
ta as (SELECT
    t1.idconstraint, t1.constrtype, t1.identity, t2.CountOf
    FROM t1
        INNER JOIN (SELECT
                        identity, constrtype, COUNT(*) AS CountOf
                        FROM t1
                        GROUP BY identity, constrtype
                        HAVING COUNT(*)>1
                    ) t2 ON t1.identity = t2.identity AND t1.constrtype = t2.constrtype)
					
SELECT
    constrtype, identity, COUNT(*) AS CountOf
    FROM ta
    GROUP BY constrtype, identity
    HAVING COUNT(*)>1
	
	