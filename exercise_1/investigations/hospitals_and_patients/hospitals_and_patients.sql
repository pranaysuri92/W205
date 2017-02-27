--consistency score distribution
select consistency_score, count(*) from surveytrans
group by consistency_score;

--high quality schools vs consistency score and base score
select proc.provider_id, hospital_name, sum(score) agg_score, avg(score) as av_score,
variance(score) as var_score, count(*) as total_procedures,
base_score, consistency_score
from proceduretrans proc
inner join geninfotrans gen
on gen.provider_id = proc.provider_id
inner join surveytrans st
on st.provider_id = proc.provider_id
group by hospital_name, proc.provider_id, consistency_score, base_score
having total_procedures > 34
and var_score < 2425.74
order by av_score desc
limit 10;

--base score distribuition 
select base_score, count(*) from surveytrans
group by base_score;

--high procedure variability vs consistency score and base score
select measure_name, variance(score) as measure_var, count(*) as measure_count,
base_score, consistency_score
from proceduretrans proc
inner join codemapping code
on code.measure_id = proc.measure_id
inner join surveytrans st
on st.provider_id = proc.provider_id
group by measure_name, base_score, consistency_score
order by measure_var desc
limit 10;
