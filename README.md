# Data Quality & Business KPI Monitoring System

## Executive Summary

The **Data Quality & Business KPI Monitoring System** is an end-to-end data analytics project designed to monitor business performance while identifying and measuring data-quality issues.

The project combines **Python-based data quality analysis** with an interactive **Power BI dashboard** to provide visibility into revenue, transaction volume, failure rates, data quality scores, data-quality issues, and revenue anomalies.

The goal is to demonstrate how raw transactional data can be transformed into **reliable business KPIs and actionable monitoring insights**.

---

## Problem Statement

Business teams often rely on large transactional datasets to make decisions, but poor data quality can affect the reliability of those decisions.

Common problems include:

* Missing customer information
* Duplicate invoice records
* Invalid quantities
* Invalid unit prices
* Future invoice dates
* Inconsistent or incomplete records
* Revenue spikes that may require investigation

A monitoring system is therefore needed to:

1. Measure data quality.
2. Identify data-quality failures.
3. Track important business KPIs.
4. Detect unusual revenue patterns.
5. Present the results in an easy-to-understand dashboard.

---

## Business Impact

Poor-quality data can lead to:

* Incorrect business reporting
* Inaccurate revenue analysis
* Misleading KPIs
* Incorrect customer or transaction analysis
* Increased manual investigation
* Reduced confidence in analytical results

This project provides a centralized monitoring view that helps analysts and business teams quickly identify **what is happening, where problems exist, and which areas may require investigation**.

---

## Solution

The solution consists of two major components:

### 1. Data Quality Analysis

Python is used to:

* Inspect the transactional dataset.
* Identify data-quality problems.
* Categorize failed records by issue type.
* Calculate failure percentages.
* Calculate weighted data-quality impacts.
* Generate a data-quality score.

### 2. Business KPI Dashboard

Power BI is used to monitor:

* Total Revenue
* Transaction Volume
* Failure Rate
* Data Quality Score
* Daily Revenue Trend
* Transaction Volume Trend
* Failure Rate Trend
* Data Quality Issues by Issue Type
* Revenue Anomaly Alerts
* Date-based filtering

---

## Methodology

### Step 1 — Data Preparation

The transactional dataset was loaded and inspected for:

* Missing values
* Duplicate records
* Invalid quantities
* Invalid prices
* Invalid dates
* Transaction-level inconsistencies

### Step 2 — Data Quality Checks

The project evaluates multiple data-quality dimensions, including:

| Data Quality Check           | Description                                                   |
| ---------------------------- | ------------------------------------------------------------- |
| Missing Customer ID          | Identifies transactions without customer information          |
| Duplicate Invoice Line Items | Identifies duplicate transaction records                      |
| Invalid Quantity             | Identifies invalid quantity values                            |
| Invalid Unit Price           | Identifies invalid pricing values                             |
| Future Invoice Dates         | Identifies transactions with dates beyond the expected period |

### Step 3 — Failure Analysis

Failed records are categorized by issue type and aggregated to understand which quality problems have the greatest impact.

### Step 4 — Data Quality Score

A weighted scoring approach is used to summarize the overall quality of the dataset on a **0–100 scale**.

Higher scores indicate better overall data quality.

### Step 5 — Business KPI Monitoring

The following KPIs are calculated:

* **Total Revenue**
* **Transaction Volume**
* **Failure Rate**
* **Data Quality Score**

### Step 6 — Trend Analysis

Time-based trends are analyzed for:

* Daily Revenue
* Transaction Volume
* Failure Rate

### Step 7 — Revenue Anomaly Detection

Revenue patterns are monitored to identify unusual observations.

The project records anomaly information such as:

* Anomaly Type
* Alert Reason
* Daily Revenue
* Date

This allows potentially unusual revenue activity to be surfaced for further investigation.

---

## Sample Output Table

| Issue Type                  | Description                                     |
| --------------------------- | ----------------------------------------------- |
| Missing Customer ID         | Customer identifier is missing                  |
| Duplicate Invoice Line Item | Duplicate transaction line detected             |
| Invalid Quantity            | Quantity value does not meet validation rules   |
| Invalid Unit Price          | Unit price value does not meet validation rules |
| Future Invoice Dates        | Invoice date falls outside the expected period  |

---

## Skills & Technologies

### Programming & Data Analysis

* Python
* Data Cleaning
* Data Validation
* Exploratory Data Analysis
* Statistical Analysis
* Anomaly Detection

### Visualization & BI

* Microsoft Power BI
* DAX
* Interactive Dashboard Design
* KPI Development
* Trend Analysis
* Data Visualization

### Data & Analytics Concepts

* Data Quality Monitoring
* Business KPI Monitoring
* Data Validation
* Data Profiling
* Aggregation
* Time-Series Analysis
* Anomaly Detection
* Business Intelligence

---

## Results

The final dashboard provides a consolidated view of business performance and data quality.

### Current Dashboard KPIs

| KPI                |          Result |
| ------------------ | --------------: |
| Total Revenue      |       **9.75M** |
| Transaction Volume |        **542K** |
| Failure Rate       |      **25.69%** |
| Data Quality Score | **91.34 / 100** |

### Key Insights

* Revenue shows noticeable variation throughout the year with stronger activity toward the later months.
* Transaction volume follows a similar upward pattern toward the end of the period.
* Failure rates fluctuate significantly over time, allowing periods of increased data-quality problems to be investigated.
* **Missing Customer ID** represents the largest failed-record category in the current dashboard.
* Duplicate Invoice Line Items are another significant source of failed records.
* Revenue anomaly monitoring identifies **High Spike** events requiring further investigation.

---

## Dashboard

The Power BI dashboard provides an interactive monitoring interface containing:

### KPI Cards

* Total Revenue
* Transaction Volume
* Failure Rate
* Data Quality Score

### Business & Data Quality Visuals

* Daily Revenue Trend
* Transaction Volume Trend
* Failure Rate Trend
* Failed Records by Issue Type
* Revenue Anomaly Alerts

### Interactive Filtering

A **Date Slicer** allows users to filter the dashboard by a selected date range and analyze business KPIs and data-quality metrics for a specific period.

---
## Dashboard

The Power BI dashboard provides an interactive monitoring interface for business KPIs and data quality.

![Data Quality & Business KPI Monitoring Dashboard](powerbidashboad/Dashboard.png)

## Python Notebook

The Python analysis is responsible for the underlying data-quality assessment and preparation of monitoring outputs.

The notebook includes:

1. Data loading
2. Data inspection
3. Data-quality validation
4. Failed-record identification
5. Issue categorization
6. Failure percentage calculation
7. Weighted impact calculation
8. Data-quality score calculation
9. Revenue analysis
10. Revenue anomaly detection
11. Export of analysis results for Power BI

---

## Project Structure

```text
Data-Quality-Business-KPI-Monitoring/
│
├── data/
│   └── raw_transaction_data.csv
│
├── notebooks/
│   └── data_quality_analysis.ipynb
│
├── powerbi/
│   └── data_quality_kpi_dashboard.pbix
│
├── outputs/
│   ├── daily_revenue_full.csv
│   ├── data_quality_score.csv
│   ├── python_data_quality_summary.csv
│   └── revenue_anomaly_alert_log.csv
│
├── README.md
└── requirements.txt
```

---

## Key Business Questions Answered

The dashboard is designed to answer questions such as:

* What is the total revenue?
* How many transactions are being processed?
* What is the current failure rate?
* How reliable is the underlying dataset?
* Which data-quality issue affects the most records?
* How does revenue change over time?
* How does transaction volume change over time?
* When do failure rates increase?
* Are there unusual revenue spikes that require investigation?
* How do these metrics change for a selected date range?

---

## Future Improvements

Potential future enhancements include:

* Automated data-quality alerts
* Automated Power BI refresh
* More advanced anomaly detection
* Additional data-quality dimensions
* Drill-through pages for failed records
* Root-cause analysis for data-quality failures
* Automated email/notification alerts
* Historical comparison of data-quality scores
* Role-based dashboard views
* Integration with SQL databases or cloud data warehouses

---

## Conclusion

This project demonstrates an end-to-end approach to **data quality monitoring and business KPI analysis**, combining Python-based validation and analysis with Power BI reporting.

By connecting data-quality metrics with business performance indicators, the system helps analysts identify unreliable data, monitor important KPIs, detect unusual business activity, and provide a more reliable foundation for decision-making.
