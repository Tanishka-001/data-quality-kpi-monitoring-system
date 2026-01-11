# Data Quality & Business KPI Monitoring System

## Executive Summary
This project implements an end-to-end **data quality and business KPI monitoring system** for transactional retail data.  
The system validates data, monitors KPIs, detects anomalies, and provides a **Power BI dashboard** for stakeholders.  
It demonstrates an applied analytics workflow similar to what is used in real business operations.

---

## Problem Statement
Organizations often rely on transactional data for decision-making, but poor data quality can lead to:

- Incorrect KPIs and misleading trends  
- Financial losses due to undetected anomalies  
- Inefficient operational responses  

This project addresses the need for **automated data validation and monitoring** to improve data reliability.

---

## Business Impact
- Provides a **single source of truth** for key business metrics  
- Identifies critical data quality issues early  
- Supports timely interventions for revenue anomalies  
- Improves stakeholder confidence in analytics outputs

---

## Solution
The project implements a **modular analytics pipeline**:

1. **Data Quality Checks (SQL/Python)**  
   - Missing values, duplicate invoices, invalid ranges, future dates  

2. **Data Quality Scoring**  
   - Weighted score combining impact of all failed checks  

3. **KPI Monitoring**  
   - Revenue, transaction volume, failure impact tracked daily  

4. **Anomaly Detection**  
   - Rule-based detection for revenue spikes and drops  

5. **Power BI Dashboard**  
   - Visualizes KPIs, data quality issues, and alerts  

---

## Methodology
1. **Data Cleaning & Validation**
   - Missing Customer IDs  
   - Duplicate invoice numbers  
   - Negative quantities and prices  
   - Future invoice dates  

2. **Data Quality Scoring**
   - Weighted failure impact applied:  
     - Missing Customer ID: 30%  
     - Duplicate Invoice Numbers: 30%  
     - Invalid Quantity: 20%  
     - Invalid Unit Price: 10%  
     - Future Invoice Dates: 10%  
   - Final score = 100 − Σ(weighted failure %)  

3. **KPI Calculation**
   - Revenue = Quantity × Unit Price  
   - Daily aggregation of revenue and transaction volume  

4. **Anomaly Detection**
   - Statistical thresholds (mean ± 2σ)  
   - Flagged “High Spike” or “Sharp Drop”  

5. **Dashboarding**
   - Power BI used to create KPI cards, line charts, tables, and alerts  

---

## Sample Output Table

| Issue Type                | Failed Records | Failure (%) |
|---------------------------|----------------|------------|
| Missing Customer ID       | 135,080        | 24.93      |
| Duplicate Invoice Numbers | 1,072,136      | 197.84     |
| Invalid Quantity          | 10,624         | 1.96       |
| Invalid Unit Price        | 2,517          | 0.46       |
| Future Invoice Dates      | 0              | 0.00       |

---

## Skills and Technologies
- **Python:** pandas, numpy, Jupyter / Google Colab  
- **SQL:** data quality queries and aggregations  
- **Power BI:** dashboards, KPI cards, trend charts, alert tables  
- **Analytics Concepts:** data quality metrics, weighted scoring, KPI monitoring, anomaly detection  

---

## Results
- **Total Revenue:** 452,130  
- **Transaction Volume:** 1,230  
- **Failure Impact (%):** 21.83  
- **Data Quality Score:** 62.47%  
- **Anomaly Detection:** Detected high revenue spikes with detailed alert log

## Dashboard

The interactive Power BI dashboard visualizes KPIs, data quality issues, and anomalies.  
You can download and open the dashboard png :

![Dashboard Sample](https://github.com/Tanishka-001/data-quality-kpi-monitoring-system/blob/4ecfc8e750f03ead281487a59d8aa695fcebfc56/powerbi%20dashboad/data%20quality%26%20business%20kpi%20monitoring.png)


**Alert Table Sample:**

| Date       | Daily Revenue | Anomaly Type | Alert Reason |
|------------|---------------|--------------|--------------|
| 2010-12-08 | 633,536.76    | High Spike   | Revenue deviated significantly from historical average |
| 2010-12-09 | 181,419.00    | High Spike   | Revenue deviated significantly from historical average |
| 2010-12-03 | 138,348.60    | High Spike   | Revenue deviated significantly from historical average |

## Python Notebook

All data quality and anomaly detection steps are implemented in Python.  
You can view and run the notebook here:

[Open in Google Colab](https://colab.research.google.com/drive/1QTB7mOUicjQTd2cJQI_4gAUuJFkiPr9h?usp=sharing)

---

## Next Steps / Future Work
- Real-time dashboard updates using streaming data  
- Machine learning–based anomaly detection for more complex patterns  
- Automated alert notifications via email/Slack  
- Integration with multi-source datasets  
- Expand data quality metrics with more complex validation rules  
