CREATE DATABASE /*!32312 IF NOT EXISTS*/`company` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `company`;



/*Table structure for table `employee` */
CREATE TABLE employee 
 (fname		VARCHAR(12),
  minit		CHAR(1),
  lname		VARCHAR(12),
  ssn		CHAR(9) NOT NULL,
  bdate		DATE,
  address	VARCHAR(27),
  sex		CHAR(1),
  salary	INTEGER(7) NOT NULL,
  superssn	CHAR(9),
  CONSTRAINT pk_ssn PRIMARY KEY (ssn));

ALTER TABLE employee ADD (dno INTEGER(2) NOT NULL);

INSERT INTO employee VALUES ('John', 'B', 'Smith', '123456789', 
'1955-09-01', '731 Fondren, Houston, TX', 'M', 30000, '333445555',5);
INSERT INTO employee VALUES ('Franklin', 'T', 'Wong', '333445555', 
'1945-12-09', '638 Voss, Houston, TX', 'M', 40000, '888665555',5);
INSERT INTO employee VALUES ('Alicia', 'J', 'Zelaya', '999778888', 
'1958-07-19', '3321 Castle, Spring, TX', 'F', 25000, '987654321',4);
INSERT INTO employee VALUES ('Jennifer', 'S', 'Wallace', '987654321', 
'1931-06-20', '291 Berry, Bellaire, TX', 'F', 43000, '888665555',4);
INSERT INTO employee VALUES ('Ramesh', 'K', 'Narayan', '666884444', 
'1952-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555',5);
INSERT INTO employee VALUES ('Joyce', 'A', 'English', '453453453', 
'1962-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555',5);
INSERT INTO employee VALUES ('Ahmad', 'V', 'Jabbar', '987987987', 
'1959-03-29', '908 Dallas, Houston, TX', 'M', 25000, '987654321',4);
INSERT INTO employee VALUES ('James', 'E', 'Borg', '888665555', 
'1927-11-10', '450 Stone, Houston, TX', 'M', 55000, null,1);

/* Department Table */
CREATE TABLE department 
 (dname		VARCHAR(15) NOT NULL,
  dnumber	INTEGER(2) NOT NULL,
  mgrssn	CHAR(9) NOT NULL,
  mgrstartdate	DATE,
  CONSTRAINT pk_dnumber PRIMARY KEY (dnumber),
  CONSTRAINT fk_mgrssn FOREIGN KEY (mgrssn) REFERENCES employee (ssn));


INSERT INTO department VALUES ('Research',5 , '333445555', '1978-05-22');
INSERT INTO department VALUES ('Administration',4 , '987654321', '1985-01-01');
INSERT INTO department VALUES ('Headquarters', 1, '888665555', '1971-06-19');

ALTER TABLE employee ADD (CONSTRAINT fk_dno FOREIGN KEY (dno) REFERENCES department(dnumber));

/* Department Location Table */
CREATE TABLE dept_location 
 (dnumber	INTEGER(2) ,
  dlocation	VARCHAR(9),
  CONSTRAINT pk_num_loc PRIMARY key (dnumber, dlocation),
  CONSTRAINT fk_dnumber FOREIGN KEY (dnumber) REFERENCES department(dnumber));


INSERT INTO dept_location VALUES (1,'Houston');
INSERT INTO dept_location VALUES (4,'Stafford');
INSERT INTO dept_location VALUES (5,'Bellaire');
INSERT INTO dept_location VALUES (5,'Sugarland');
INSERT INTO dept_location VALUES (5,'Houston');

/* Project Table */
CREATE TABLE project
 (pname		VARCHAR(15),
  pnumber	INTEGER(2) NOT NULL,
  plocation	VARCHAR(15) ,
  dnum		INTEGER(2),
  CONSTRAINT pk_pnumber PRIMARY KEY (pnumber),
  CONSTRAINT fk_dnum FOREIGN KEY (dnum) REFERENCES department(dnumber));


INSERT INTO project VALUES ('ProductX', 1,'Bellaire',5);
INSERT INTO project VALUES ('ProductY', 2,'Sugarland',5);
INSERT INTO project VALUES ('ProductZ', 3,'Houston',5);
INSERT INTO project VALUES ('Computerization', 10,'Stafford',4);
INSERT INTO project VALUES ('Reorganization', 20,'Houston',1);
INSERT INTO project VALUES ('Newbenefits', 30,'Stafford',4);

/* Dependent Table */
CREATE TABLE dependent
 (essn	CHAR(9) NOT NULL,
  dependent_name VARCHAR(9) NOT NULL,
  sex		VARCHAR(1),
  bdate		DATE,
  relationship	VARCHAR(8),
  CONSTRAINT pk_essn PRIMARY KEY (essn, dependent_name),
  CONSTRAINT fk_essn FOREIGN KEY (essn) REFERENCES employee(ssn) ON DELETE CASCADE);


INSERT INTO dependent VALUES ('333445555','Alice', 'F','1976-04-05','Daughter');
INSERT INTO dependent VALUES ('333445555','Theodore', 'M','1973-10-10','Son');
INSERT INTO dependent VALUES ('333445555','Joy', 'F','1948-05-03','Spouse');
INSERT INTO dependent VALUES ('987654321','Abner', 'M','1932-02-29','Spouse');
INSERT INTO dependent VALUES ('123456789','Michael', 'M','1978-01-01','Son');
INSERT INTO dependent VALUES ('123456789','Alice', 'M','1978-12-31','Daughter');
INSERT INTO dependent VALUES ('123456789','Elizabeth', 'F','1957-05-05','Spouse');

/* Works on Table */
CREATE TABLE works_on
 (essn	CHAR(9) NOT NULL,
  pno	INTEGER(2) NOT NULL,
  hours	decimal (3,1),
  CONSTRAINT pk_essn_pno PRIMARY KEY (essn, pno),
  CONSTRAINT fk_pno FOREIGN KEY (pno) REFERENCES project(pnumber));


INSERT INTO works_on VALUES ('123456789',1,32.5);
INSERT INTO works_on VALUES ('123456789',2,7.5);
INSERT INTO works_on VALUES ('666884444',3,40.0);
INSERT INTO works_on VALUES ('453453453',1,20.0);
INSERT INTO works_on VALUES ('453453453',2,20.0);
INSERT INTO works_on VALUES ('333445555',2,10.0);
INSERT INTO works_on VALUES ('333445555',3,10.0);
INSERT INTO works_on VALUES ('333445555',10,10.0);
INSERT INTO works_on VALUES ('333445555',20,10.0);
INSERT INTO works_on VALUES ('999778888',30,30.0);
INSERT INTO works_on VALUES ('999778888',10,10.0);
INSERT INTO works_on VALUES ('987987987',10,35.0);
INSERT INTO works_on VALUES ('987987987',30,5.0);
INSERT INTO works_on VALUES ('987654321',30,20.0);
INSERT INTO works_on VALUES ('987654321',20,15.0);
INSERT INTO works_on VALUES ('888665555',20,null);



