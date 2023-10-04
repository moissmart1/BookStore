-- Quary for getting a users user name and password
SELECT U_id,U_name,U_password
FROM users
WHERE U_name='owner'

--Signup: adds a user and their info to the data base
    --if user address already exists
        --gets aid of the user
        SELECT A_ID
        FROM address
        WHERE address='edis house'

        --inserts the user info
        INSERT INTO users(U_name,billing_address,address,U_password,Admin_privilege)
        VALUES ('mozaiha','2','2','mo',FALSE);

    --if user address doesnt exist
        --users addresses
        INSERT INTO address(address)
        VALUES
        ('mozaihas house');
        --users info
        INSERT INTO users(U_name,billing_address,address,U_password,Admin_privilege)
        VALUES ('mozaiha',(SELECT a_id
                    FROM address
                    WHERE address='mozaihas billing address'  
                ),(SELECT a_id
                    FROM address
                    WHERE address='mozaihas shipping address'  
                ),'mo',FALSE);
    
--Searching for books
    --by ISBN
    SELECT *
    FROM books
    WHERE ISBN=1

    --by author
    SELECT *
    FROM books 
    WHERE position('author' in books.author)>0

    --by name
    SELECT *
    FROM books 
    WHERE position('name' in books.b_name)>0

    --by genre
    SELECT books.ISBN,books.B_name,books.author,books.publisher_number,books.number_of_pages,books.price,books.number_in_stock,books.publisher_sale_percentage,books.date_published
    FROM genre
    NATURAL JOIN book_genre
    NATURAL JOIN books
    WHERE position('genre' in genre.g_name)>0
;

--Getting the content of a users cart
SELECT books.ISBN,books.B_name,books.author,books.publisher_number,books.number_of_pages,books.price,books.number_in_stock,books.publisher_sale_percentage,books.date_published
FROM users
NATURAL JOIN cart
NATURAL JOIN books
WHERE users.U_ID='2'

--add object to caRT
INSERT INTO cart(U_ID,ISBN,quantity)
 VALUES
  ();

--make orders
INSERT INTO orders(u_id,shipping_address,billing_address)
VALUES
    (2,2,2)
RETURNING u_id

--add books to made order
INSERT INTO books_in_order(ISBN,order_number,quantity)
VALUES
    (),
    (),
    ();

--Getting the orders a user has made
    --getting order infor
    SELECT order_number,tracking_number,shipping_address
    FROM orders
    WHERE U_ID='2'
    --getting the books that have been ordered and their quanity
    SELECT books.b_name,books_in_order.quantity
    FROM orders
    NATURAL JOIN books_in_order 
    NATURAL JOIN books
    WHERE U_ID='3'

--all tables
SELECT *
FROM users;

SELECT *
FROM publishers;

SELECT *
FROM orders;

SELECT *
FROM books;

SELECT *
FROM phone_numbers;

SELECT *
FROM cart;

SELECT *
FROM books_in_order;

SELECT *
FROM address;

SELECT *
FROM genre;

SELECT *
FROM book_genre;


--the revenue ofn the book store
SELECT SUM(books.price*books_in_order.quantity)
FROM books_in_order
NATURAL JOIN books

--the prive of each order
SELECT SUM(books.price*books_in_order.quantity)
FROM orders
NATURAL JOIN books_in_order
NATURAL JOIN books
GROUP BY orders.order_number

--store owner adding new books 
    --gets book if exists
    SELECT *
    FROM books
    WHERE books.b_name='Harry Potter: The light of the moon' AND author='Harry Potter'

    --inserts book
        --get publisher
        SELECT publisher_number
        FROM publishers
        WHERE p_name='Fire publishing'

        --insert the book info
        INSERT INTO books(B_name,Author,publisher_number,number_of_pages,price,number_in_stock,publisher_sale_percentage,date_published)
        VALUES
	        ()
    
    --add to existing book
    Update 

--getamount of books in stock
SELECT books.number_in_stock
FROM books
WHERE ISBN=1

--reduces quantity a book in the database by 1
UPDATE books
SET number_in_stock = number_in_stock - 1
WHERE isbn = 3;





