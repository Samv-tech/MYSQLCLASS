
-- creating a database for school tutoria

CREATE DATABASE tutoria_school;


--- creating sudent biodata table

CREATE TABLE student_biodata(
	student_id int,
    fullname varchar(255) NOT NULL,
    gender varchar(50),
    address varchar(255),
    PRIMARY KEY (student_id)
);

-- creating subject table

CREATE TABLE subject(
	subject_id int,
    subjectname varchar(255) NOT NULL,
    subject_code varchar(50),
    lecturer_ID varchar(255),
    PRIMARY KEY (subject_id)
);


-- creating parent biodata table 

CREATE TABLE Parent_biodata(
	parent_id int,
    fullname varchar(255) NOT NULL,
    student_id int,
    primary key (parent_id),
    foreign KEY (student_id) references student_biodata(student_id)
);


-- creating payment table

CREATE TABLE Payment(
	payment_id int,
    student_id int,
    status boolean,
    primary key (payment_id),
    foreign KEY (student_id) references student_biodata(student_id)
);

-- adding review column to parent_biodata table

alter TABLE parent_biodata add column review varchar(1000);

-- adding payment method column to payment table

alter TABLE payment add column payment_method varchar(50);


-- inserting data into student biodata table

insert into student_biodata (student_id, fullname, gender, address)
values
	(1, "Adisa Olagbeso", "Male", "22, olanbiwonu street kudaisi, ibadan"),
    (2, "Ada Ogechi", "Female", "2, olaniyan street, Lagos");
    
-- inserting into payment table

insert into payment (payment_id, student_id, status, payment_method)
values
	(001, 2, 1, "bank transfer"),
    (002, 1, 0, "");
    
-- inserting into parent_biodata

insert into parent_biodata (parent_id, fullname, student_id, review)
values
	(01, "Mr Ogechi", 1, "poor supervision"),
    (02, "Mr Agboola", 2, "excellent service");
    
    
-- to all view the table details

select * from payment;
select * from student_biodata;


-- inserting amount paid into the payment table

alter table payment add column amount_paid decimal(50);



-- inserting more data into the student biodata table

INSERT INTO `tutoria_school`.`student_biodata` (`student_id`, `fullname`, `gender`, `address`) 
VALUES (4, 'Ismail Ajayi', 'Male', '936 Kiehn Route, West Ned, Tennessee'),
		(5, 'Jeromy Mayert', 'Male', '4059 Carling Avenue, Ottawa, Ontario'),
        (6, 'Assisat Osuala', 'Female', '60 Caradon Hill, Ugglebarnby, England'),
        (7, 'Lizzy Ajewole', 'Female', '289 Mohr Heights, Aprilville, Oklahoma');
INSERT INTO `tutoria_school`.`student_biodata` (`student_id`, `fullname`, `gender`, `address`) 
VALUES (8, 'Zachariah Schulist', 'Male', '15 Sellamuttu Avenue 03, Colombo, Colombo'),
		(9, 'Antonio Sandoval', 'Male', 'Avenida Mireia, 5, 8º 2º, Los Verdugo de San Pedro, Cuenca'),
        (10, 'Enzo Massart', 'Female', 'Boulevard Ceulemans 832, Hannut, Mortsel');
        
-- inserting more data into the parent biodata table

INSERT INTO `tutoria_school`.`parent_biodata` (parent_id, fullname, student_id, review) 
VALUES (3, 'Mr Ajayi', 4, 'best school ever'),
		(4, 'Mrs Mayert', 5, 'i dont like the school'),
        (5, 'Mr Osuala', 6, 'poor management'),
        (6, 'Mr Ajewole', 7, 'good student warefare'),
        (7, 'Mr Zachariah', 8, 'i love my student teacher he is very good at his job'),
		(8, 'Mrs Antonio', 9, 'what a good school that concern and check up on their student'),
        (9, 'Mr Massart', 10, 'poor communication'),
        (10, 'Mrs isaa', 3, 'poor communication');
        
        

INSERT INTO `tutoria_school`.`payment` (payment_id, student_id, status, payment_method, amount_paid) 
VALUES (5, 8, 1, 'transfer', 45000),
        (6, 7, 1, 'transfer', 65000),
        (7, 5, 1, 'transfer', 60000),
        (8, 9, 1, 'transfer', 35000),
        (9, 6, 1, 'transfer', 40000),
        (10, 10, 1, 'transfer', 53000);
        
INSERT INTO `tutoria_school`.`payment` (payment_id, student_id, status, payment_method, amount_paid) 
VALUES (4, 4, 1, 'check', 45000);


-- CREATING TABKE FOR LECTURER BIODATA

DROP TABLE LECTURER;

CREATE TABLE LECTURER (
lecturer_id int,
fullname varchar(50) not null,
gender varchar(50),
phoneno nvarchar(20),
address longtext,
PRIMARY KEY(lecturer_id)
);


-- INSERTING DATA INTO THE SUBJECT TABLE

INSERT INTO SUBJECT (subject_id, subjectname, subject_code, lecturer_ID)
values (1, 'tailoring', 'tai101', 02),
		(2, 'catering', 'cat101', 01),
        (3, 'hairdressing', 'had101', 03),
        (4, 'shoemaking', 'shm101', 05),
        (5, 'desktoppublishing', 'com101', 04);
        
        
-- modifying the student biodata by adding the course doing
alter table student_biodata add column subject_id int;


-- updating data into the newly created column

UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '3' WHERE (`student_id` = '2');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '3' WHERE (`student_id` = '4');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '4' WHERE (`student_id` = '5');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '5' WHERE (`student_id` = '3');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '1' WHERE (`student_id` = '6');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '2' WHERE (`student_id` = '7');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '4' WHERE (`student_id` = '8');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '5' WHERE (`student_id` = '9');
UPDATE `tutoria_school`.`student_biodata` SET `subject_id` = '5' WHERE (`student_id` = '10');

-- adding data into the lecturer table
insert into LECTURER (lecturer_id, fullname, gender,  phoneno, address)
values (1, 'Adebayo Abeshin', 'Male', 234826524654, '24, isale eko lagos'),
		(2, 'Ado chiamaka', 'Female', 234747654654, '23, lekki lagos'),
        (3, 'olanipekun josheph', 'Male', 234826524654, '24, victoria island lagos'),
        (4, 'Chibuzo Chiamaka', 'female', 234826524654, '24, banana island lagos'),
        (5, 'Adio Abedanjo', 'Male', 234826524654, '2, ikorodu road lagos');