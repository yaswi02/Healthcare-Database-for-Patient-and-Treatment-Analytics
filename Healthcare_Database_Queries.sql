CREATE DATABASE HealthcareAnalytics;
USE HealthcareAnalytics;
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    contact VARCHAR(15),
    address VARCHAR(100),
    condition_id INT
);
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    experience_years INT,
    contact VARCHAR(15)
);
CREATE TABLE Diagnoses (
    condition_id INT PRIMARY KEY,
    condition_name VARCHAR(50),
    severity VARCHAR(20),
    description TEXT
);
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    condition_id INT,
    doctor_id INT,
    treatment_type VARCHAR(50),
    treatment_date DATE,
    outcome VARCHAR(20),
    recovery_time INT,
    FOREIGN KEY (condition_id) REFERENCES Diagnoses(condition_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    purpose VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
-- Insert into Patients table
INSERT INTO Patients (patient_id, name, age, gender, contact, address, condition_id)
VALUES (1, 'John Doe', 34, 'M', '1234567890', '123 Main St', 1);

-- Insert into Doctors table
INSERT INTO Doctors (doctor_id, name, specialization, experience_years, contact)
VALUES (1, 'Dr. Smith', 'Cardiology', 10, '9876543210');

-- Insert into Diagnoses table
INSERT INTO Diagnoses (condition_id, condition_name, severity, description)
VALUES (1, 'Hypertension', 'Moderate', 'High blood pressure condition');

-- Insert into Treatments table
INSERT INTO Treatments (treatment_id, condition_id, doctor_id, treatment_type, treatment_date, outcome, recovery_time)
VALUES (1, 1, 1, 'Medication', '2024-01-10', 'Recovered', 30);

-- Insert into Appointments table
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, purpose, status)
VALUES (1, 1, 1, '2024-01-05', 'Consultation', 'Completed');
INSERT INTO Diagnoses (condition_id, condition_name, severity, description)
VALUES (1, 'Hypertension', 'Moderate', 'High blood pressure condition');
INSERT INTO Doctors (doctor_id, name, specialization, experience_years, contact)
VALUES (1, 'Dr. Smith', 'Cardiology', 10, '9876543210');
INSERT INTO Patients (patient_id, name, age, gender, contact, address, condition_id)
VALUES (1, 'John Doe', 34, 'M', '1234567890', '123 Main St', 1);
INSERT INTO Treatments (treatment_id, condition_id, doctor_id, treatment_type, treatment_date, outcome, recovery_time)
VALUES (1, 1, 1, 'Medication', '2024-01-10', 'Recovered', 30);
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, purpose, status)
VALUES (1, 1, 1, '2024-01-05', 'Consultation', 'Completed');
SELECT treatment_type, AVG(recovery_time) AS avg_recovery_time
FROM Treatments
GROUP BY treatment_type;
SELECT d.condition_name, COUNT(p.patient_id) AS patient_count
FROM Patients p
JOIN Diagnoses d ON p.condition_id = d.condition_id
GROUP BY d.condition_name;
SELECT doc.name AS doctor_name, AVG(t.recovery_time) AS avg_recovery_time
FROM Treatments t
JOIN Doctors doc ON t.doctor_id = doc.doctor_id
GROUP BY doc.name;
SELECT p.name AS patient_name, a.appointment_date, d.name AS doctor_name, a.purpose
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;
