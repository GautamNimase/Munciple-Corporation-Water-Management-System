
### 🏛 Municipal Corporation Water Management System  

This project is a **Municipal Corporation Water Management System** built using **Flask, MySQL, HTML, CSS, and JavaScript**. It helps manage water supply connections, billing, customer records, and meter readings efficiently.  



## 📌 Features  

✔️ **Customer Management** – Add, update, delete customer records  
✔️ **Billing System** – Generate, update, and manage water bills  
✔️ **Meter Reading** – Track and record water usage  
✔️ **Water Connection Management** – Approve or disconnect water supply  
✔️ **Employee Management** – Manage employee details  
✔️ **Water Source Management** – Track water sources and capacities  



## 🛠️ Tech Stack  

- **Back-end:** Python (Flask)  
- **Front-end:** HTML, CSS, JavaScript  
- **Database:** MySQL  



## 🗂️ Database Schema  

### 📋 Tables and Attributes  

| **Entity**         | **Attributes** |
|--------------------|---------------|
| **Customer**      | CustomerID, Name, Address, Phone, Email, ConnectionType |
| **Billing**       | BillID, CustomerID, BillDate, DueDate, Amount, Status |
| **MeterReading**  | ReadingID, CustomerID, ReadingDate, UnitsConsumed |
| **WaterConnection** | ConnectionID, CustomerID, ConnectionDate, Status |
| **Employee**      | EmployeeID, Name, Position, Phone, Email |
| **WaterSource**   | SourceID, SourceName, SourceType, Capacity, Location |



