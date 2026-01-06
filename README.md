# 📊 Telecom Customer Churn Analysis Dashboard

An end-to-end analytical project built in **Power BI** to understand customer churn behavior across demographic, geographic, service usage, and account attributes for a telecom company.

---

## 🧠 Problem Statement

Customer churn is a major concern for telecom companies.  
This project analyzes churn drivers using historical customer data to identify:
- who is leaving,
- why they are leaving,
- which services, plans, and customer segments are most affected.

The goal is to provide an **interactive decision-support dashboard** for business stakeholders.

---

## 🗂 Project Structure

.
├── Customer_data_main.csv
├── Insights.pdf
└── README.md


---

## 🧾 Dataset Overview

**File:** `Customer_data_main.csv`  
**Records:** 6,418 customers  
**Features:** 32 columns

### Key Columns

| Category | Columns |
|--------|---------|
Customer Info | `Customer_ID`, `Gender`, `Age`, `Married`, `State`, `Tenure_in_Months`
Account | `Contract`, `Payment_Method`, `Monthly_Charge`
Services | `Internet_Type`, `Streaming_TV`, `Streaming_Movies`, `Streaming_Music`, `Phone_Service`, `Unlimited_Data`, etc.
Churn | `Customer_Status`, `Churn_Category`, `Churn_Reason`

---

## 🧩 Data Preparation

Performed using **Power Query**:

- Data type validation and normalization  
- Handling missing values  
- Created calculated column for charge segmentation:

---

📐 Dashboard Layout & Visuals

Total Customers

Churned Customers

New Joiners

Churn Rate


Analysis Panels

Demographic: Gender churn, age group analysis

Account Info: Contract, Payment method, Tenure

Geographic: State-wise churn

Churn Distribution: Churn categories & reasons

Services Used: Service adoption vs churn

Visual Types Used

Donut charts

Stacked bar & line combo charts

Horizontal bar charts

Matrix tables




🧰 Slicer & Interaction Architecture

Slicers:

Gender

Monthly Charge Range

---

🛠 Tools Used

MySQL
Power BI Desktop
DAX
Power Query (M)
Microsoft Excel / CSV
