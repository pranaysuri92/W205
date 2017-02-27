--searching for the number of instances for each procedure
select measure_name, count(*) as measure_count
from proceduretrans proc
inner join codemapping code
on code.measure_id = proc.measure_id
group by measure_name
order by measure_count desc;

--looking for the highest variance, restricting based on instances of each procedure
select measure_name, variance(score) as measure_var, count(*) as measure_count
from proceduretrans proc
inner join codemapping code
on code.measure_id = proc.measure_id
group by measure_name
having measure_count > 1000
order by measure_var desc
limit 10;
