
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

update amount_paid,
where payment_id=001 as 30000;