INSERT INTO address(a_id,address)
VALUES
	(0,'The stores address'),
	(1,'The owners house'),
	(2,'edis house'),
	(3,'bobs house'),
	(4,'fire headquarters'),
	(5,'carleton university'),
	(6,'big pick headquarters'),
	(7,'bobs house');

INSERT INTO Users(U_ID,U_name,billing_address,address,U_password,Admin_privilege)
VALUES
	(0,'owner',1,0,'admin',TRUE),
	(1,'edi',2,2,'12345',FALSE),
	(2,'bob',3,3,'54321',FALSE);
	
INSERT INTO publishers(publisher_number,P_name,address,email_address,bank_account)
VALUES
	(0,'Fire publishing',4,'fire@gmail.com',0000),
	(1,'Carleton Bird publishing',5,'carletonbird@gmail.com',0001),
	(2,'Big Pick publishing',6,'bigpick@gmail.com',0002),
	(3,'Apple inc',7,'applelovesmonery@apple.com',0003);
	
	
INSERT INTO books(ISBN,B_name,Author,publisher_number,number_of_pages,price,number_in_stock,publisher_sale_percentage,date_published)
VALUES
	(0,'Harry Potter: The light of the moon','Harry Potter',0,50,59,23,3,'2020-01-01'),
	(1,'Vampire hunters','Pete Johnson',0,41,20,3,1,'2012-12-03'),
	(2,'The life of the Apple guru','Jack Black',3,5,799,19,99,'2017-11-06');
	
INSERT INTO orders(order_number,tracking_number,U_ID,shipping_address,billing_address)
VALUES
	(0,0,1,2,2),
	(1,1,2,7,5),
	(2,2,2,7,5);
	

INSERT INTO phone_numbers(phone_numbers,publisher_number)
VALUES
	(55555,0),
	(22222,1),
	(44444,2),
	(33333,3),
	(66666,2),
	(77777,3),
	(88888,3),
	(11111,1);

INSERT INTO Genre(G_ID,G_name)
VALUES
	(0,'fantacy'),
	(1,'money'),
	(2,'thriller'),
	(3,'adventure');
	
INSERT INTO Book_genre(G_ID,ISBN)
VALUES
	(0,0),
	(2,0),
	(0,1),
	(2,1),
	(3,0),
	(1,2);
	
INSERT INTO books_in_order(ISBN,order_number,quantity)
VALUES
	(0,2,2),
	(0,2,1),
	(1,1,10),
	(2,0,3),
	(1,1,1);


INSERT INTO cart(U_ID,ISBN,quantity)
VALUES
	(1,2,14),
	(2,0,1),
	(2,1,1),
	(2,2,3);
	







