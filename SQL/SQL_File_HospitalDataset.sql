BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "appointments" (
	"appointment_id"	INTEGER,
	"patient_id"	INTEGER NOT NULL,
	"doctor_id"	INTEGER NOT NULL,
	"appointment_date"	DATE,
	"appointment_time"	TIME,
	"appointment_status"	TEXT,
	PRIMARY KEY("appointment_id"),
	FOREIGN KEY("doctor_id") REFERENCES "doctors"("doctor_id"),
	FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
);
CREATE TABLE IF NOT EXISTS "billing" (
	"bill_id"	INTEGER,
	"encounter_id"	INTEGER,
	"total_amount"	DECIMAL(10, 2),
	"billing_date"	DATE,
	PRIMARY KEY("bill_id"),
	FOREIGN KEY("encounter_id") REFERENCES "encounters"("encounter_id")
);
CREATE TABLE IF NOT EXISTS "departments" (
	"department_id"	INTEGER,
	"department_name"	TEXT NOT NULL UNIQUE,
	"location"	TEXT,
	"head_of_department"	TEXT,
	PRIMARY KEY("department_id")
);
CREATE TABLE IF NOT EXISTS "doctors" (
	"doctor_id"	INTEGER,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"specialization"	TEXT,
	"phone"	TEXT,
	"email"	TEXT,
	"department_id"	INTEGER,
	"experience_years"	INTEGER,
	PRIMARY KEY("doctor_id"),
	FOREIGN KEY("department_id") REFERENCES "departments"("department_id")
);
CREATE TABLE IF NOT EXISTS "encounters" (
	"encounter_id"	INTEGER,
	"appointment_id"	INTEGER,
	"diagnosis"	TEXT,
	"consultation_notes"	TEXT,
	"consultation_duration"	INTEGER,
	PRIMARY KEY("encounter_id"),
	FOREIGN KEY("appointment_id") REFERENCES "appointments"("appointment_id")
);
CREATE TABLE IF NOT EXISTS "patients" (
	"patient_id"	INTEGER,
	"first_name"	TEXT NOT NULL,
	"last_name"	TEXT NOT NULL,
	"gender"	TEXT,
	"date_of_birth"	DATE,
	"phone"	TEXT,
	"email"	TEXT,
	"address"	TEXT,
	"blood_group"	TEXT,
	"registration_date"	DATE,
	PRIMARY KEY("patient_id")
);
CREATE TABLE IF NOT EXISTS "payments" (
	"payment_id"	INTEGER,
	"bill_id"	INTEGER,
	"payment_method"	TEXT,
	"payment_status"	TEXT,
	"payment_date"	DATE,
	"amount_paid"	DECIMAL(10, 2),
	PRIMARY KEY("payment_id"),
	FOREIGN KEY("bill_id") REFERENCES "billing"("bill_id")
);
CREATE TABLE IF NOT EXISTS "prescriptions" (
	"prescription_id"	INTEGER,
	"encounter_id"	INTEGER,
	"medicine_name"	TEXT,
	"dosage"	TEXT,
	"duration_days"	INTEGER,
	PRIMARY KEY("prescription_id"),
	FOREIGN KEY("encounter_id") REFERENCES "encounters"("encounter_id")
);
INSERT INTO "appointments" VALUES (1,1,1,'2026-07-01','09:00','Completed');
INSERT INTO "appointments" VALUES (2,2,2,'2026-07-02','09:00','Completed');
INSERT INTO "appointments" VALUES (3,3,3,'2026-07-03','09:00','Completed');
INSERT INTO "appointments" VALUES (4,4,4,'2026-07-04','09:00','Completed');
INSERT INTO "appointments" VALUES (5,5,5,'2026-07-05','09:00','Completed');
INSERT INTO "appointments" VALUES (6,6,6,'2026-07-06','09:00','Completed');
INSERT INTO "appointments" VALUES (7,7,7,'2026-07-07','09:00','Completed');
INSERT INTO "appointments" VALUES (8,8,8,'2026-07-08','09:00','Completed');
INSERT INTO "appointments" VALUES (9,9,9,'2026-07-09','09:00','Completed');
INSERT INTO "appointments" VALUES (10,10,10,'2026-07-10','09:00','Completed');
INSERT INTO "appointments" VALUES (11,11,1,'2026-07-11','09:00','Completed');
INSERT INTO "appointments" VALUES (12,12,2,'2026-07-12','09:00','Completed');
INSERT INTO "appointments" VALUES (13,13,3,'2026-07-13','09:00','Completed');
INSERT INTO "appointments" VALUES (14,14,4,'2026-07-14','09:00','Completed');
INSERT INTO "appointments" VALUES (15,15,5,'2026-07-15','09:00','Completed');
INSERT INTO "appointments" VALUES (16,16,6,'2026-07-16','09:00','Completed');
INSERT INTO "appointments" VALUES (17,17,7,'2026-07-17','09:00','Completed');
INSERT INTO "appointments" VALUES (18,18,8,'2026-07-18','09:00','Completed');
INSERT INTO "appointments" VALUES (19,19,9,'2026-07-19','09:00','Completed');
INSERT INTO "appointments" VALUES (20,20,10,'2026-07-20','09:00','Completed');
INSERT INTO "appointments" VALUES (21,21,1,'2026-07-21','09:00','Completed');
INSERT INTO "appointments" VALUES (22,22,2,'2026-07-22','09:00','Completed');
INSERT INTO "appointments" VALUES (23,23,3,'2026-07-23','09:00','Completed');
INSERT INTO "appointments" VALUES (24,24,4,'2026-07-24','09:00','Completed');
INSERT INTO "appointments" VALUES (25,25,5,'2026-07-25','09:00','Completed');
INSERT INTO "appointments" VALUES (26,26,6,'2026-07-26','09:00','Completed');
INSERT INTO "appointments" VALUES (27,27,7,'2026-07-27','09:00','Completed');
INSERT INTO "appointments" VALUES (28,28,8,'2026-07-28','09:00','Completed');
INSERT INTO "appointments" VALUES (29,29,9,'2026-07-01','09:00','Completed');
INSERT INTO "appointments" VALUES (30,30,10,'2026-07-02','09:00','Completed');
INSERT INTO "appointments" VALUES (31,1,1,'2026-07-03','09:00','Completed');
INSERT INTO "appointments" VALUES (32,2,2,'2026-07-04','09:00','Completed');
INSERT INTO "appointments" VALUES (33,3,3,'2026-07-05','09:00','Completed');
INSERT INTO "appointments" VALUES (34,4,4,'2026-07-06','09:00','Completed');
INSERT INTO "appointments" VALUES (35,5,5,'2026-07-07','09:00','Completed');
INSERT INTO "appointments" VALUES (36,6,6,'2026-07-08','09:00','Cancelled');
INSERT INTO "appointments" VALUES (37,7,7,'2026-07-09','09:00','Cancelled');
INSERT INTO "appointments" VALUES (38,8,8,'2026-07-10','09:00','Cancelled');
INSERT INTO "appointments" VALUES (39,9,9,'2026-07-11','09:00','Cancelled');
INSERT INTO "appointments" VALUES (40,10,10,'2026-07-12','09:00','Cancelled');
INSERT INTO "appointments" VALUES (41,11,1,'2026-07-13','09:00','No Show');
INSERT INTO "appointments" VALUES (42,12,2,'2026-07-14','09:00','No Show');
INSERT INTO "appointments" VALUES (43,13,3,'2026-07-15','09:00','No Show');
INSERT INTO "appointments" VALUES (44,14,4,'2026-07-16','09:00','No Show');
INSERT INTO "appointments" VALUES (45,15,5,'2026-07-17','09:00','No Show');
INSERT INTO "appointments" VALUES (46,16,6,'2026-07-18','09:00','Scheduled');
INSERT INTO "appointments" VALUES (47,17,7,'2026-07-19','09:00','Scheduled');
INSERT INTO "appointments" VALUES (48,18,8,'2026-07-20','09:00','Scheduled');
INSERT INTO "appointments" VALUES (49,19,9,'2026-07-21','09:00','Scheduled');
INSERT INTO "appointments" VALUES (50,20,10,'2026-07-22','09:00','Scheduled');
INSERT INTO "billing" VALUES (1,1,3000,'2026-07-01');
INSERT INTO "billing" VALUES (2,2,4000,'2026-07-02');
INSERT INTO "billing" VALUES (3,3,5000,'2026-07-03');
INSERT INTO "billing" VALUES (4,4,6000,'2026-07-04');
INSERT INTO "billing" VALUES (5,5,2000,'2026-07-05');
INSERT INTO "billing" VALUES (6,6,3000,'2026-07-06');
INSERT INTO "billing" VALUES (7,7,4000,'2026-07-07');
INSERT INTO "billing" VALUES (8,8,5000,'2026-07-08');
INSERT INTO "billing" VALUES (9,9,6000,'2026-07-09');
INSERT INTO "billing" VALUES (10,10,2000,'2026-07-10');
INSERT INTO "billing" VALUES (11,11,3000,'2026-07-11');
INSERT INTO "billing" VALUES (12,12,4000,'2026-07-12');
INSERT INTO "billing" VALUES (13,13,5000,'2026-07-13');
INSERT INTO "billing" VALUES (14,14,6000,'2026-07-14');
INSERT INTO "billing" VALUES (15,15,2000,'2026-07-15');
INSERT INTO "billing" VALUES (16,16,3000,'2026-07-16');
INSERT INTO "billing" VALUES (17,17,4000,'2026-07-17');
INSERT INTO "billing" VALUES (18,18,5000,'2026-07-18');
INSERT INTO "billing" VALUES (19,19,6000,'2026-07-19');
INSERT INTO "billing" VALUES (20,20,2000,'2026-07-20');
INSERT INTO "billing" VALUES (21,21,3000,'2026-07-21');
INSERT INTO "billing" VALUES (22,22,4000,'2026-07-22');
INSERT INTO "billing" VALUES (23,23,5000,'2026-07-23');
INSERT INTO "billing" VALUES (24,24,6000,'2026-07-24');
INSERT INTO "billing" VALUES (25,25,2000,'2026-07-25');
INSERT INTO "billing" VALUES (26,26,3000,'2026-07-26');
INSERT INTO "billing" VALUES (27,27,4000,'2026-07-27');
INSERT INTO "billing" VALUES (28,28,5000,'2026-07-28');
INSERT INTO "billing" VALUES (29,29,6000,'2026-07-01');
INSERT INTO "billing" VALUES (30,30,2000,'2026-07-02');
INSERT INTO "billing" VALUES (31,31,3000,'2026-07-03');
INSERT INTO "billing" VALUES (32,32,4000,'2026-07-04');
INSERT INTO "billing" VALUES (33,33,5000,'2026-07-05');
INSERT INTO "billing" VALUES (34,34,6000,'2026-07-06');
INSERT INTO "billing" VALUES (35,35,2000,'2026-07-07');
INSERT INTO "departments" VALUES (1,'Cardiology','Block A - Floor 2',NULL);
INSERT INTO "departments" VALUES (2,'Neurology','Block B - Floor 3',NULL);
INSERT INTO "departments" VALUES (3,'Orthopedics','Block C - Floor 1',NULL);
INSERT INTO "departments" VALUES (4,'Pediatrics','Block A - Floor 1',NULL);
INSERT INTO "departments" VALUES (5,'Emergency','Ground Floor',NULL);
INSERT INTO "doctors" VALUES (1,'Arjun','Mehta','Cardiologist','9000000001','arjun@hospital.com',1,12);
INSERT INTO "doctors" VALUES (2,'Neha','Kapoor','Cardiologist','9000000002','neha@hospital.com',1,8);
INSERT INTO "doctors" VALUES (3,'Rohan','Iyer','Neurologist','9000000003','rohan@hospital.com',2,10);
INSERT INTO "doctors" VALUES (4,'Priya','Nair','Neurologist','9000000004','priya@hospital.com',2,6);
INSERT INTO "doctors" VALUES (5,'Vikram','Singh','Orthopedic','9000000005','vikram@hospital.com',3,11);
INSERT INTO "doctors" VALUES (6,'Aisha','Verma','Orthopedic','9000000006','aisha@hospital.com',3,5);
INSERT INTO "doctors" VALUES (7,'Karan','Shah','Pediatrician','9000000007','karan@hospital.com',4,9);
INSERT INTO "doctors" VALUES (8,'Sana','Ali','Emergency','9000000008','sana@hospital.com',5,7);
INSERT INTO "doctors" VALUES (9,'Rahul','Joshi','Emergency','9000000009','rahul@hospital.com',5,4);
INSERT INTO "doctors" VALUES (10,'Meera','Patel','Emergency','9000000010','meera@hospital.com',5,13);
INSERT INTO "encounters" VALUES (1,1,'Diagnosis 1','Stable',16);
INSERT INTO "encounters" VALUES (2,2,'Diagnosis 2','Stable',17);
INSERT INTO "encounters" VALUES (3,3,'Diagnosis 3','Stable',18);
INSERT INTO "encounters" VALUES (4,4,'Diagnosis 4','Stable',19);
INSERT INTO "encounters" VALUES (5,5,'Diagnosis 5','Stable',20);
INSERT INTO "encounters" VALUES (6,6,'Diagnosis 6','Stable',21);
INSERT INTO "encounters" VALUES (7,7,'Diagnosis 7','Stable',22);
INSERT INTO "encounters" VALUES (8,8,'Diagnosis 8','Stable',23);
INSERT INTO "encounters" VALUES (9,9,'Diagnosis 9','Stable',24);
INSERT INTO "encounters" VALUES (10,10,'Diagnosis 10','Stable',25);
INSERT INTO "encounters" VALUES (11,11,'Diagnosis 11','Stable',26);
INSERT INTO "encounters" VALUES (12,12,'Diagnosis 12','Stable',27);
INSERT INTO "encounters" VALUES (13,13,'Diagnosis 13','Stable',28);
INSERT INTO "encounters" VALUES (14,14,'Diagnosis 14','Stable',29);
INSERT INTO "encounters" VALUES (15,15,'Diagnosis 15','Stable',15);
INSERT INTO "encounters" VALUES (16,16,'Diagnosis 16','Stable',16);
INSERT INTO "encounters" VALUES (17,17,'Diagnosis 17','Stable',17);
INSERT INTO "encounters" VALUES (18,18,'Diagnosis 18','Stable',18);
INSERT INTO "encounters" VALUES (19,19,'Diagnosis 19','Stable',19);
INSERT INTO "encounters" VALUES (20,20,'Diagnosis 20','Stable',20);
INSERT INTO "encounters" VALUES (21,21,'Diagnosis 21','Stable',21);
INSERT INTO "encounters" VALUES (22,22,'Diagnosis 22','Stable',22);
INSERT INTO "encounters" VALUES (23,23,'Diagnosis 23','Stable',23);
INSERT INTO "encounters" VALUES (24,24,'Diagnosis 24','Stable',24);
INSERT INTO "encounters" VALUES (25,25,'Diagnosis 25','Stable',25);
INSERT INTO "encounters" VALUES (26,26,'Diagnosis 26','Stable',26);
INSERT INTO "encounters" VALUES (27,27,'Diagnosis 27','Stable',27);
INSERT INTO "encounters" VALUES (28,28,'Diagnosis 28','Stable',28);
INSERT INTO "encounters" VALUES (29,29,'Diagnosis 29','Stable',29);
INSERT INTO "encounters" VALUES (30,30,'Diagnosis 30','Stable',15);
INSERT INTO "encounters" VALUES (31,31,'Diagnosis 31','Stable',16);
INSERT INTO "encounters" VALUES (32,32,'Diagnosis 32','Stable',17);
INSERT INTO "encounters" VALUES (33,33,'Diagnosis 33','Stable',18);
INSERT INTO "encounters" VALUES (34,34,'Diagnosis 34','Stable',19);
INSERT INTO "encounters" VALUES (35,35,'Diagnosis 35','Stable',20);
INSERT INTO "patients" VALUES (1,'Patient1','Test','Male','1981-01-15','9800000001','patient1@mail.com','City 1','O+','2026-06-02');
INSERT INTO "patients" VALUES (2,'Patient2','Test','Female','1982-01-15','9800000002','patient2@mail.com','City 2','O+','2026-06-03');
INSERT INTO "patients" VALUES (3,'Patient3','Test','Male','1983-01-15','9800000003','patient3@mail.com','City 3','O+','2026-06-04');
INSERT INTO "patients" VALUES (4,'Patient4','Test','Female','1984-01-15','9800000004','patient4@mail.com','City 4','O+','2026-06-05');
INSERT INTO "patients" VALUES (5,'Patient5','Test','Male','1985-01-15','9800000005','patient5@mail.com','City 5','O+','2026-06-06');
INSERT INTO "patients" VALUES (6,'Patient6','Test','Female','1986-01-15','9800000006','patient6@mail.com','City 6','O+','2026-06-07');
INSERT INTO "patients" VALUES (7,'Patient7','Test','Male','1987-01-15','9800000007','patient7@mail.com','City 7','O+','2026-06-08');
INSERT INTO "patients" VALUES (8,'Patient8','Test','Female','1988-01-15','9800000008','patient8@mail.com','City 8','O+','2026-06-09');
INSERT INTO "patients" VALUES (9,'Patient9','Test','Male','1989-01-15','9800000009','patient9@mail.com','City 9','O+','2026-06-10');
INSERT INTO "patients" VALUES (10,'Patient10','Test','Female','1980-01-15','9800000010','patient10@mail.com','City 10','O+','2026-06-11');
INSERT INTO "patients" VALUES (11,'Patient11','Test','Male','1981-01-15','9800000011','patient11@mail.com','City 11','O+','2026-06-12');
INSERT INTO "patients" VALUES (12,'Patient12','Test','Female','1982-01-15','9800000012','patient12@mail.com','City 12','O+','2026-06-13');
INSERT INTO "patients" VALUES (13,'Patient13','Test','Male','1983-01-15','9800000013','patient13@mail.com','City 13','O+','2026-06-14');
INSERT INTO "patients" VALUES (14,'Patient14','Test','Female','1984-01-15','9800000014','patient14@mail.com','City 14','O+','2026-06-15');
INSERT INTO "patients" VALUES (15,'Patient15','Test','Male','1985-01-15','9800000015','patient15@mail.com','City 15','O+','2026-06-16');
INSERT INTO "patients" VALUES (16,'Patient16','Test','Female','1986-01-15','9800000016','patient16@mail.com','City 16','O+','2026-06-17');
INSERT INTO "patients" VALUES (17,'Patient17','Test','Male','1987-01-15','9800000017','patient17@mail.com','City 17','O+','2026-06-18');
INSERT INTO "patients" VALUES (18,'Patient18','Test','Female','1988-01-15','9800000018','patient18@mail.com','City 18','O+','2026-06-19');
INSERT INTO "patients" VALUES (19,'Patient19','Test','Male','1989-01-15','9800000019','patient19@mail.com','City 19','O+','2026-06-20');
INSERT INTO "patients" VALUES (20,'Patient20','Test','Female','1980-01-15','9800000020','patient20@mail.com','City 20','O+','2026-06-21');
INSERT INTO "patients" VALUES (21,'Patient21','Test','Male','1981-01-15','9800000021','patient21@mail.com','City 21','O+','2026-06-22');
INSERT INTO "patients" VALUES (22,'Patient22','Test','Female','1982-01-15','9800000022','patient22@mail.com','City 22','O+','2026-06-23');
INSERT INTO "patients" VALUES (23,'Patient23','Test','Male','1983-01-15','9800000023','patient23@mail.com','City 23','O+','2026-06-24');
INSERT INTO "patients" VALUES (24,'Patient24','Test','Female','1984-01-15','9800000024','patient24@mail.com','City 24','O+','2026-06-25');
INSERT INTO "patients" VALUES (25,'Patient25','Test','Male','1985-01-15','9800000025','patient25@mail.com','City 25','O+','2026-06-26');
INSERT INTO "patients" VALUES (26,'Patient26','Test','Female','1986-01-15','9800000026','patient26@mail.com','City 26','O+','2026-06-27');
INSERT INTO "patients" VALUES (27,'Patient27','Test','Male','1987-01-15','9800000027','patient27@mail.com','City 27','O+','2026-06-28');
INSERT INTO "patients" VALUES (28,'Patient28','Test','Female','1988-01-15','9800000028','patient28@mail.com','City 28','O+','2026-06-01');
INSERT INTO "patients" VALUES (29,'Patient29','Test','Male','1989-01-15','9800000029','patient29@mail.com','City 29','O+','2026-06-02');
INSERT INTO "patients" VALUES (30,'Patient30','Test','Female','1980-01-15','9800000030','patient30@mail.com','City 30','O+','2026-06-03');
INSERT INTO "payments" VALUES (1,1,'Cash','Paid','2026-07-01',3000);
INSERT INTO "payments" VALUES (2,2,'Card','Paid','2026-07-02',4000);
INSERT INTO "payments" VALUES (3,3,'Insurance','Paid','2026-07-03',5000);
INSERT INTO "payments" VALUES (4,4,'UPI','Paid','2026-07-04',6000);
INSERT INTO "payments" VALUES (5,5,'Cash','Paid','2026-07-05',2000);
INSERT INTO "payments" VALUES (6,6,'Card','Paid','2026-07-06',3000);
INSERT INTO "payments" VALUES (7,7,'Insurance','Paid','2026-07-07',4000);
INSERT INTO "payments" VALUES (8,8,'UPI','Paid','2026-07-08',5000);
INSERT INTO "payments" VALUES (9,9,'Cash','Paid','2026-07-09',6000);
INSERT INTO "payments" VALUES (10,10,'Card','Pending','2026-07-10',0);
INSERT INTO "payments" VALUES (11,11,'Insurance','Paid','2026-07-11',3000);
INSERT INTO "payments" VALUES (12,12,'UPI','Paid','2026-07-12',4000);
INSERT INTO "payments" VALUES (13,13,'Cash','Paid','2026-07-13',5000);
INSERT INTO "payments" VALUES (14,14,'Card','Paid','2026-07-14',6000);
INSERT INTO "payments" VALUES (15,15,'Insurance','Paid','2026-07-15',2000);
INSERT INTO "payments" VALUES (16,16,'UPI','Paid','2026-07-16',3000);
INSERT INTO "payments" VALUES (17,17,'Cash','Paid','2026-07-17',4000);
INSERT INTO "payments" VALUES (18,18,'Card','Paid','2026-07-18',5000);
INSERT INTO "payments" VALUES (19,19,'Insurance','Paid','2026-07-19',6000);
INSERT INTO "payments" VALUES (20,20,'UPI','Pending','2026-07-20',0);
INSERT INTO "payments" VALUES (21,21,'Cash','Paid','2026-07-21',3000);
INSERT INTO "payments" VALUES (22,22,'Card','Paid','2026-07-22',4000);
INSERT INTO "payments" VALUES (23,23,'Insurance','Paid','2026-07-23',5000);
INSERT INTO "payments" VALUES (24,24,'UPI','Paid','2026-07-24',6000);
INSERT INTO "payments" VALUES (25,25,'Cash','Paid','2026-07-25',2000);
INSERT INTO "payments" VALUES (26,26,'Card','Paid','2026-07-26',3000);
INSERT INTO "payments" VALUES (27,27,'Insurance','Paid','2026-07-27',4000);
INSERT INTO "payments" VALUES (28,28,'UPI','Paid','2026-07-28',5000);
INSERT INTO "payments" VALUES (29,29,'Cash','Paid','2026-07-01',6000);
INSERT INTO "payments" VALUES (30,30,'Card','Pending','2026-07-02',0);
INSERT INTO "payments" VALUES (31,31,'Insurance','Paid','2026-07-03',3000);
INSERT INTO "payments" VALUES (32,32,'UPI','Paid','2026-07-04',4000);
INSERT INTO "payments" VALUES (33,33,'Cash','Paid','2026-07-05',5000);
INSERT INTO "payments" VALUES (34,34,'Card','Paid','2026-07-06',6000);
INSERT INTO "payments" VALUES (35,35,'Insurance','Paid','2026-07-07',2000);
INSERT INTO "prescriptions" VALUES (1,1,'Medicine 1','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (2,1,'Medicine 2','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (3,2,'Medicine 3','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (4,2,'Medicine 4','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (5,3,'Medicine 5','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (6,3,'Medicine 6','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (7,4,'Medicine 7','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (8,4,'Medicine 8','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (9,5,'Medicine 9','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (10,5,'Medicine 10','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (11,6,'Medicine 11','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (12,6,'Medicine 12','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (13,7,'Medicine 13','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (14,7,'Medicine 14','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (15,8,'Medicine 15','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (16,8,'Medicine 16','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (17,9,'Medicine 17','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (18,9,'Medicine 18','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (19,10,'Medicine 19','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (20,10,'Medicine 20','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (21,11,'Medicine 21','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (22,11,'Medicine 22','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (23,12,'Medicine 23','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (24,12,'Medicine 24','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (25,13,'Medicine 25','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (26,13,'Medicine 26','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (27,14,'Medicine 27','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (28,14,'Medicine 28','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (29,15,'Medicine 29','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (30,15,'Medicine 30','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (31,16,'Medicine 31','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (32,16,'Medicine 32','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (33,17,'Medicine 33','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (34,17,'Medicine 34','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (35,18,'Medicine 35','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (36,18,'Medicine 36','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (37,19,'Medicine 37','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (38,19,'Medicine 38','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (39,20,'Medicine 39','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (40,20,'Medicine 40','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (41,21,'Medicine 41','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (42,21,'Medicine 42','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (43,22,'Medicine 43','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (44,22,'Medicine 44','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (45,23,'Medicine 45','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (46,23,'Medicine 46','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (47,24,'Medicine 47','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (48,24,'Medicine 48','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (49,25,'Medicine 49','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (50,25,'Medicine 50','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (51,26,'Medicine 51','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (52,27,'Medicine 52','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (53,28,'Medicine 53','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (54,29,'Medicine 54','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (55,30,'Medicine 55','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (56,31,'Medicine 56','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (57,32,'Medicine 57','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (58,33,'Medicine 58','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (59,34,'Medicine 59','1 tablet twice daily',7);
INSERT INTO "prescriptions" VALUES (60,35,'Medicine 60','1 tablet twice daily',7);
COMMIT;
