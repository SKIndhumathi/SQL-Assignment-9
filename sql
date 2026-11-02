CREATE DATABASE studentsDB3;
use  studentsDB3;
CREATE TABLE books1 (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    category VARCHAR(50),
    author VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT,
    published_year INT
);
INSERT INTO books1
VALUES
(1, 'Java Basics', 'Programming', 'Arun', 500, 10, 2020),
(2, 'Python Guide', 'Programming', 'Priya', 600, 15, 2022),
(3, 'SQL Master', 'Database', 'Kumar', 450, 20, 2021),
(4, 'English Grammar', 'Education', 'Divya', 300, 12, 2019),
(5, 'MySQL Guide', 'Database', 'Rahul', 700, 8, 2023);

SELECT * FROM books1;


-- IN--
DELIMITER //
CREATE PROCEDURE get_ALemployees1()
BEGIN
    SELECT * FROM books1;
END //
DELIMITER ;

CALL get_ALemployees1();


DELIMITER //
CREATE PROCEDURE get_ALemployees1bookname()
BEGIN
    SELECT book_name FROM books1;
END //
DELIMITER ;
CALL get_ALemployees1bookname();

DELIMITER //
CREATE PROCEDURE employeescatbasebooks(IN cat VARCHAR(50))
BEGIN
    SELECT  * FROM books1
    WHERE category=cat;
END //
DELIMITER ;
CALL employeescatbasebooks('programming');

DELIMITER //
CREATE PROCEDURE employeesautbasebooks(IN aut VARCHAR(50))
BEGIN
    SELECT  * FROM books1
    WHERE author=aut;
END //
DELIMITER ;
CALL employeesautbasebooks('Priya');


DELIMITER //
CREATE PROCEDURE employeesgreater_amount(IN min_price DECIMAL(10,2))
BEGIN
    SELECT  * FROM books1
    WHERE price> min_price;
END //
DELIMITER ;
CALL employeesgreater_amount (500);



DELIMITER //
CREATE PROCEDURE getBooksByYear(IN year INT)
BEGIN
    SELECT book_name FROM books1
    WHERE published_year>year;
END //
DELIMITER ;
CALL  getBooksByYear (2022);

-- OUT--
DELIMITER //
CREATE PROCEDURE getBookByCate (IN cat VARCHAR(50),
OUT total INT)
BEGIN
   SELECT count(*) INTO total FROM books1
   WHERE category=cat;
 END   //
DELIMITER ; 
CALL getBookByCate('Programming', @total);
SELECT @total;

DELIMITER //
CREATE PROCEDURE getBookByquant (IN cat VARCHAR(50),
OUT total INT)
BEGIN
   SELECT sum(quantity) INTO total FROM books1
   WHERE category=cat;
 END   //
DELIMITER ; 
CALL getBookByquant('programming', @total);
SELECT @total;


DELIMITER //
CREATE PROCEDURE getAvgPrice (IN cat VARCHAR(50),
OUT total INT)
BEGIN
   SELECT avg(price) INTO total FROM books1
   WHERE category=cat;
 END   //
DELIMITER ; 
CALL getAvgPrice('programming', @total);
SELECT @total;



-- INOUT--

DELIMITER //
CREATE PROCEDURE IncreasePrice(INOUT price decimal(10,2))
BEGIN
     set price=price+100;
END //
DELIMITER ;
set @price=500;
CALL IncreasePrice(@price);
SELECT @price;


DELIMITER //
CREATE PROCEDURE IncreaseQuant(INOUT quan INT)
BEGIN
     set quan=quan+10;
END //
DELIMITER ;
set @quantity=21;
CALL IncreaseQuant(@quantity);
SELECT @quantity;
















   












