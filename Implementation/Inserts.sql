/*

Athens Car Rental Database Project
@author Lattas Alexandros
		Katsigiannis Fotis
@date January 2015

Inserts.sql
		
This file inserts random info in
the database to be used for testing
purposes.

*/


/* 1 Category*/
/* (7) */
Insert into Category(cat_code,cat_name,description)Values(100,'4x4','all terrain')
Insert into Category(cat_code,cat_name,description)Values(101,'sedan','luxury')
Insert into Category(cat_code,cat_name,description)Values(102,'citycar','all terrain')
Insert into Category(cat_code,cat_name,description)Values(103,'sport','all terrain')
Insert into Category(cat_code,cat_name,description)Values(104,'SUV','all terrain')
Insert into Category(cat_code,cat_name,description)Values(105,'auto','no-man')
Insert into Category(cat_code,cat_name,description)Values(106,'semi-auto','speed-ch')

/* 2 Car */
/* (9) */
Insert into Car(VIN,company,model,date_of_purchase)Values('okirtodf948git8a6','Jeep','Cherokee','2012-10-11')
Insert into Car(VIN,company,model,date_of_purchase)Values('ek9gi85od0ajt8igr','Toyota','Yaris','2003-9-11')
Insert into Car(VIN,company,model,date_of_purchase)Values('0fktlxj90iu32183j','Ford','Focus-RS','2012-10-8')
Insert into Car(VIN,company,model,date_of_purchase)Values('9fis844k4n9d888Lj','Mitsubishi','Pajero','2009-7-11')
Insert into Car(VIN,company,model,date_of_purchase)Values('0s93iijdikejc8848','Chevrolet','Camaro','2012-10-3')
Insert into Car(VIN,company,model,date_of_purchase)Values('1qi281sadasddsa34','Ferrari','Enzzo','2012-6-11')
Insert into Car(VIN,company,model,date_of_purchase)Values('7863453gfduj7jjd5','Opel','Corsa','2014-10-4')
Insert into Car(VIN,company,model,date_of_purchase)Values('0oiaio9ai994594i9','BMW','M3','2011-11-11')
Insert into Car(VIN,company,model,date_of_purchase)Values('lsikaodi984y2111k','Citroen','C3','2012-12-12')

/* 3 Belongs to */
/* (11) */
Insert into Belongs_to(cat_code,VIN)Values(100,'okirtodf948git8a6')
Insert into Belongs_to(cat_code,VIN)Values(100,'9fis844k4n9d888Lj')
Insert into Belongs_to(cat_code,VIN)Values(102,'ek9gi85od0ajt8igr')
Insert into Belongs_to(cat_code,VIN)Values(102,'7863453gfduj7jjd5')
Insert into Belongs_to(cat_code,VIN)Values(105,'0oiaio9ai994594i9')
Insert into Belongs_to(cat_code,VIN)Values(102,'lsikaodi984y2111k')/*Citroel C3 auto & city car */
Insert into Belongs_to(cat_code,VIN)Values(105,'lsikaodi984y2111k')
Insert into Belongs_to(cat_code,VIN)Values(106,'0fktlxj90iu32183j')/*Focus RS semi-auto&sport */
Insert into Belongs_to(cat_code,VIN)Values(103,'0fktlxj90iu32183j')
Insert into Belongs_to(cat_code,VIN)Values(103,'0s93iijdikejc8848')
Insert into Belongs_to(cat_code,VIN)Values(103,'1qi281sadasddsa34')

/* 4 Location */
/* (4) */
Insert into Location(loc_code,city,postal_code,street,street_num,responsible)Values(1,'Athens','15669','Angelwn','12','Angelos Papanikos')
Insert into Location(loc_code,city,postal_code,street,street_num,responsible)Values(2,'Athens','12321','Kirimi','42','Nikos Nikou')
Insert into Location(loc_code,city,postal_code,street,street_num,responsible)Values(3,'Patra','22312','Karnavalou','7','Georgia Mata')
Insert into Location(loc_code,city,postal_code,street,street_num,responsible)Values(4,'Thessaloniki','13469','Angelwn','12','Aggelos Papanikos')

/* 5 Phone Number */
/* (5) */
Insert into Phone_Number(loc_code,number)Values(1,'00302106534213')
Insert into Phone_Number(loc_code,number)Values(1,'00302106534234')
Insert into Phone_Number(loc_code,number)Values(2,'00302103433413')
Insert into Phone_Number(loc_code,number)Values(3,'00302610453423')
Insert into Phone_Number(loc_code,number)Values(4,'00302310483718')

/* 6 Payment */
/* (6) */
Insert into Payment(number,date,amount)Values(00000001,'20140618 10:34:09 AM',200.50)
Insert into Payment(number,date,amount)Values(00000002,'20140625 11:44:29 PM',100.23)
Insert into Payment(number,date,amount)Values(00000003,'20140626 10:44:19 AM',18.53)
Insert into Payment(number,date,amount)Values(00000004,'20140701 09:54:00 AM',24.34)
Insert into Payment(number,date,amount)Values(00000005,'20140702 00:34:09 AM',200.00)
Insert into Payment(number,date,amount)Values(00000006,'20140704 01:10:09 PM',101.45)
Insert into Payment(number,date,amount)Values(00000007,'20100104 01:10:09 PM',101.45)
Insert into Payment(number,date,amount)Values(00000008,'20090104 01:10:09 PM',105.45)
Insert into Payment(number,date,amount)Values(00000009,'20100104 01:10:09 PM',1.45)
Insert into Payment(number,date,amount)Values(000000010,'20090104 01:10:09 PM',106.45)

/* 7 Credit Card */
/* (3) */
Insert into Credit_Card(number,code,exp_date)Values(00000002,'0032999911233343123','20180618 10:00:00 AM')
Insert into Credit_Card(number,code,exp_date)Values(00000004,'1123322599839932097','20190618 10:00:00 AM')
Insert into Credit_Card(number,code,exp_date)Values(00000006,'4453662366720092002','20200618 10:00:00 AM')

/* 8 Region */
/* (4) */
Insert into Region(code,region_name,region_population,av_annual_income)Values(1,'Papagou',50432,22342.45)
Insert into Region(code,region_name,region_population,av_annual_income)Values(2,'Pagrati',110453,18030.65)
Insert into Region(code,region_name,region_population,av_annual_income)Values(3,'Filothei',45776,32542.67)
Insert into Region(code,region_name,region_population,av_annual_income)Values(4,'Cholargos',189543,19332.09)
Insert into Region(code,region_name,region_population,av_annual_income)Values(10025,'Kapou',186543,5625.90)

/* 9 Customer */
/* (5) */
Insert into Customer(cust_code,cust_name,cust_surname,phone_number,city,postal_code,street,street_number)
	Values(1,'Giorgos','Nikolaou','00306975434231','Athens','14553','Kosta Nikoli','44')
Insert into Customer(cust_code,cust_name,cust_surname,phone_number,city,postal_code,street,street_number)
	Values(2,'Nikos','Giannatos','00306974562534','Athens','14452','Ipeirou','56')
Insert into Customer(cust_code,cust_name,cust_surname,phone_number,city,postal_code,street,street_number)
	Values(3,'Maria','Nikou','00306974009212','Athens','16521','Pindou','7')
Insert into Customer(cust_code,cust_name,cust_surname,phone_number,city,postal_code,street,street_number)
	Values(4,'Niki','Goustozou','00306976565643','Patra','21553','Kipou','21')
Insert into Customer(cust_code,cust_name,cust_surname,phone_number,city,postal_code,street,street_number)
	Values(5,'Apostolos','Gletsos','00306986456790','Athens','14221','Krakovis','106')
Insert into Customer(cust_code,cust_name,cust_surname,phone_number,city,postal_code,street,street_number)
	Values(7,'Apostolos','Nionios','00306986454440','Athens','14222','Kolokotroni','104')

/* 10 Lives_in */
/* (5) */
Insert into Lives_in(code,cust_code)Values(1,1)
Insert into Lives_in(code,cust_code)Values(1,2)
Insert into Lives_in(code,cust_code)Values(2,3)
Insert into Lives_in(code,cust_code)Values(4,4)
Insert into Lives_in(code,cust_code)Values(2,5)
Insert into Lives_in(code,cust_code)Values(10025,7)

/* 11 Rental */
/* (6) */
Insert into Rental(rental_code,rental_value)Values(1,200.50)
Insert into Rental(rental_code,rental_value)Values(2,210.00)
Insert into Rental(rental_code,rental_value)Values(3,100.46)
Insert into Rental(rental_code,rental_value)Values(4,80.50)
Insert into Rental(rental_code,rental_value)Values(5,200.50)
Insert into Rental(rental_code,rental_value)Values(6,60.00)
Insert into Rental(rental_code,rental_value)Values(7,85.50)
Insert into Rental(rental_code,rental_value)Values(8,200.50)
Insert into Rental(rental_code,rental_value)Values(9,100.50)
Insert into Rental(rental_code,rental_value)Values(10,150.00)
Insert into Rental(rental_code,rental_value)Values(11,180.50)
Insert into Rental(rental_code,rental_value)Values(12,181.50)
Insert into Rental(rental_code,rental_value)Values(13,1810.50)

/* 12 Rental_of */
/* (6) */
Insert into Rental_of(VIN,rental_code)Values('okirtodf948git8a6',1)
Insert into Rental_of(VIN,rental_code)Values('ek9gi85od0ajt8igr',2)
Insert into Rental_of(VIN,rental_code)Values('0fktlxj90iu32183j',3)
Insert into Rental_of(VIN,rental_code)Values('0s93iijdikejc8848',4)
Insert into Rental_of(VIN,rental_code)Values('7863453gfduj7jjd5',5)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',6)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',8)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',9)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',10)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',11)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',12)
Insert into Rental_of(VIN,rental_code)Values('lsikaodi984y2111k',13)

/* 13 Payment_of */
/* (6) */
Insert into Payment_of(rental_code,number)Values(1,1)
Insert into Payment_of(rental_code,number)Values(2,3)
Insert into Payment_of(rental_code,number)Values(3,2)
Insert into Payment_of(rental_code,number)Values(4,4)
Insert into Payment_of(rental_code,number)Values(5,6)
Insert into Payment_of(rental_code,number)Values(6,5

/* 14 Rented_from */
/* (6) */
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,1,'20140618 10:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(2,2,'20140619 11:04:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(3,3,'20140620 09:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(4,4,'20140621 08:04:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(3,5,'20140622 07:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(2,6,'20140623 06:34:10 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,7,'20100922 00:00:00 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,8,'20100601 10:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,9,'20100603 10:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,10,'20100606 10:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,11,'20100609 10:34:09 AM')
Insert into Rented_from(loc_code,rental_code,rental_date)Values(1,12,'20100614 10:34:09 AM')

/* 15 Return_to */
/* (6) */
Insert into Return_to(loc_code,rental_code,return_date)Values(1,1,'20140718 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(4,2,'20140819 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(3,3,'20140720 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,4,'20140622 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(3,5,'20140722 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(2,6,'20140823 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,7,'20100924 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,8,'20100602 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,9,'20100604 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,10,'20100607 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,11,'20100610 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,12,'20100619 00:00:00 AM')
Insert into Return_to(loc_code,rental_code,return_date)Values(1,13,'20100619 00:00:00 AM')

/* 16 Rents */
/* (6) */
Insert into Rents(cust_code,rental_code)Values(1,1)
Insert into Rents(cust_code,rental_code)Values(2,2)
Insert into Rents(cust_code,rental_code)Values(3,3)
Insert into Rents(cust_code,rental_code)Values(4,4)
Insert into Rents(cust_code,rental_code)Values(2,5)
Insert into Rents(cust_code,rental_code)Values(5,6)
Insert into Rents(cust_code,rental_code)Values(7,7)
Insert into Rents(cust_code,rental_code)Values(2,10)
Insert into Rents(cust_code,rental_code)Values(2,8)
Insert into Rents(cust_code,rental_code)Values(2,9)
Insert into Rents(cust_code,rental_code)Values(2,11)
Insert into Rents(cust_code,rental_code)Values(2,12)
Insert into Rents(cust_code,rental_code)Values(3,13)

/* 17 Corporational */
/* (2) */
Insert into Corporational(cust_code,tax_id_num,discount_percentage)Values(2,'4526352636',05.40)
Insert into Corporational(cust_code,tax_id_num,discount_percentage)Values(4,'0123439810',02.25)

/* 18 Simple */
/* (3) */
Insert into Simple(cust_code,date_of_birth)Values(1,'19870830 00:00:00 AM')
Insert into Simple(cust_code,date_of_birth)Values(3,'19850422 00:00:00 AM')
Insert into Simple(cust_code,date_of_birth)Values(5,'19651201 00:00:00 AM')

/* 19 Drivers */
/* (3) */
Insert into Drivers(cust_code,driver_name,driver_surname,driver_age)Values(1,'Giorgos','Apostolou',34)
Insert into Drivers(cust_code,driver_name,driver_surname,driver_age)Values(1,'Maria','Antoniadou',23)
Insert into Drivers(cust_code,driver_name,driver_surname,driver_age)Values(3,'Viola','Deka',50)
