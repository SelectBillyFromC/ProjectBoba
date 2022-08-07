/*
* CS579 Database Management
* Summer 2022
* Project Boba Physical Design
*/

CREATE TABLE flavor (
	id INT NOT NULL,
    descript VARCHAR(255),
    price DECIMAL(13, 2),
    CONSTRAINT pk_flavor PRIMARY KEY (id) # Constraint naming is ignored in MySQL apparently.. Good practice for other SQL servers!
);

CREATE TABLE topping (
	id INT,
    descript VARCHAR(255),
    price INT
);

ALTER TABLE topping # ALTER table statement to create a PK and Constraint; Although, multiple ALTER statement in a single line is MySQL extension to standard SQL. (https://dev.mysql.com/doc/refman/5.6/en/alter-table.html)
    ADD CONSTRAINT pk_topping PRIMARY KEY (id)
    # Add more ALTER as needed i.e. INDEX, AUTO_INCREMENT, DEFAULT... 
;

CREATE TABLE bobatea (
	id INT NOT NULL,
    topping_id INT NOT NULL, # Is this part of PK? We defined that boba tea may NOT have topping, but, this cannot be a null value. I can't believe the professor and we didn't catch this LOL
    flavor_id INT NOT NULL,
    descript VARCHAR(255),
    price DECIMAL(13, 2),
	CONSTRAINT pk_bobatea PRIMARY KEY (id, topping_id, flavor_id),
    FOREIGN KEY (topping_id) REFERENCES topping(id),
	FOREIGN KEY (flavor_id) REFERENCES flavor(id)
);

CREATE TABLE customer (
	id INT PRIMARY KEY,
    add_strt1 VARCHAR(255) NOT NULL,
    add_strt2 VARCHAR(255),
    add_city VARCHAR(255) NOT NULL,
    add_st VARCHAR(255) NOT NULL,	# State is two alphabet, we should set rules with all 50 states?
    add_zip INT NOT NULL,	# Formatted 5 digit int? or char?
    tel VARCHAR(255),	# Tel number is also formatted as 11 digits. We should enforce rules?
    prefer VARCHAR(255), # Should this refer to boba tea?
    CONSTRAINT chk_cust_tel CHECK (tel NOT LIKE'%[^0-9]%')
);

CREATE TABLE transactions (
	id INT PRIMARY KEY,
    tea_id INT NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (tea_id, price) REFERENCES bobatea(id, price)
);

CREATE TABLE shop (
	id INT PRIMARY KEY,
    add_strt1 VARCHAR(255) NOT NULL,
    add_strt2 VARCHAR(255),
    add_city VARCHAR(255) NOT NULL,
    add_st VARCHAR(255) NOT NULL,	# State is two alphabet, we should set rules with all 50 states?
    add_zip INT NOT NULL,	# Formatted 5 digit int? or char?
    tel VARCHAR(255),	# Tel number is also formatted as 11 digits. We should enforce rules?
    # Let's get rid of OwnedOrRent
	CONSTRAINT chk_shop_tel CHECK (tel NOT LIKE'%[^0-9]%')
);

CREATE TABLE inventory (
	id INT PRIMARY KEY,
    shop_id INT NOT NULL,	# Shop has ONE inventory, inventory has ONE shop. 1-1 Relationship, but decided against merging table.
	FOREIGN KEY (shop_id) REFERENCES shop(id),
    amount INT
);

##### In MySQL, there is no implementation of sub/supertype.
# We can either create 2 separate tables or one table with type of employment.
# https://stackoverflow.com/questions/3579079/how-can-you-represent-inheritance-in-a-database/3579462#3579462

# For now, I will take the 'Concrete Table Inheritance' approach mentioned in the stack overflow post.
CREATE TABLE staff_emp (
	id INT PRIMARY KEY,
    age INT NOT NULL,
	add_strt1 VARCHAR(255) NOT NULL,
    add_strt2 VARCHAR(255),
    add_city VARCHAR(255) NOT NULL,
    add_st VARCHAR(255) NOT NULL,	# State is two alphabet, we should set rules with all 50 states?
    add_zip INT NOT NULL,	# Formatted 5 digit int? or char?
    tel VARCHAR(255),	# Tel number is also formatted as 11 digits. We should enforce rules?
    title VARCHAR(255),
    hr_rate INT,
    shop_id INT NOT NULL,	# Based on Prof's Comment
    FOREIGN KEY (shop_id) REFERENCES shop(id),
	CONSTRAINT chk_emp_tel CHECK (tel NOT LIKE'%[^0-9]%')
);

CREATE TABLE staff_mgr (
	id INT PRIMARY KEY,
    age INT NOT NULL,
	add_strt1 VARCHAR(255) NOT NULL,
    add_strt2 VARCHAR(255),
    add_city VARCHAR(255) NOT NULL,
    add_st VARCHAR(255) NOT NULL,	# State is two alphabet, we should set rules with all 50 states?
    add_zip INT NOT NULL,	# Formatted 5 digit int? or char?
    tel VARCHAR(255),	# Tel number is also formatted as 11 digits. We should enforce rules?
    title VARCHAR(255),
    salary INT,
	shop_id INT NOT NULL,	# Based on Prof's Comment
    FOREIGN KEY (shop_id) REFERENCES shop(id),
    CONSTRAINT chk_mgr_tel CHECK (tel NOT LIKE'%[^0-9]%')
);

CREATE TABLE ingredient (
	id INT PRIMARY KEY,
    descript VARCHAR(255) UNIQUE, # probably should be unique
    unitprice INT NOT NULL
);

CREATE TABLE inv_ing (
	ing_id INT,
    inv_id INT,
    PRIMARY KEY (ing_id, inv_id),
    FOREIGN KEY (ing_id) REFERENCES ingredient(id),
	FOREIGN KEY (inv_id) REFERENCES inventory(id)
);

CREATE TABLE shop_boba (
	shop_id INT,
    boba_id INT,
    PRIMARY KEY (shop_id, boba_id),
    FOREIGN KEY (shop_id) REFERENCES shop(id),
    FOREIGN KEY (boba_id) REFERENCES bobatea(id)
);

# Based on professor's comment
CREATE TABLE cust_trans (
	cust_id INT,
    trans_id INT,
    PRIMARY KEY (cust_id, trans_id),
    FOREIGN KEY (cust_id) REFERENCES customer(id),
    FOREIGN KEY (trans_id) REFERENCES transactions(id)
);

# Based on professor's comment
CREATE TABLE shop_trans (
	shop_id INT,
    trans_id INT,
    PRIMARY KEY (shop_id, trans_id),
    FOREIGN KEY (shop_id) REFERENCES shop(id),
    FOREIGN KEY (trans_id) REFERENCES transactions(id)
);
