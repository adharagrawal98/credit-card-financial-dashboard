SELECT 
    Client_Num,
    Card_Category,
    Credit_Limit,
    Total_Revolving_Bal,
    ROUND(Avg_Utilization_Ratio * 100, 1)   AS utilization_pct,
    Total_Trans_Amt,
    Interest_Earned,
    Delinquent_Acc,
    CASE 
        WHEN Avg_Utilization_Ratio >= 0.9 
             AND Delinquent_Acc = 1          THEN 'Critical Risk'
        WHEN Avg_Utilization_Ratio >= 0.75   THEN 'High Risk'
        WHEN Avg_Utilization_Ratio >= 0.5    THEN 'Medium Risk'
        ELSE                                      'Low Risk'
    END AS risk_segment
FROM credit_card
ORDER BY Avg_Utilization_Ratio DESC, Delinquent_Acc DESC;