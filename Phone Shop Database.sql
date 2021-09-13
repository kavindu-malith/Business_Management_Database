CREATE DATABASE Indika_Phoneshop;

CREATE TABLE Customer(
		CID       VARCHAR(20) PRIMARY KEY,
		Cont_NO   VARCHAR(10),
		FName     VARCHAR(20),
		LName     VARCHAR(20),
		Shop	  VARCHAR(30)
		);
		

CREATE TABLE Reservation(
		RID		        VARCHAR(10) PRIMARY KEY,
		Function_Date   Date,
		CID             VARCHAR(20),
		CONSTRAINT FK_CID FOREIGN KEY(CID)
				   REFERENCES Customer
		);
		

CREATE TABLE Employee(
		EmpID			VARCHAR(20) PRIMARY KEY,
		Fname			VARCHAR(30),
		Lname			VARCHAR(30),
		Salary          INT,
		DOB				DATE,
		Tele_No			VARCHAR(10),
		WID				CHAR(12),
		MID				CHAR(12),
		Worker			BIT,
		Manager			BIT
		);
		
CREATE TABLE Supplier(
		SID            VARCHAR(20) PRIMARY KEY,
		SName          VARCHAR(30),
		EmpID          VARCHAR(20),
		CONSTRAINT FK_Supplier FOREIGN KEY(EmpID)
				   REFERENCES Employee
	    );


CREATE TABLE Item(
		Icode		   VARCHAR(20) PRIMARY KEY,
		IName          VARCHAR(30),
		IPrice		   INT,
		SID            VARCHAR(20),
		CONSTRAINT FK_SID FOREIGN KEY(SID)
				  REFERENCES Supplier
		);
		

CREATE TABLE Reservation_Item(
		RID             VARCHAR(10),
		Icode			VARCHAR(20),
		PRIMARY KEY(RID,Icode),
		CONSTRAINT FK_Icode FOREIGN KEY(Icode)
		           REFERENCES Item,
		CONSTRAINT FK_RID FOREIGN KEY(RID)
				   REFERENCES Reservation
		);
		

CREATE TABLE Invoice(
		INO         VARCHAR(20) PRIMARY KEY,
		Amount      INT,
		IDate       DATE,
		RID        VARCHAR(10),
		CONSTRAINT FK_Invoice FOREIGN KEY(RID)
				   REFERENCES  Reservation
		);
		

CREATE TABLE Supplier_MobileNO(
		SID		VARCHAR(20) REFERENCES Supplier,
		Mob_NO  VARCHAR(10),
		);

	


CREATE TABLE PAY(
		INO     VARCHAR(20) REFERENCES Invoice,
		CID     VARCHAR(20) REFERENCES Customer,
		EmpID   VARCHAR(20) REFERENCES Employee,
		);
		
		
		INSERT INTO Customer values ('C0001','0712345636','Saman','Kumara','Indika phone shop'),
									('C0002','0705865285','Nimal','Deneth','Indika phone shop'),
									('C0003','0769655556','Kavindu','Malith','Indika phone shop'),
									('C0004','0725695236','Pragathi','Darshana','Indika phone shop'),
									('C0005','0789922396','Harsha','Darmasena','Indika phone shop'),
									('C0006','0712345636','Charana','Disanayaka','Indika phone shop'),
									('C0007','0777565556','Senura','Bhawantha','Indika phone shop'),
									('C0008','0783265656','Anuka','Dilshan','Indika phone shop'),
									('C0009','0726545455','Amarabandu','Rupasinghe','Indika phone shop'),
									('C0010','0714825856','Nadeera','Max','Indika phone shop');

        INSERT INTO Reservation values  ('R0001',2019/03/12,'C0006'),
										('R0002',2019/03/13,'C0003'),
										('R0003',2019/03/14,'C0002'),
										('R0004',2019/03/15,'C0008'),
										('R0005',2019/03/16,'C0005'),
										('R0006',2019/03/17,'C0001'),
										('R0007',2019/03/18,'C0007'),
										('R0008',2019/03/19,'C0004'),
										('R0009',2019/03/20,'C0009'),
										('R0010',2019/03/21,'C0010');

		INSERT INTO Employee values ('E0001','Kamal','Santha',30000.00,1995/12/05,'0725662158','W0001','M0001','True','True'),
									('E0002','Sunimal','Bandara',35000.00,1996/10/15,'0714566354','W0002','M0002','True','True'),
									('E0003','Kisal','Santha',40000.00,1993/02/08,'0753645656','W0003','Null','True','False'),
									('E0004','Sajith','Kumara',39000.00,1990/03/18,'0756566567','W0004','Null','True','False'),
									('E0005','Chanuka','Liyanagamage',41000.00,1998/11/09,'0753645698','W0005','Null','True','False');

		INSERT INTO Supplier values ('S0001','Jagath','E0001'),
									('S0002','Nimalasiri','E0002'),
									('S0003','Jayasiri','E0002'),
									('S0004','Sunpun','E0001'),
									('S0005','Edirisingha','E0002');

		INSERT INTO Item values ('I0001','Huawei',40000.00,'S0001'),
								('I0002','Huawei',45000.00,'S0001'),
								('I0003','Apple',100000.00,'S0002'),
								('I0004','Apple',150000.00,'S0002'),
								('I0005','1plus',48000.00,'S0003'),
								('I0006','1plus',56000.00,'S0003'),
								('I0007','Oppo',46500.00,'S0004'),
								('I0008','Oppo',51000.00,'S0004'),
								('I0009','Xiaomi',40000.00,'S0005'),
								('I0010','Xiaomi',40000.00,'S0005');

		INSERT INTO Reservation_Item values ('R0001','I0003'),
											('R0002','I0007'),
											('R0003','I0001'),
											('R0004','I0009'),
											('R0005','I0005'),
											('R0006','I0006'),
											('R0007','I0002'),
											('R0008','I0008'),
											('R0009','I0004'),
											('R0010','I0010');

		INSERT INTO Invoice values  ('INV0001',50000.00,2018/01/10,'R0001'),
									('INV0002',51000.00,2018/02/09,'R0002'),
									('INV0003',49000.00,2018/03/13,'R0003'),
									('INV0004',60000.00,2018/04/25,'R0004'),
									('INV0005',61000.00,2018/05/14,'R0005'),
									('INV0006',70000.00,2018/06/16,'R0006'),
									('INV0007',35000.00,2018/07/13,'R0007'),
									('INV0008',65000.00,2018/08/18,'R0008'),
									('INV0009',39000.00,2018/09/19,'R0009'),
									('INV0010',25000.00,2018/10/29,'R0010');

		INSERT INTO Supplier_MobileNO values('S0001','0715668555'),
											('S0002','0725665556'),
											('S0003','0762569552'),
											('S0004','0716552556'),
											('S0005','0783662525');

		INSERT INTO PAY values  ('INV0001','C0001','E0001'),
								('INV0002','C0002','E0001'),
								('INV0003','C0003','E0002'),
								('INV0004','C0004','E0002'),
								('INV0005','C0005','E0003'),
								('INV0006','C0006','E0003'),
								('INV0007','C0007','E0004'),
								('INV0008','C0008','E0004'),
								('INV0009','C0009','E0005'),
								('INV0010','C0010','E0005');

