/* 1 Step */
CREATE TABLE users (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address TEXT NOT NULL,
    fk_bookID INT DEFAULT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);
/* nach dem create von books wird ALTER TABLE ausgeführt 

FOREIGN KEY(fk_bookID) REFERENCES books(ID)

*/
/* 2 Step */
CREATE TABLE books (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(ID),
    title TEXT NOT NULL,
    author VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    lang VARCHAR(30),
    price DECIMAL (10, 2) DEFAULT NULL,
    pages INT UNSIGNED NOT NULL,
    purchase_date DATE DEFAULT NULL,
    gift BOOLEAN DEFAULT NULL,
    credit_card BOOLEAN DEFAULT NULL,
    cash BOOLEAN DEFAULT NULL 
);


/* 3 STEP */
CREATE TABLE users_books (
	ID INT NOT NULL AUTO_INCREMENT,
    fk_userID INT UNSIGNED NOT NULL,
    fk_bookID INT UNSIGNED NOT NULL,  
    PRIMARY KEY(ID)
);
/* für später ,
    INDEX (fk_userId),
    INDEX (fk_bookId),
    
    FOREIGN KEY (fk_userId)
    	REFERENCES users.ID,
    
    FOREIGN KEY (fk_bookId)
    	REFERENCES books.ID */

/* 4 STEP */
ALTER TABLE users
ADD CONSTRAINT fk_bookID
FOREIGN KEY (fk_bookID)
REFERENCES books (ID)
ON UPDATE CASCADE;