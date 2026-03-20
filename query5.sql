SELECT 
    CASE 
        WHEN Avg_Utilization_Ratio >= 0.9 
             AND Delinquent_Acc = 1          THEN 'Critical Risk'
        WHEN Avg_Utilization_Ratio >= 0.75   THEN 'High Risk'
        WHEN Avg_Utilization_Ratio >= 0.5    THEN 'Medium Risk'
        ELSE                                      'Low Risk'
    END                                         AS risk_segment,
    Card_Category,
    COUNT(*)                                    AS customer_count,
    ROUND(AVG(Credit_Limit), 2)                 AS avg_credit_limit,
    ROUND(AVG(Total_Trans_Amt), 2)              AS avg_spend,
    ROUND(SUM(Interest_Earned), 2)              AS total_interest,
    SUM(Delinquent_Acc)                         AS delinquent_count
FROM credit_card
GROUP BY risk_segment, Card_Category
ORDER BY risk_segment, customer_count DESC;