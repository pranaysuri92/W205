DROP TABLE surveytrans;
CREATE TABLE surveytrans AS
SELECT provider_id, base_score, consistency_score FROM survey
WHERE base_score NOT LIKE '%N%'
AND consistency_score NOT LIKE '%N%';
