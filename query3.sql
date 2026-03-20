SELECT 
    Week_Start_Date,
    Week_Num,
    Qtr,
    SUM(Total_Trans_Amt) AS weekly_revenue,
    LAG(SUM(Total_Trans_Amt)) 
        OVER (ORDER BY Week_Start_Date)     AS prev_week_revenue,
    ROUND(
        (SUM(Total_Trans_Amt) - LAG(SUM(Total_Trans_Amt)) 
            OVER (ORDER BY Week_Start_Date))
        / LAG(SUM(Total_Trans_Amt)) 
            OVER (ORDER BY Week_Start_Date) * 100
    , 2)                                    AS wow_change_pct
FROM credit_card
GROUP BY Week_Start_Date, Week_Num, Qtr
ORDER BY Week_Start_Date;