CREATE TABLE IF NOT EXISTS PUBLISHERS(
	Publisher_number SERIAL PRIMARY KEY,
	P_name VARCHAR(40),
	Address SMALLINT,
	Email_address VARCHAR(40),
	Bank_account SMALLINT
);


CREATE TABLE IF NOT EXISTS Books(
	ISBN SERIAL PRIMARY KEY,
	B_name VARCHAR(40),
	author VARCHAR(40),
	publisher_number INT,
	number_of_pages SMALLINT,
	price SMALLINT,
	number_in_stock SMALLINT,
	publisher_sale_percentage SMALLINT,
	date_published DATE,
	FOREIGN KEY (publisher_number)
		REFERENCES Publishers (publisher_number)
	
);

CREATE TABLE IF NOT EXISTS Address(
	A_ID SERIAL PRIMARY KEY,
	address VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS Users(
	U_ID SERIAL PRIMARY KEY,
	U_name VARCHAR(40),
	Billing_address INT,
	address INT,
	U_password VARCHAR(40),
	Admin_privilege BOOLEAN,
	FOREIGN KEY (Billing_address)
		REFERENCES Address (A_ID),
	FOREIGN KEY (address)
		REFERENCES Address (A_ID)
);


CREATE TABLE IF NOT EXISTS Orders(
	Order_number SERIAL PRIMARY KEY,
	Tracking_number SERIAL,
	U_ID INT,
	Shipping_address INT,
	Billing_address INT,
	FOREIGN KEY (Billing_address)
		REFERENCES Address (A_ID),
	FOREIGN KEY (Shipping_address)
		REFERENCES Address (A_ID),
	FOREIGN KEY (U_ID)
		REFERENCES Users (U_ID)
);

CREATE TABLE IF NOT EXISTS Phone_numbers(
	Phone_numbers INT PRIMARY KEY,
	Publisher_number INT,
	FOREIGN KEY (Publisher_number)
		REFERENCES Publishers (Publisher_number)
);

CREATE TABLE IF NOT EXISTS Books_in_order(
	ISBN INT,
	Order_number INT,
	Quantity INT,
	PRIMARY KEY (ISBN,Order_number),
	FOREIGN KEY (ISBN)
		REFERENCES Books (ISBN),
	FOREIGN KEY (Order_number)
		REFERENCES Orders (Order_number)
);

CREATE TABLE IF NOT EXISTS CART (
	U_ID INT,
	ISBN INT,
	Quantity INT,
	PRIMARY KEY (U_ID,ISBN),
	FOREIGN KEY (U_ID)
		REFERENCES Users (U_ID),
	FOREIGN KEY (ISBN)
		REFERENCES books (ISBN)
);

CREATE TABLE IF NOT EXISTS Genre(
	G_ID SERIAL PRIMARY KEY,
	G_name VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS Book_Genre(
	G_ID INT,
	ISBN INT,
	PRIMARY KEY (G_ID,ISBN),
	FOREIGN KEY (G_ID)
		REFERENCES Genre (G_ID),
	FOREIGN KEY (ISBN)
		REFERENCES Books (ISBN)
);





