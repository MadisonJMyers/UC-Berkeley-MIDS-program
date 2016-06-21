
#code in progress for 3.1 
#out of time

DROP TABLE IF EXISTS best_hospital_scores;
CREATE TABLE best_hospital_scores row format delimited AS SELECT a.survey_avg, a.survey_sd, a.base_avg, a.base_sd, a.consistency_avg, a.consistency_sd FROM (SELECT AVG(s.survey1 + s.survey2 + s.survey3 + s.survey4 + s.survey5 + s.survey6 + s.survey7 + s.survey8 + s.survey9 + s.survey10 + s.survey11 + s.survey12 + s.survey13 + s.survey14 + s.survey15 + s.survey16 + s.survey17 + s.survey18 + s.survey19 + s.survey20 + s.survey21 + s.survey22 + s.survey23 + s.survey24) as survey_avg, STDDEV_POP(s.survey1 + s.survey2 + s.survey3 + s.survey4 + s.survey5 + s.survey6 + s.survey7 + s.survey8 + s.survey9 + s.survey10 + s.survey11 + s.survey12 + s.survey13 + s.survey14 + s.survey15 + s.survey16 + s.survey17 + s.survey18 + s.survey19 + s.survey20 + s.survey21 + s.survey22 + s.survey23 + s.survey24) survey_sd, AVG(s.base_score) base_avg, STDDEV_POP(s.base_score) base_sd, AVG(s.consistency_score) consistency_avg, STDDEV_POP(s.consistency_score) consistency_sd FROM surveys_responses_tr s) a; 

DROP TABLE IF EXISTS hospital_summary_scores;
CREATE TABLE hospital_summary_scores row format delimited AS SELECT h.provider_id, h.hospital_name, ((s.survey1 + s.survey2 + s.survey3 + s.survey4 + s.survey5 + s.survey6 + s.survey7 + s.survey8 + s.survey9 + s.survey10 + s.survey11 + s.survey12 + s.survey13 + s.survey14 + s.survey15 + s.survey16 + s.survey17 + s.survey18 + s.survey19 + s.survey20 + s.survey21 + s.survey22 + s.survey23 + s.survey24) - hs.survey_avg)/hs.survey_sd AS survey_score, (s.base_score - hs.base_avg)/hs.base_sd AS base_score, (s.consistency_score - hs.consistency_avg)/hs.consistency_sd AS consistency_score FROM surveys_responses_tr s INNER JOIN hospitals h ON (s.provider_id = h.provider_id) CROSS JOIN best_hospital_scores hs WHERE s.base_score IS NOT NULL AND s.consistency_score IS NOT NULL;


SELECT a.provider_id, a.hospital_name, ROUND(a.general_score, 2) FROM (SELECT h.provider_id, h.hospital_name, (h.survey_score + h.base_score + h.consistency_score)/3 general_score FROM hospital_summary_scores h ORDER BY general_score desc LIMIT 10) a;


