# Teiko Technical Assesment Report

## Environment setup

To run the code in this project, you need to set the environment as specified in the **environment.yml** file.
You need to have conda or mamba installed. (I prefer mamba as it is faster)
Make sure your current working directory is set to this project.

Create the environment and activate it:

`conda env create --file environment.yml`

`conda activate teiko`

## Python Assesment

### Question 1

1. Delete cell_count_transformed.csv.
2. Run p1_notebook.ipynb to generate cell_count_transformed.csv

### Question 2

1. Run p2_notebook.ipynb

## Database Assesment

I have used sqlite to create a database called teiko.db
To connect to the database you can type `sqlite3 teiko.db` at the terminal.

### Question 1

The schema of the database is available in the schema.sql file.
You can find the ER diagram [here](https://dbdiagram.io/d/6612f20303593b6b61675b8d)

![ER Diagram]('./teiko.png')

Here is a summary of the schema:

1. There are a total of 5 entities
    * samples
    * subjects
    * projects
    * conditions
    * measurements
2. There are two junction tables
    * diagnosis - subject is diagnosed with conditions
    * participants - subject participates in these projects
3. It has the following indices
    * measurements_type_idx ON measurements (measurement_type)
    * measurements_sample_idx ON measurements (sample_id)
    * subjects_idx ON subjects (subject_id)
    * samples_project_idx ON samples (project_id)
    * samples_treatment_idx ON samples (treatment, sample_type, time_from_treatment_start, response)
    * participants_idx ON participants (project_id)
    * diagnosis_idx ON diagnosis (subject_id)

### Question 2

Advantages of capturing this information in a database:

1. Scalability: Database can handle large volumes of data without significant performance reductions
2. Data Integrity: with appropriate constraints we can ensure that our DB is consistent. ACID property of transactions.
3. Concurrent Access: allowing multiple analyses pipleines/users to access the DB.
4. Security: Securing Patient Information.
5. Faster Access: With appropriate indexing we can ensure faster data access.
6. Defining relationships between tables
7. Redundancy Reduction
8. Version Control: to track how the database evolved over time

### Question 3 - 5

1. Connect to the database: `sqlite3 teiko.db` at the terminal
2. Copy paste the SQL queries from "queries.sql" file to get the results.

#### Q3

|   name   | number_of_subjects |
|----------|--------------------|
| healthy  | 4                  |
| lung     | 3                  |
| melanoma | 6                  |

#### Q4

| sample_id |
|-----------|
| s5        |
| s14       |
| s15       |
| s16       |
| s1        |
| s12       |
| s13       |
| s17       |

#### Q5

| project_id | number_of_samples |
|------------|-------------------|
| 1          | 2                 |
| 2          | 4                 |
| 3          | 2                 |

| response | number_of_samples |
|----------|-------------------|
| n        | 4                 |
| y        | 4                 |

| sex | number_of_samples |
|-----|-------------------|
| F   | 4                 |
| M   | 4                 |
