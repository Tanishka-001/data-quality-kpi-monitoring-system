# Data Quality & Business KPI Monitoring System

## Executive Summary

The Data Quality & Business KPI Monitoring System is an end-to-end data analytics project that evaluates retail transaction data for quality issues, calculates an overall data quality score, monitors business KPIs, and detects unusual revenue patterns.

Using Python and Power BI, the project transforms 541,909 retail transaction records into data-quality metrics, daily business KPIs, anomaly alerts, and an interactive monitoring dashboard.

---

## Problem Statement

Poor-quality transactional data can affect the reliability of business reporting and decision-making.

This project focuses on identifying:

- Missing Customer IDs
- Duplicate InvoiceNo + StockCode records
- Invalid quantities
- Invalid unit prices
- Future invoice dates

It also monitors revenue and transaction volume and identifies unusual daily revenue values.

---

## Business Impact

The system helps analysts and business stakeholders:

- Identify major data-quality issues
- Quantify the impact of each issue
- Monitor overall data reliability
- Track revenue and transaction-volume trends
- Identify unusual revenue activity
- Investigate potential issues through an interactive dashboard

---

## Solution

The project follows an end-to-end workflow:

Raw Retail Data  
↓  
Data Quality Validation  
↓  
Data Quality Summary  
↓  
Failure Percentage Calculation  
↓  
Weighted Data Quality Score  
↓  
Daily Revenue & Transaction Volume  
↓  
Statistical Anomaly Detection  
↓  
Alert Log  
↓  
Power BI Dashboard

The final dashboard brings data-quality monitoring and business KPI monitoring together in one view.

---

## Methodology

### 1. Data Loading & Inspection

The dataset contains 541,909 records and 8 columns, including InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, and Country.

### 2. Data Quality Validation

Five checks were performed:

| Check | Failed Records |
|---|---:|
| Missing Customer ID | 135,080 |
| Duplicate InvoiceNo + StockCode records | 20,378 |
| Invalid Quantity | 1,336 |
| Invalid Unit Price | 2 |
| Future Invoice Dates | 0 |

### 3. Data Quality Scoring

A weighted scoring model was used with weights of 30%, 30%, 20%, 10%, and 10%.

The final calculated score was:

**91.343 / 100**

Displayed in Power BI as:

**91.34 / 100**

### 4. Business KPI Preparation

Revenue was calculated as:

`Revenue = Quantity × UnitPrice`

Daily revenue and transaction volume were then aggregated by date.

### 5. Revenue Anomaly Detection

Daily revenue was evaluated using a statistical threshold based on:

`Mean ± 2 × Standard Deviation`

Daily values were classified as:

- High Spike
- Sharp Drop
- Normal

The final dashboard shows **12 High Spike alerts**.

---

## Sample Output Table

### Data Quality Summary

| Issue Type | Failed Records | Failure Percentage |
|---|---:|---:|
| Missing Customer ID | 135,080 | 24.93% |
| Duplicate InvoiceNo + StockCode records | 20,378 | 3.76% |
| Invalid Quantity | 1,336 | 0.25% |
| Invalid Unit Price | 2 | 0.00% |
| Future Invoice Dates | 0 | 0.00% |

### Dashboard KPIs

| KPI | Value |
|---|---:|
| Total Revenue | 9.75M |
| Transaction Volume | 542K |
| Failure Rate | 25.69% |
| Data Quality Score | 91.34 / 100 |
| High Spike Alerts | 12 |

---

## Skills and Technologies

### Programming & Data Analysis
- Python
- Pandas
- NumPy
- Data Cleaning
- Data Validation
- Statistical Analysis

### Business Intelligence
- Power BI
- KPI Monitoring
- Interactive Dashboards
- Data Visualization
- Slicers and Filters

### Data Quality & Analytics
- Missing-value detection
- Duplicate detection
- Rule-based validation
- Data quality scoring
- Failure-rate analysis
- Revenue analysis
- Trend analysis
- Statistical anomaly detection

### Tools
- Google Colab
- Power BI
- GitHub

---

## Results

The project successfully processed 541,909 retail transaction records and identified multiple data-quality issues.

Key results include:

- **135,080** records with missing Customer IDs
- **20,378** duplicate InvoiceNo + StockCode records
- **1,336** invalid quantity records
- **2** invalid unit-price records
- **0** future-dated invoices
- **91.343 / 100** overall data quality score
- **9.75M** total revenue shown in the dashboard
- **542K** transaction volume shown in the dashboard
- **25.69%** average failure rate shown in the dashboard
- **12** High Spike revenue alerts

The resulting Power BI dashboard provides a consolidated view of data quality and business performance.

---

## Dashboard

The final Power BI dashboard contains:

### KPI Cards
- Total Revenue
- Transaction Volume
- Failure Rate
- Data Quality Score

### Trend Visualizations
- Daily Revenue Trend
- Transaction Volume Trend
- Failure Rate Trend

### Data Quality Analysis
- Failed Records by Issue Type

### Revenue Anomaly Monitoring
- High Spike alert count

### Interactive Filtering
- Date-range slicer

![Data Quality & Business KPI Monitoring Dashboard](images/dashboard.png)

---

## Python Notebook

The Python notebook contains the complete analytical workflow:

1. Loading libraries
2. Reading and inspecting the dataset
3. Missing-value checks
4. Duplicate InvoiceNo + StockCode checks
5. Invalid quantity checks
6. Invalid price checks
7. Future-date checks
8. Data quality summary
9. Weighted data quality score calculation
10. Daily revenue calculation
11. Transaction-volume calculation
12. Statistical threshold calculation
13. Revenue anomaly classification
14. Alert-log generation

The notebook generates the datasets used for the Power BI dashboard.

---

## Next Steps / Future Work

Potential improvements include:

- Automated scheduled data refresh
- Automated anomaly notifications
- Additional data-quality checks
- Historical data-quality score tracking
- More detailed revenue anomaly investigation
- Product- and customer-level KPI analysis
- Additional Power BI drill-through pages
- Automated reporting for stakeholders
