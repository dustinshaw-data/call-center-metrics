-- Average Handle Time (AHT)
SELECT 
    agent,
    ROUND(AVG(call_duration_sec + wait_time_sec),2) AS avg_handle_time_sec
FROM call_center
GROUP BY agent
ORDER BY avg_handle_time_sec;

-- Average Speed of Answer (ASA)
SELECT 
    ROUND(AVG(wait_time_sec),2) AS avg_speed_of_answer_sec
FROM call_center;

-- Service Level (answered within 30 sec)
SELECT 
    COUNT(CASE WHEN wait_time_sec <= 30 THEN 1 END) * 100.0 / COUNT(*) AS service_level_pct
FROM call_center;

-- Abandonment Rate
SELECT 
    COUNT(CASE WHEN call_duration_sec = 0 THEN 1 END) * 100.0 / COUNT(*) AS abandonment_rate_pct
FROM call_center;

-- Calls per Agent
SELECT 
    agent,
    COUNT(*) AS total_calls
FROM call_center
GROUP BY agent
ORDER BY total_calls DESC;

-- Customer Satisfaction Score
SELECT 
    agent,
    ROUND(AVG(customer_satisfaction),2) AS avg_cs_score
FROM call_center
GROUP BY agent
ORDER BY avg_cs_score DESC;
