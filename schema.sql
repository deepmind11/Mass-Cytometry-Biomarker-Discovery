CREATE TABLE IF NOT EXISTS "subjects" (
    "id" INTEGER,
    "subject_id" TEXT,
    "age" INTEGER CHECK("age" > 0),
    "sex" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "samples" (
    "id" INTEGER,
    "sample_id" TEXT,
    "treatment" TEXT,
    "time_from_treatment_start" INTEGER,
    "response" TEXT CHECK("response" IN ('y', 'n', NULL)),
    "sample_type" TEXT,
    "project_id" TEXT,
    "subject_id" TEXT,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("subject_id") REFERENCES "subjects"("id") ON DELETE CASCADE,
    FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "conditions" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "projects" (
    "id" INTEGER,
    "project_id" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);


CREATE TABLE IF NOT EXISTS "measurements"(
    "sample_id" INTEGER NOT NULL,
    "measurement_type" TEXT NOT NULL,
    "value" NUMERIC,
    PRIMARY KEY ("sample_id", "measurement_type"),
    FOREIGN KEY ("sample_id") REFERENCES "samples"("id") ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "diagnosis"(
    "subject_id" INTEGER NOT NULL,
    "condition_id" INTEGER NOT NULL,
    PRIMARY KEY ("subject_id", "condition_id"),
    FOREIGN KEY ("subject_id") REFERENCES "subjects"("id") ON DELETE CASCADE,
    FOREIGN KEY ("condition_id") REFERENCES "conditions"("id") ON DELETE CASCADE

);

CREATE TABLE IF NOT EXISTS "participants"(
    "subject_id" INTEGER NOT NULL,
    "project_id" INTEGER NOT NULL,
    PRIMARY KEY ("subject_id", "project_id"),
    FOREIGN KEY ("subject_id") REFERENCES "subjects"("id") ON DELETE CASCADE,
    FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE CASCADE
);


CREATE INDEX IF NOT EXISTS "measurements_type_idx" ON "measurements" ("measurement_type");
CREATE INDEX IF NOT EXISTS "measurements_sample_idx" ON "measurements" ("sample_id");
CREATE INDEX IF NOT EXISTS "subjects_idx" ON "subjects" ("subject_id");
CREATE INDEX IF NOT EXISTS "samples_project_idx" ON "samples" ("project_id");
CREATE INDEX IF NOT EXISTS "samples_treatment_idx" ON "samples" ("treatment", "sample_type", "time_from_treatment_start", "response");
CREATE INDEX IF NOT EXISTS "participants_idx" ON "participants" ("project_id");
CREATE INDEX IF NOT EXISTS "diagnosis_idx" ON "diagnosis" ("subject_id");

 