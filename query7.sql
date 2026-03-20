SELECT 
    Qtr,
    COUNT(DISTINCT Client_Num)              AS active_customers,
    SUM(Total_Trans_Vol)                    AS total_transactions,
    ROUND(SUM(Total_Trans_Amt), 2)          AS total_revenue,
    ROUND(SUM(Interest_Earned), 2)          AS total_interest,
    SUM(Delinquent_Acc)                     AS delinquencies,
    ROUND(AVG(Avg_Utilization_Ratio), 3)    AS avg_utilization,
    ROUND(SUM(Total_Trans_Amt) / 
          COUNT(DISTINCT Client_Num), 2)    AS revenue_per_customer
FROM credit_card
GROUP BY Qtr
ORDER BY Qtr;