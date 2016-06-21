#code in progress
#not functioning
#out of time

SELECT DISTINCT a.measure_id, ROUND(a.sd_score, 2) as sd_score, a.range_score FROM (SELECT e.measure_id, STDDEV_POP(e.score) as sd_score, MAX(e.score) - MIN(e.score) as range_score FROM effective_care_tr e GROUP BY e.measure_id) a ORDER BY desc limit 10;

