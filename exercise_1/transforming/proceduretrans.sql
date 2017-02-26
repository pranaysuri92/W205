DROP TABLE proceduretrans;
CREATE TABLE proceduretrans AS
SELECT a.provider_id, a.measure_id, a.score FROM
(
SELECT rd.provider_id, rd.measure_id, rd.score, 'RD' as procedure_type 
FROM procedurerd rd
WHERE rd.score NOT LIKE '%N%'
UNION ALL
SELECT tec.provider_id, tec.measure_id, tec.score,'TEC' as procedure_type  
FROM proceduretec tec
WHERE tec.score NOT LIKE '%N%'
) a;
