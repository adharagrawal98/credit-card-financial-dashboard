SELECT 
    Week_Start_Date,
    Week_Num,
    Qtr,
    SUM(Total_Trans_Amt)                        AS weekly_revenue,
    SUM(Total_Trans_Vol)                        AS weekly_transactions,
    ROUND(AVG(Avg_Utilization_Ratio), 3)        AS avg_utilization,
    SUM(SUM(Total_Trans_Amt)) 
        OVER (ORDER BY Week_Start_Date)         AS cumulative_revenue
FROM credit_card
GROUP BY Week_Start_Date, Week_Num, Qtr
ORDER BY Week_Start_Date;