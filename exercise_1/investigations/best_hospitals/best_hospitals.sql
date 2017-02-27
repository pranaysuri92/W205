--finding the average variance for all hospitals
select avg(var_score) from
(
select provider_id, variance(score) as var_score from proceduretrans
group by provider_id
) a;

-- finding the average number of procedures for a hospital
select avg(procedure_number) from
(
select provider_id, count(*) as procedure_number from proceduretrans
group by provider_id
) a;


-- using the average procedures and average variance to find best hospitals
select proc.provider_id, hospital_name, sum(score) agg_score, avg(score) as av_score,
variance(score) as var_score, count(*) as total_procedures
from proceduretrans proc
inner join geninfotrans gen
on gen.provider_id = proc.provider_id
group by hospital_name, proc.provider_id
having total_procedures > 34
and var_score < 2425.74
order by av_score desc
limit 10;
