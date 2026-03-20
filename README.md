# Credit Card Financial Dashboard

**Tools:** MySQL · Power BI · Python  
**Dataset:** 10,108 credit card customer records · 52-week period · 2025  
**Queries:** 9 SQL queries across 7 analytical dimensions

---
<img width="905" height="513" alt="dashboard pg1" src="https://github.com/user-attachments/assets/d117343a-bd9c-4091-ac3b-6cc940ad4fd4" />

<img width="905" height="513" alt="dashboard pg2" src="https://github.com/user-attachments/assets/892fa74c-89c9-411f-9df5-752c70bb8247" />


## Business Questions Answered

- Where is revenue concentrated across the customer base?
- Which customers carry disproportionate credit risk?
- Does early card activation drive better long-term value?
- What transaction patterns reveal hidden customer segments?

---

## Key Findings

- Top 10% of customers generate **29.9% of total revenue** — £13.3M of £44.5M
- Blue cards drive 83% of transaction volume but carry **91% of all delinquencies**
- Chip Travel transactions average **£10,763 vs £2,681 for Swipe Travel** — same category, 4x difference
- Platinum activated customers deliver **151x spend-to-acquisition ratio** vs 41x for Blue
- Top spenders have the **lowest utilisation ratio** (17.2%) — inverse relationship driven by higher credit limits
- Medium Risk segment holds **£1.24M interest at stake** — portfolio's primary watch zone
- Low Risk credit limit averages **£9,061 vs £2,465 for High Risk** — 3.7x gap confirming limit controls

---

## Dashboard

### Page 1 — Transaction Overview
https://github.com/adharagrawal98/credit-card-financial-dashboard/blob/main/dashboard%20pg1.png

### Page 2 — Risk Intelligence
https://github.com/adharagrawal98/credit-card-financial-dashboard/blob/main/dashboard%20pg2.png

---

## SQL Queries

| Query | Analysis | Key Technique |
|-------|----------|---------------|
| Q1 | Revenue breakdown by card category | GROUP BY, aggregations |
| Q2 | Weekly revenue trend with cumulative totals | SUM() OVER() window function |
| Q3 | Week-on-week revenue change % | LAG() window function |
| Q4 | Individual customer risk profiles | CASE WHEN segmentation |
| Q5 | Risk segment summary with interest at stake | Subquery aggregation |
| Q6 | Spend behaviour by transaction method and category | SUM() OVER() percentage |
| Q7 | Quarterly performance comparison | COUNT DISTINCT, GROUP BY |
| Q8 | Customer value percentiles | NTILE(10) window function |
| Q9 | Activation ROI analysis by card category | Subquery, NULLIF |

---

## Data Structure Finding

A pre-analysis audit confirmed the dataset is cross-sectional — one record per 
customer — rather than longitudinal. This prevented incorrect engagement 
segmentation and is documented in the SQL query notes. Identified using 
COUNT(DISTINCT) validation before building any time-based analysis.

---

## Project Structure

credit-card-financial-dashboard/
│
├── README.md
├── query1.sql          # Revenue by card category
├── query2.sql          # Weekly revenue trend
├── query3.sql          # Week-on-week change
├── query4.sql          # Individual risk profiles
├── query5.sql          # Risk segment summary
├── query6.sql          # Spend by method and category
├── query7.sql          # Quarterly performance
├── query8.sql          # Customer value percentiles (NTILE)
├── query9.sql          # Activation ROI
├── business_insights_cc.docx   # Full business insights document
├── dashboard_page1.png         # Transaction Overview screenshot
└── dashboard_page2.png         # Risk Intelligence screenshot

---

## How to Run

1. Import `credit_card.csv` to MySQL using the provided Python import script
2. Run queries 1–9 in MySQL Workbench
3. Open `Credit_Card_Dashboard.pbix` in Power BI Desktop
4. Refresh data connection to your local MySQL instance

---

*Built by Adhar Agrawal — Data Analyst Portfolio Project 2025*
