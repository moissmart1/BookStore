INSERT INTO address(address)
VALUES
	('the stores address'),
	('the owners house'),
	('edis house'),
	('bobs house'),
	('fire headquarters'),
	('carleton university'),
	('big pick headquarters'),
	('trntons house');

INSERT INTO Users(U_name,billing_address,address,U_password,Admin_privilege)
VALUES
	('owner',2,2,'admin',TRUE),
	('edi',3,3,'12345',FALSE),
	('bob',4,4,'54321',FALSE);
	
INSERT INTO publishers(P_name,address,email_address,bank_account)
VALUES
	('fire publishing',4,'fire@gmail.com',0000),
	('carleton Bird publishing',5,'carletonbird@gmail.com',0001),
	('big Pick publishing',6,'bigpick@gmail.com',0002),
	('apple inc',7,'applelovesmonery@apple.com',0003);
	
	
INSERT INTO books(B_name,Author,publisher_number,number_of_pages,price,number_in_stock,publisher_sale_percentage,date_published)
VALUES
	('harry Potter: the light of the moon','harry potter',1,50,59,23,3,'2020-01-01'),
	('vampire hunters','Pete Johnson',1,41,20,3,1,'2012-12-03'),
	('the life of the apple guru','jack black',4,5,799,19,99,'2017-11-06'),
	('harry potter: the dark of the crack','harry potter',1,55,78,27,4,'2020-01-01'),
	('vampire fighters','pete johnson',1,41,20,3,1,'2012-12-03'),
	('the life of the apple guru 1.5','jack black',4,5,999,19,99,'2017-11-06');
	
INSERT INTO orders(u_id,shipping_address,billing_address)
VALUES
	(2,2,3),
	(3,8,6),
	(3,8,6);
	

INSERT INTO phone_numbers(phone_numbers,publisher_number)
VALUES
	(55555,1),
	(22222,2),
	(44444,3),
	(33333,4),
	(66666,3),
	(77777,4),
	(88888,4),
	(11111,2);

INSERT INTO Genre(G_name)
VALUES
	('fantacy'),
	('money'),
	('thriller'),
	('adventure');
	
INSERT INTO Book_genre(G_ID,ISBN)
VALUES
	(1,1),
	(3,1),
	(1,2),
	(3,2),
	(4,1),
	(2,3);
	
INSERT INTO books_in_order(ISBN,order_number,quantity)
VALUES
	(1,3,2),
	(2,2,11),
	(3,1,3),
	(2,3,1);


INSERT INTO cart(U_ID,ISBN,quantity)
VALUES
	(2,3,14),
	(3,1,1),
	(3,2,1),
	(3,3,3);
	







