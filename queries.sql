-- Query 1
SELECT "name", COUNT("subject_id") AS "number_of_subjects" FROM "conditions"
INNER JOIN "diagnosis" ON "diagnosis"."condition_id"="conditions"."id"
GROUP BY "name";

-- Query 2
SELECT "sample_id" FROM "samples"
WHERE "treatment"='tr1'AND "sample_type"='PBMC' AND "time_from_treatment_start"=0; 

-- Query 3
SELECT "project_id", COUNT("sample_id") as "number_of_samples" FROM "samples" 
WHERE "treatment"='tr1'AND "sample_type"='PBMC' AND "time_from_treatment_start"=0 
GROUP BY "project_id";

-- Query 4
SELECT "response", COUNT("sample_id") as "number_of_samples" FROM "samples" 
WHERE "treatment"='tr1'AND "sample_type"='PBMC' AND "time_from_treatment_start"=0 
GROUP BY "response";

-- Query 5
SELECT "sex", COUNT("sample_id") as "number_of_samples" FROM "samples" 
INNER JOIN "subjects" ON "subjects"."id" = "samples"."subject_id"
WHERE "treatment"='tr1'AND "sample_type"='PBMC' AND "time_from_treatment_start"=0 
GROUP BY "sex";