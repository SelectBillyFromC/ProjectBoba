CREATE TABLE flavor (
	id INT NOT NULL,
    descript VARCHAR(255),
    price DECIMAL(13, 2),
    CONSTRAINT pk_flavor PRIMARY KEY (id) # Constraint naming is ignored in MySQL apparently.. Good practice for other SQL servers!
);

CREATE TABLE bobatea (
	id INT NOT NULL,
    topping_id INT NOT NULL, # Is this part of PK? We defined that boba tea may NOT have topping, but, this cannot be a null value. I can't believe the professor and we didn't catch this LOL
    flavor_id INT NOT NULL,
    descript VARCHAR(255),
    price DECIMAL(13, 2),
	CONSTRAINT pk_bobatea PRIMARY KEY (id, topping_id, flavor_id),
    FOREIGN KEY (topping_id) REFERENCES topping(id),
	FOREIGN KEY (flavor_id) REFERENCES falavor(id)
);

CREATE TABLE topping (
	id INT NOT NULL,
    descript VARCHAR(255),
    price INT
);

ALTER TABLE topping # ALTER table statement to create a PK and Constraint; Although, multiple ALTER statement in a single line is MySQL extension to standard SQL. (https://dev.mysql.com/doc/refman/5.6/en/alter-table.html)
	ADD PRIMARY KEY (id),
    ADD CONSTRAINT pk_topping PRIMARY KEY (id)
    # Add more ALTER as needed i.e. INDEX, AUTO_INCREMENT, DEFAULT... 
;

