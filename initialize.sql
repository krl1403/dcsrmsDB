CREATE DATABASE IF NOT EXISTS dcsrms;
USE dcsrms;

CREATE TABLE IF NOT EXISTS user (
	displayName varchar(50),
    email varchar(50),
    userPassword varchar(50),
    verificationCode int
);

CREATE TABLE IF NOT EXISTS student (
	student_id int auto_increment primary key,
    student_number VARCHAR (50),
    first_name VARCHAR (50),
	middle_name VARCHAR (50),
    last_name VARCHAR (50),
    email VARCHAR (50),
    gender VARCHAR (10)
);

CREATE TABLE IF NOT EXISTS course (
	course_id int auto_increment primary key,
    course_code VARCHAR (20),
    course_name VARCHAR (50),
    program_name VARCHAR (50),
    year int,
    section int
);

CREATE TABLE IF NOT EXISTS enrollment (
	enrollment_id int auto_increment primary key,
    student_id int NOT NULL,
    course_id int NOT NULL,

	FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS assessment (
	assessment_id int auto_increment primary key,
    enrollment_id int,
    type VARCHAR (20),
    name VARCHAR (50),
    score INT, 
    max_score int,
    
    FOREIGN KEY (enrollment_id) REFERENCES enrollment(enrollment_id)
);

CREATE TABLE IF NOT EXISTS attendance (
	attendance_id int auto_increment primary key,
    enrollment_id int,
    attendance_date date,
    attendance_status VARCHAR(20),
    
    FOREIGN KEY (enrollment_id) REFERENCES enrollment(enrollment_id)
);

CREATE TABLE IF NOT EXISTS assessment_weights (
	assessment_weights_id INT PRIMARY KEY,
	activity_weight decimal(5,2) ,
	assignment_weight decimal(5,2), 
	project_weight decimal(5,2) ,
	quiz_weight decimal(5,2) ,
	exam_weight decimal(5,2)
);

INSERT IGNORE INTO assessment_weights (assessment_weights_id, activity_weight, assignment_weight, project_weight, quiz_weight, exam_weight) 
VALUES (1, 20, 20, 20, 20, 20);
