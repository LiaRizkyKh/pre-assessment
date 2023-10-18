CREATE DATABASE ultra_voucher;
USE ultra_voucher;
SHOW TABLES;

CREATE TABLE t_parent(
	parent_id INT NOT NULL PRIMARY KEY,
    parent_name VARCHAR(100) NOT NULL
);

SELECT * FROM t_parent;

CREATE TABLE t_child(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id INT,
    CONSTRAINT fk_parentid
		FOREIGN KEY (parent_id) references t_parent(parent_id)
);

SELECT * FROM t_child;

INSERT INTO t_parent
VALUES (2, "Ilham"),
		(3, "Irwan");
	
INSERT INTO t_child(name, parent_id)
VALUES ("Zaki", 2),
		("Ilham", null),
		("Irwan", 2),
		("Arka", 3);
        
SELECT id, name, parent_name
FROM t_child as c
LEFT JOIN t_parent as p on c.parent_id = p.parent_id;