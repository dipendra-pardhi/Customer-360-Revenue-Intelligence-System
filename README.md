# Customer 360 Analytics Dashboard | RFM, CLV & Churn Analysis

This project focuses on building a comprehensive Customer 360 Analytics Dashboard to analyze customer behavior, segmentation, lifetime value, and churn patterns. The objective is to derive actionable insights that help businesses improve customer retention, identify high-value customers, and optimize decision-making.

---

## Introduction

Customer analytics plays a critical role in understanding user behavior and maximizing business revenue. This project leverages data analysis techniques such as RFM segmentation, Customer Lifetime Value (CLV), and churn analysis to provide a 360-degree view of customers. The dashboard enables businesses to identify key customer segments, track performance, and take data-driven actions.

---

## Data Sources

The analysis is based on transactional retail data containing customer purchase history. The dataset includes:

* CustomerID
* InvoiceDate
* InvoiceNo
* TotalPrice

Using this data, aggregated customer-level metrics were created for further analysis.

---

## Project Overview

1. Cleaned and preprocessed raw transaction data using Python (Pandas)
2. Calculated RFM (Recency, Frequency, Monetary) metrics for each customer
3. Developed customer segmentation based on RFM scores
4. Built CLV model to estimate customer value
5. Created churn identification logic based on recency
6. Designed a multi-page Power BI dashboard for visualization

---

## Key Analysis & Logic

### 1. RFM Analysis

**Objective:** Segment customers based on purchasing behavior

* Recency → Days since last purchase
* Frequency → Number of purchases
* Monetary → Total spending

```python
rfm = df.groupby('CustomerID').agg({
    'InvoiceDate': lambda x: (reference_date - x.max()).days,
    'InvoiceNo': 'nunique',
    'TotalPrice': 'sum'
})
```

---

### 2. Churn Identification

**Objective:** Identify inactive customers

```python
rfm['Churn'] = rfm['Recency'].apply(lambda x: 1 if x > 90 else 0)
```

---

### 3. RFM Segmentation

**Objective:** Classify customers into segments

```python
def segment(x):
    if x >= '555':
        return 'Champions'
    elif x >= '444':
        return 'Loyal Customers'
    elif x >= '333':
        return 'Potential'
    else:
        return 'At Risk'
```

---

### 4. CLV Calculation (Power BI DAX)

```DAX
CLV = rfm_data[Monetary] * rfm_data[Frequency]
```

---

## Dashboard Overview

The Power BI dashboard consists of 5 pages:

1. Executive Summary – Overall business performance
2. Customer Segmentation – RFM-based customer groups
3. CLV Analysis – High vs low-value customers
4. Churn Analysis – Active vs inactive customers
5. Sales Trend – Revenue patterns over time

---

## Key Insights

* ~20–25% customers identified as high-value contributing majority of revenue
* High-value segments generate ~60%+ total revenue
* ~30–40% customers classified as inactive (churn risk)
* Majority customers fall under Potential and At Risk segments
* Revenue trends show variation across time periods

---

## Tools & Technologies

* Python (Pandas) – Data cleaning, RFM modeling
* Power BI – Dashboard development
* DAX – Measures and calculated columns
* Data Visualization – Charts and insights

---

## Business Impact

* Helps identify high-value customers for targeted marketing
* Enables early detection of churn risk customers
* Supports data-driven decision-making
* Improves customer retention strategies

---

## Conclusion

This project demonstrates how customer data can be transformed into meaningful insights using analytics and visualization. By combining RFM analysis, CLV modeling, and churn identification, businesses can better understand their customers and improve overall performance.
