-- Setup DataBase for Clients
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) ,
  date_of_birth DATE ,
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP ,
  patient_id INT FOREIGN KEY REFERENCES patients(id),
  status VARCHAR(50),
);


CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(10,2) ,
  generate_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT FOREIGN KEY REFERENCES medical_histories(id),
);


CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(10,2),
  quantity INT,
  total_amount DECIMAL(10,2),
  invoice_id INT FOREIGN KEY REFERENCES invoices(id),
  treatment_id INT FOREIGN KEY REFERENCES treatments(id),
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100),
  PRIMARY KEY (id)
);

-- Join table for treatment histories (many-to-many)
CREATE TABLE medical_treatment_history (
  id SERIAL PRIMARY KEY,
  medical_histories_id INT FOREIGN KEY REFERENCES medical_histories(id),
  treatment_id INT FOREIGN KEY REFERENCES treatments(id),
);

CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoice_items(invoice_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON invoice_items(treatment_id);
CREATE INDEX ON medical_treatment_history(treatment_id);
CREATE INDEX ON medical_treatment_history(medical_histories_id);