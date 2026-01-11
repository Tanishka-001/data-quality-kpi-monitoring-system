CREATE SCHEMA analytics;

CREATE TABLE analytics.transactions_raw (
    invoice_no TEXT,
    stock_code TEXT,
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price NUMERIC,
    customer_id TEXT,
    country TEXT
);

-- step2 : Data is loaded
SELECT COUNT(*) FROM analytics.transactions_raw;
SELECT *
FROM analytics.transactions_raw
LIMIT 5;

-- CLEAN TRANSACTIONS TABLE
CREATE TABLE analytics.transactions_clean AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country
FROM analytics.transactions_raw;

-- STEP 3: FIRST DATA QUALITY CHECKS (CORE LOGIC)
-- 3.1 Missing Customer ID
SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id
FROM analytics.transactions_clean;

-- 3.2 Duplicate Invoices
SELECT
    invoice_no,
    COUNT(*) AS duplicate_count
FROM analytics.transactions_clean
GROUP BY invoice_no
HAVING COUNT(*) > 1;

-- 3.3 Invalid Quantities
SELECT COUNT(*) AS invalid_quantity
FROM analytics.transactions_clean
WHERE quantity <= 0;

--3.4 Invalid Prices
SELECT COUNT(*) AS invalid_price
FROM analytics.transactions_clean
WHERE unit_price <= 0;

--3.5 Future Dates
SELECT COUNT(*) AS future_dates
FROM analytics.transactions_clean
WHERE invoice_date > CURRENT_TIMESTAMP;


--STEP 4: CREATE DATA QUALITY REPORT TABLE
CREATE TABLE analytics.data_quality_report (
    check_name TEXT,
    total_records INT,
    failed_records INT,
    failure_percentage NUMERIC(5,2),
    run_date DATE
);

--STEP 5: INSERT QUALITY RESULTS (EXAMPLE)

INSERT INTO analytics.data_quality_report
SELECT
    'Missing Customer ID',
    COUNT(*),
    COUNT(*) FILTER (WHERE customer_id IS NULL),
    ROUND(
        (COUNT(*) FILTER (WHERE customer_id IS NULL)::NUMERIC / COUNT(*)) * 100, 2
    ),
    CURRENT_DATE
FROM analytics.transactions_clean;

--STEP 6: 6.1 ADD REMAINING DATA QUALITY CHECKS

INSERT INTO analytics.data_quality_report
SELECT
    'Duplicate Invoice Numbers',
    COUNT(*),
    COUNT(*) FILTER (WHERE invoice_no IN (
        SELECT invoice_no
        FROM analytics.transactions_clean
        GROUP BY invoice_no
        HAVING COUNT(*) > 1
    )),
    ROUND(
        (COUNT(*) FILTER (WHERE invoice_no IN (
            SELECT invoice_no
            FROM analytics.transactions_clean
            GROUP BY invoice_no
            HAVING COUNT(*) > 1
        ))::NUMERIC / COUNT(*)) * 100, 2
    ),
    CURRENT_DATE
FROM analytics.transactions_clean;

-- 6.2 Invalid Quantity (≤ 0)
INSERT INTO analytics.data_quality_report
SELECT
    'Invalid Quantity',
    COUNT(*),
    COUNT(*) FILTER (WHERE quantity <= 0),
    ROUND(
        (COUNT(*) FILTER (WHERE quantity <= 0)::NUMERIC / COUNT(*)) * 100, 2
    ),
    CURRENT_DATE
FROM analytics.transactions_clean;

-- 6.3 Invalid Unit Price (≤ 0)
INSERT INTO analytics.data_quality_report
SELECT
    'Invalid Unit Price',
    COUNT(*),
    COUNT(*) FILTER (WHERE unit_price <= 0),
    ROUND(
        (COUNT(*) FILTER (WHERE unit_price <= 0)::NUMERIC / COUNT(*)) * 100, 2
    ),
    CURRENT_DATE
FROM analytics.transactions_clean;

-- 6.4 Future Invoice Dates
INSERT INTO analytics.data_quality_report
SELECT
    'Future Invoice Dates',
    COUNT(*),
    COUNT(*) FILTER (WHERE invoice_date > CURRENT_TIMESTAMP),
    ROUND(
        (COUNT(*) FILTER (WHERE invoice_date > CURRENT_TIMESTAMP)::NUMERIC / COUNT(*)) * 100, 2
    ),
    CURRENT_DATE
FROM analytics.transactions_clean;

-- STEP 7: REVIEW DATA QUALITY REPORT (IMPORTANT)

SELECT *
FROM analytics.data_quality_report;
--You should see multiple rows, one per check.
--👉 Take a screenshot — this is gold for your portfolio.

-- STEP 8: CREATE KPI SUMMARY TABLE (NEXT CORE PART)

-- 8.1 Create KPI Table
CREATE TABLE analytics.kpi_summary AS
SELECT
    DATE(invoice_date) AS date,
    COUNT(DISTINCT invoice_no) AS transaction_volume,
    SUM(quantity * unit_price) AS revenue,
    COUNT(*) FILTER (WHERE quantity <= 0 OR unit_price <= 0)::NUMERIC 
        / COUNT(*) * 100 AS failure_rate
FROM analytics.transactions_clean
GROUP BY DATE(invoice_date)
ORDER BY date;

-- 8.2 Quick KPI Check
SELECT *
FROM analytics.kpi_summary
LIMIT 10;

--9.1 Create Data Quality Score (SQL)
SELECT
    run_date,
    ROUND(100 - SUM(failure_percentage), 2) AS data_quality_score
FROM analytics.data_quality_report
GROUP BY run_date;

--9.2 Save It as a Table
CREATE TABLE analytics.data_quality_score AS
SELECT
    run_date,
    ROUND(100 - SUM(failure_percentage), 2) AS data_quality_score
FROM analytics.data_quality_report
GROUP BY run_date;





DROP TABLE IF EXISTS analytics.data_quality_score;
CREATE TABLE analytics.data_quality_score AS
SELECT
    run_date,
    ROUND(100 - AVG(failure_percentage), 2) AS data_quality_score
FROM analytics.data_quality_report
GROUP BY run_date;

SELECT *
FROM analytics.data_quality_score;




