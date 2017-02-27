

--looking at how many procedures were done in each state
select state, count(*) as state_count
from proceduretrans proc
inner join geninfotrans gen
on gen.provider_id = proc.provider_id
group by state
order by state_count asc;


--looking at the variance in scores for each state 
select state, variance(score) as state_var
from proceduretrans proc
inner join geninfotrans gen
on gen.provider_id = proc.provider_id
group by state
order by state_var asc;


--getting the average score for states and finding the best states
--removing states with high variance and low procedure numbers
select state, sum(score) agg_score, avg(score) as av_score,
variance(score) as var_score, count(*) as state_procedures
from proceduretrans proc
inner join geninfotrans gen
on gen.provider_id = proc.provider_id
group by state
having state_procedures > 1000
and var_score < 3000
order by av_score desc
limit 10;
