use spring;
DROP TABLE IF EXISTS files;
CREATE TABLE IF NOT EXISTS files(
	no INT AUTO_INCREMENT PRIMARY KEY,
    file2 VARCHAR(100),
    bbs_no INT NOT NULL,
    CONSTRAINT files_fk FOREIGN KEY(bbs_no) REFERENCES springbbs(no) 
);


INSERT INTO files(file2, bbs_no) VALUES('TEST.JPG', 512);

SELECT * FROM files;