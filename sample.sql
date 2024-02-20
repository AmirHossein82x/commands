-- create database myMftDataBase;
CREATE TABLE User (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(319) UNIQUE
);

insert into User (first_name, last_name, email) values ('mohammad taha', 'abbasi', null);
insert into User (first_name, last_name, email) values ('sajad', 'barkhordari','sajad@gmail.com');
insert into User (first_name, last_name, email) values ('mohammad parsa', 'mohammadi', 'mohammadi@gmail.com');
insert into User (first_name, last_name, email) values ('danial', 'hazari', null);
insert into User (first_name, last_name, email) values ('kamyar', 'karimi', null);
select * from User;

CREATE TABLE City (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(120) NOT NULL
);

INSERT INTO City (title) VALUES ('gharchack');
INSERT INTO City (title) VALUES ('varamin');
INSERT INTO City (title) VALUES ('tehran');

select * from City;


CREATE TABLE Profile (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  age INT NOT NULL,
  phone_number VARCHAR(11),
  city_id INT,
 
  FOREIGN KEY (user_id) REFERENCES User(id),
  FOREIGN KEY (city_id) REFERENCES City(id)
);


INSERT INTO Profile (user_id, age, phone_number, city_id) VALUES (5, 16, NULL, 3);
INSERT INTO Profile (user_id, age, phone_number, city_id) VALUES (4, 16, NUll, 2);
INSERT INTO Profile (user_id, age, phone_number, city_id) VALUES (1, 16, '09301234567', 1);
INSERT INTO Profile (user_id, age, phone_number, city_id) VALUES (3, 16, '09124522134', 2);
INSERT INTO Profile (user_id, age, phone_number, city_id) VALUES (2, 16, '09333467898', 1);

-- select * from Profile join User on (Profile.user_id= User.id);

CREATE TABLE Category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(20) NOT NULL
);

INSERT INTO Category (title) VALUES ('sport');
INSERT INTO Category (title) VALUES ('shirt');
INSERT INTO Category (title) VALUES ('books');


CREATE TABLE Product (
  id INT PRIMARY KEY  AUTO_INCREMENT,
  category_id INT,
  title VARCHAR(20) NOT NULL,
  price INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES Category(id)
  

);

INSERT INTO Product (category_id, title, price) VALUES (3, 'literature', 2000);
INSERT INTO Product (category_id, title, price) VALUES (1, 'ball', 2000);
INSERT INTO Product (category_id, title, price) VALUES (2, 'long shirt', 4000);
INSERT INTO Product (category_id, title, price) VALUES (3, 'math', 2000);
INSERT INTO Product (category_id, title, price) VALUES (1, 'water bottle', 1000);
INSERT INTO Product (category_id, title, price) VALUES (1, 'sport shirt', 4000);
INSERT INTO Product (category_id, title, price) VALUES (2, 'shoes', 2000);
INSERT INTO Product (category_id, title, price) VALUES (2, 'tshirt', 4000);
INSERT INTO Product (category_id, title, price) VALUES (1, 'badminton', 5000);
INSERT INTO Product (category_id, title, price) VALUES (3, 'art', 3000);
INSERT INTO Product (category_id, title, price) VALUES (3, 'science', 1000);
INSERT INTO Product (category_id, title, price) VALUES (2, 'watch', 2000);


select * from Product;

CREATE TABLE `Order` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  profile_id INT,
  created DATE NOT NULL,
  status VARCHAR(3) NOT NULL,
  FOREIGN KEY (profile_id) REFERENCES Profile(id)

);


INSERT INTO `Order` (profile_id, created, status) VALUES (2, '2024-01-05', 'no');
INSERT INTO `Order` (profile_id, created, status) VALUES (1, '2022-10-12', 'yes');
INSERT INTO `Order` (profile_id, created, status) VALUES (4, '2022-03-14', 'yes');
INSERT INTO `Order` (profile_id, created, status) VALUES (3, '2024-04-04', 'no');
INSERT INTO `Order` (profile_id, created, status) VALUES (3, '2024-07-02', 'yes');


CREATE TABLE OrderItem (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  price INT,
  FOREIGN KEY (order_id) REFERENCES `Order`(id),
  FOREIGN KEY (product_id) REFERENCES Product(id)
  
  
);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (1, 2, 3, 6000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (1, 1, 1, 2000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (1, 9, 1, 5000);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (2, 5, 1, 1000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (2, 7, 2, 4000);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (3, 12, 4, 8000);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (4, 6, 3, 12000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (4, 8, 1, 4000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (4, 9, 2, 10000);

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (5, 2, 3, 6000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (5, 1, 1, 2000);
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (5, 9, 1, 5000);


SELECT COUNT(*)
FROM `Order` AS p
JOIN OrderItem ON p.id = OrderItem.order_id group by (order_id);

