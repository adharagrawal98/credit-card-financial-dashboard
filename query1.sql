use cc_project
SELECT 
    Card_Category,
    COUNT(DISTINCT Client_Num)              AS total_customers,
    ROUND(SUM(Total_Trans_Amt), 2)          AS total_transaction_amt,
    ROUND(AVG(Total_Trans_Amt), 2)          AS avg_transaction_amt,
    ROUND(SUM(Interest_Earned), 2)          AS total_interest_earned,
    ROUND(AVG(Avg_Utilization_Ratio), 3)    AS avg_utilization,
    SUM(Delinquent_Acc)                     AS total_delinquent
FROM credit_card
GROUP BY Card_Category
ORDER BY total_transaction_amt DESC;