SELECT 
    Use_Chip                                    AS transaction_method,
    Exp_Type                                    AS spend_category,
    COUNT(*)                                    AS transaction_count,
    ROUND(SUM(Total_Trans_Amt), 2)              AS total_spend,
    ROUND(AVG(Total_Trans_Amt), 2)              AS avg_spend,
    ROUND(SUM(Total_Trans_Amt) * 100.0 / 
        SUM(SUM(Total_Trans_Amt)) OVER (), 2)   AS pct_of_total
FROM credit_card
GROUP BY Use_Chip, Exp_Type
ORDER BY total_spend DESC;