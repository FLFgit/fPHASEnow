select * 
from (
    select plant, doy, pp_start_tsum, pp_start_doy, tsum_calc, Pp_calc
    from (
        select KLT as plant, to_number(to_char(sysdate, 'DDD')) as doy, T_SUM as pp_start_tsum, DOY as pp_start_doy,  
            (select 
                round(sum(tmit_dl),0) as TSUM
            from (
                select a.yrow, a.doy, a.tmit, b.daylength, b.daylength/24, (a.Tmit-5.5 * b.daylength/24) as Tmit_dl, a.abc
                from
                    (select to_number(substr(grid_id,5,4)) as yrow, datum, to_number(to_char(datum, 'DDD')) as doy, sysdate as doy_sys, 
                    case when tmit < 0 then 0 else tmit/10 end as tmit,	-- Schwellwerte aus Mail vom 19.09.
                    sysdate - to_date(doy||(to_char(to_date(doy,'ddd'),'YYYY')-1),'dddyyyy') as abc
                    from v_klima
                    where grid_id = 37875803
                    and datum BETWEEN (select to_date(doy||(to_char(to_date(doy,'ddd'),'YYYY')-1),'dddyyyy') from tsum_pphase where klt = 202 and phase = 10) AND sysdate) a	-- Startdatum aus Tabelle Phaenophase to_date (doy, year -1 bei Winterklt) AND SYSDATE
                join 
                    (select yrow, doy, daylength 
                    from pp_gridrow_daylength)b 
                on a.yrow = b.yrow and a.doy = b.doy)
                group by yrow) as TSUM_CALC,
            PHASE as pp_calc
        from tsum_pphase 
        where klt = 202)
    where TSUM_CALC > pp_start_tsum
    order by pp_start_tsum desc)
where rownum = 1;
