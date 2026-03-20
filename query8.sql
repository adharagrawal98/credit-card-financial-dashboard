WITH customer_spend AS (
    SELECT 
        Client_Num,
        Card_Category,
        SUM(Total_Trans_Amt)                    AS total_spend,
        SUM(Interest_Earned)                    AS total_interest,
        AVG(Avg_Utilization_Ratio)              AS avg_utilization,
        NTILE(10) OVER 
            (ORDER BY SUM(Total_Trans_Amt) DESC) AS spend_decile
    FROM credit_card
    GROUP BY Client_Num, Card_Category
)
SELECT 
    spend_decile,
    COUNT(*)                                    AS customer_count,
    ROUND(AVG(total_spend), 2)                  AS avg_spend,
    ROUND(SUM(total_spend), 2)                  AS total_spend,
    ROUND(SUM(total_spend) * 100.0 / 
          SUM(SUM(total_spend)) OVER (), 2)     AS pct_of_revenue,
    ROUND(AVG(avg_utilization), 3)              AS avg_utilization
FROM customer_spend
GROUP BY spend_decile
ORDER BY spend_decile;