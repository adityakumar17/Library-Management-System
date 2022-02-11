create database library;

show databases;

use library;

Create table readers
	(
    reader_id VARCHAR(6),
	fname VARCHAR(30),
	mname VARCHAR(30),
	ltname VARCHAR (30), 
    city VARCHAR (15),
	mobile_no VARCHAR(10), 
    occupation VARCHAR(10),
	dob DATE, 
    CONSTRAINT readers_pk PRIMARY KEY (reader_id)
    )
    
Insert into readers values ('001','Aditya',null,'Kumar','Delhi','7447698227','Service','2021-03-23');
Insert into readers values ('002','Renu',null,'Kumar','Delhi','6748840587','Retiered','2021-05-12');
Insert into readers values ('003','Ekta',null,'Kumar','Delhi','8167728292','Service','2021-05-31');
Insert into readers values ('004','Rajeev',null,'Kumar','Delhi','8167491209','Retiered','2021-06-13');
Insert into readers values ('005','Poonam',null,'Kumar','Delhi','6141155088','Retiered','2021-08-25');
Insert into readers values ('006','Dhruv',null,'Kumar','Delhi','6127916435','Service','2021-09-03');
Insert into readers values ('007','Krishni',null,'Kumar','Delhi','7317458521','Service','2021-09-07');
Insert into readers values ('008','Kundan','Lal','Kumar','Delhi','6127999469','Retiered','2021-09-18');
Insert into readers values ('009','Salochna',null,'Kumar','Delhi','6127953028','House Wife','2021-12-01');
Insert into readers values ('010','Snigdha',null,'Kumar','Delhi','7702028637','Service','2021-12-20');

Create table Book
	(
	bid VARCHAR(6),
	bname VARCHAR(40),
	bdomain VARCHAR(30),
    CONSTRAINT book_bid_pk PRIMARY KEY(bid)
	);

Insert into book values('B00001','The Cat in the Hat','Story'); 
Insert into book values('B00002', 'Charlie and the Chocolate Factory','Story'); 
Insert into book values('B00003','The Very Hungry Caterpillar','Story');

CREATE TABLE active_readers
	(
		account_id VARCHAR(6),
		reader_id VARCHAR(6),
		bid VARCHAR(6),
		atype VARCHAR(10),
		astatus VARCHAR(10), 
		CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id), 
		CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers (reader_id),
		CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)
	);
    
insert into active_readers values ('A00001','001','B00001','Premium','Active');
insert into active_readers values ('A00002','002','B00002','Regular','Active');
insert into active_readers values ('A00003','003','B00002','Premium','Active');
insert into active_readers values ('A00004','004','B00003','Premium','Active');
insert into active_readers values ('A00005','005','B00002','Regular','Active');
insert into active_readers values ('A00006','006','B00001','Premium','Suspended');
insert into active_readers values ('A00007','007','B00001','Premium','Active');
insert into active_readers values ('A00008','008','B00003','Regular','Terminated');
insert into active_readers values ('A00009','009','B00002','Premium','Terminated');
insert into active_readers values ('A00010','010','B00002','Regular','Active');

create table bookissue_details
	(
		issuenumber varchar(6),
        account_id varchar(6),
        bid varchar(20),
        bookname varchar(50),
        number_of_book_issued int(7),
        CONSTRAINT trandetails_tnumber_pk primary key (issuenumber),
        CONSTRAINT trandetails_acnumber_fk foreign key(account_id) references active_readers(account_id)
	);

select * from bookissue_details;

insert into bookissue_details values ('T00001','A00001','B00001','The Cat in the Hat','1');
insert into bookissue_details values ('T00002','A00001','B00002','Charlie and the Chocolate Factory','3');
insert into bookissue_details values ('T00003','A00002','B00001','The Cat in the Hat','4');
insert into bookissue_details values ('T00004','A00002','B00003','The Very Hungry Caterpillar','2');

select * from active_readers;

select * from active_readers where astatus='Terminated';

select * from active_readers where astatus='Active';