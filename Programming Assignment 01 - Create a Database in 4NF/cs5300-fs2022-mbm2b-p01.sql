
CREATE TABLE MemberAmount (
  Level VARCHAR(15),
  Home_gym VARCHAR(64),
  Monthly_amount DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (Level, Home_gym)
  );

 CREATE TABLE Birth_Age (
  Birth_Date DATE,
  Age INT NOT NULL,
  PRIMARY KEY (Birth_Date)
  );

  CREATE TABLE Member_Details (
  Member_Id INT,
  Member_Name VARCHAR(32) NOT NULL,
  Address VARCHAR(64) NOT NULL,
  Birth_Date DATE NOT NULL,
  Level VARCHAR(15) NOT NULL,
  Member_standing VARCHAR(64) NOT NULL,
  Home_gym VARCHAR(64) NOT NULL,
  Balance_Amount DECIMAL(10,2) NOT NULL,
  Billing_Date DATE NOT NULL,
  Latest_Date DATE,
  Latest_Location VARCHAR(64),
  PRIMARY KEY (Member_Id),
  FOREIGN KEY (Birth_Date) REFERENCES Birth_Age(Birth_Date) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (Level, Home_gym) REFERENCES MemberAmount(Level, Home_gym) ON DELETE RESTRICT ON UPDATE RESTRICT
  );

CREATE TABLE Equipment_Warranty (
  manufacturer_name VARCHAR(32) NOT NULL,
  equipment_type VARCHAR(32) NOT NULL,
  purchase_day DATE,
  warrantydate DATE,
  warranty_status VARCHAR(64),
  PRIMARY KEY (manufacturer_name,equipment_type ,purchase_day,warrantydate)
  );


 CREATE TABLE Manufacturer_Support (
  manufacturer_name VARCHAR(32) NOT NULL,
  manufacturer_num CHAR(100) NOT NULL,
  PRIMARY KEY (manufacturer_name)
  );
  
  CREATE TABLE Equipments (
  manufacturer_name VARCHAR(32) NOT NULL,
  equipment_type VARCHAR(32) NOT NULL,
  equipment_quantity VARCHAR(32) NOT NULL,
  location VARCHAR(64) NOT NULL,
  purchase_day DATE,
  warrantydate DATE,
  PRIMARY KEY (manufacturer_name,equipment_type ,equipment_quantity,location,purchase_day),
  FOREIGN KEY (manufacturer_name) REFERENCES Manufacturer_Support(manufacturer_name) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (manufacturer_name,equipment_type ,purchase_day,warrantydate) REFERENCES Equipment_Warranty(manufacturer_name,equipment_type ,purchase_day,warrantydate) ON DELETE RESTRICT ON UPDATE CASCADE
  );

CREATE TABLE Services (
  service_name VARCHAR(64),
  service_location VARCHAR(64),
  level VARCHAR(15) NOT NULL,
  service_fee DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (service_name,service_location)
  );


CREATE TABLE Service_Rooms (
  service_name VARCHAR(32),
  service_location VARCHAR(64),
  room_no VARCHAR(16),
  PRIMARY KEY (service_name, service_location, room_no),
  FOREIGN KEY (service_name, service_location) REFERENCES Services(service_name, service_location) ON DELETE RESTRICT ON UPDATE RESTRICT
  );
INSERT INTO MemberAmount (Level, Home_gym, monthly_amount)
  VALUES ('Amateur', 'Downtown', 15.00);
INSERT INTO MemberAmount (Level, Home_gym, monthly_amount)
  VALUES ('Pro', 'Rolla', 25.00); 
INSERT INTO MemberAmount (Level, Home_gym, monthly_amount)
  VALUES ('Beginner', 'Downtown', 35.00); 
INSERT INTO MemberAmount (Level, Home_gym, monthly_amount)
  VALUES ('Pro', 'Downtown', 25.00); 
INSERT INTO MemberAmount (Level, Home_gym, monthly_amount)
  VALUES ('Beginner', 'Rolla', 35.00); 

INSERT INTO Birth_Age (Birth_Date, Age)
  VALUES ('2000-06-13', 22);
INSERT INTO Birth_Age (Birth_Date, Age)
  VALUES ('1995-03-12', 27);
INSERT INTO Birth_Age (Birth_Date, Age)
  VALUES ('1975-06-21', 47);
INSERT INTO Birth_Age (Birth_Date, Age)
  VALUES ('1983-01-08', 39);
INSERT INTO Birth_Age (Birth_Date, Age)
  VALUES ('2003-10-25', 20);

INSERT INTO Member_Details (Member_Id, member_Name, address, Birth_Date, Level, member_standing ,Home_gym, Balance_Amount, Billing_Date, Latest_Date, Latest_Location)
  VALUES (101, 'Nick', '1221 N Oak St, Rolla', '2000-06-13', 'Beginner','Good' ,'Downtown', 250.00, '2022-04-17', '2022-02-19', 'Rolla'); 
INSERT INTO Member_Details (Member_Id, member_Name, address, Birth_Date, Level, member_standing ,Home_gym, Balance_Amount, Billing_Date, Latest_Date, Latest_Location)
  VALUES (102, 'Sai', '100 N Pine St, Rolla', '1995-03-12', 'Pro','bad' ,'Downtown', 324.00, '2022-02-11', '2022-12-20', 'Downtown'); 
INSERT INTO Member_Details (Member_Id, member_Name, address, Birth_Date, Level, member_standing ,Home_gym, Balance_Amount, Billing_Date, Latest_Date, Latest_Location)
  VALUES (103, 'Ram', '1300 N Elm St, Rolla', '1975-06-21', 'Beginner','good' ,'Downtown', 80.00, '2022-01-19', '2022-06-18', 'Rolla'); 
INSERT INTO Member_Details (Member_Id, member_Name, address, Birth_Date, Level, member_standing ,Home_gym, Balance_Amount, Billing_Date, Latest_Date, Latest_Location)
  VALUES (104, 'Nick', '1230 N Elm St, Rolla', '1983-01-08', 'Pro','bad', 'Rolla', 205.00, '2022-08-29', '2022-05-25', 'Rolla'); 
INSERT INTO Member_Details (Member_Id, member_Name, address, Birth_Date, Level, member_standing ,Home_gym, Balance_Amount, Billing_Date, Latest_Date, Latest_Location)
  VALUES (105, 'Mike', '1701 N Cedar St, Rolla', '2003-10-25', 'Beginner','bad', 'Downtown', 320.00, '2022-04-26', '2022-08-13', 'Downtown');


INSERT INTO Manufacturer_Support (manufacturer_name, manufacturer_num) VALUES  ('Nautilus', '95734538975');
INSERT INTO Manufacturer_Support (manufacturer_name, manufacturer_num) VALUES  ('NordicTrack', '85734564131');
INSERT INTO Manufacturer_Support (manufacturer_name, manufacturer_num) VALUES  ('Scwhin', '65734987657');


INSERT INTO Equipment_Warranty (manufacturer_name, equipment_type, purchase_day, warrantydate, warranty_status) 
VALUES  ('Scwhin', 'Dumbells', '2020-06-11', '2025-06-11', 'Active');

INSERT INTO Equipment_Warranty (manufacturer_name, equipment_type, purchase_day, warrantydate, warranty_status) 
VALUES  ('Nautilus', 'Pull-up balls', '2018-06-11', '2022-03-27', 'Expired');

INSERT INTO Equipment_Warranty (manufacturer_name, equipment_type, purchase_day, warrantydate, warranty_status) 
VALUES  ('Scwhin', 'Exercise bikes', '2021-10-13', '2024-06-13', 'Active');

INSERT INTO Equipment_Warranty (manufacturer_name, equipment_type, purchase_day, warrantydate, warranty_status) 
VALUES  ('NordicTrack', 'Threadmill', '2020-06-11', '2022-08-19', 'Active');

INSERT INTO Equipment_Warranty (manufacturer_name, equipment_type, purchase_day, warrantydate, warranty_status) 
VALUES  ('NordicTrack', 'Barbells', '2017-06-19', '2022-06-11', 'Expired');

INSERT INTO Equipment_Warranty (manufacturer_name, equipment_type, purchase_day, warrantydate, warranty_status) 
VALUES  ('Nautilus', 'Threadmill', '2021-06-01', '2026-06-29', 'Active');


INSERT INTO Equipments (manufacturer_name, equipment_type, equipment_quantity, location, purchase_day, warrantydate) 
VALUES  ('NordicTrack', 'Threadmill', '15', 'Rolla', '2020-06-11', '2022-08-19');

INSERT INTO Equipments (manufacturer_name, equipment_type, equipment_quantity, location, purchase_day, warrantydate) 
VALUES  ('NordicTrack', 'Barbells', '100', 'Downtown', '2017-06-19', '2022-06-11');

INSERT INTO Equipments (manufacturer_name, equipment_type, equipment_quantity, location, purchase_day, warrantydate) 
VALUES  ('Scwhin', 'Dumbells', '30', 'Downtown','2020-06-11', '2025-06-11');

INSERT INTO Equipments (manufacturer_name, equipment_type, equipment_quantity, location, purchase_day, warrantydate) 
VALUES  ('Nautilus', 'Threadmill','10', 'Rolla', '2021-06-01', '2026-06-29');

INSERT INTO Equipments (manufacturer_name, equipment_type, equipment_quantity, location, purchase_day, warrantydate) 
VALUES  ('Nautilus', 'Pull-up balls','10', 'Downtown', '2018-06-11', '2022-03-27');

INSERT INTO Equipments (manufacturer_name, equipment_type, equipment_quantity, location, purchase_day, warrantydate) 
VALUES  ('Scwhin', 'Exercise bikes','10', 'Rolla', '2021-10-13', '2024-06-13');






INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('Diamond', 'Downtown', 'Amateur', '300');
INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('silver', 'Downtown', 'Beginner', '200');
INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('silver', 'Rolla', 'Beginner', '100');
INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('Platinum', 'Rolla', 'Pro', '600');
INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('Platinum', 'Downtown', 'Pro', '500');
INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('Diamond', 'Rolla', 'Amateur', '400');
INSERT INTO Services (service_name,service_location, level, service_fee) VALUES  ('gold', 'Rolla', 'Amateur', '400');

INSERT INTO Service_Rooms (service_name,service_location, room_no) VALUES  ('Diamond', 'Downtown', '12');
INSERT INTO Service_Rooms (service_name,service_location, room_no) VALUES  ('silver', 'Rolla', '13');
INSERT INTO Service_Rooms (service_name,service_location, room_no) VALUES  ('Platinum', 'Rolla', '14');
INSERT INTO Service_Rooms (service_name,service_location, room_no) VALUES  ('gold', 'Rolla', '13');
INSERT INTO Service_Rooms (service_name,service_location, room_no) VALUES  ('Diamond', 'Downtown', '14');

