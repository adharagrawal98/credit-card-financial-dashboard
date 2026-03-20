SELECT 
    Activation_30_Days,
    Card_Category,
    COUNT(*)                                        AS customer_count,
    ROUND(AVG(avg_weekly_spend), 2)                 AS avg_weekly_spend,
    ROUND(AVG(total_interest), 2)                   AS avg_interest,
    ROUND(AVG(avg_utilization), 3)                  AS avg_utilization,
    ROUND(AVG(avg_acq_cost), 2)                     AS avg_acq_cost,
    ROUND(AVG(avg_weekly_spend) / 
          NULLIF(AVG(avg_acq_cost), 0), 2)          AS spend_to_acq_ratio
FROM (
    SELECT 
        Client_Num,
        Card_Category,
        MAX(Activation_30_Days)                     AS Activation_30_Days,
        AVG(Total_Trans_Amt)                        AS avg_weekly_spend,
        SUM(Interest_Earned)                        AS total_interest,
        AVG(Avg_Utilization_Ratio)                  AS avg_utilization,
        AVG(Customer_Acq_Cost)                      AS avg_acq_cost
    FROM credit_card
    GROUP BY Client_Num, Card_Category
) AS customer_level
GROUP BY Activation_30_Days, Card_Category
ORDER BY Card_Category, Activation_30_Days;