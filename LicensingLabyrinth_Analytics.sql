------------------------------------------------------------
-- LICENSING LABYRINTH ANALYTICS REPORT
-- Author: Ruben
-- Description: Full analytics suite for licensing attempts
------------------------------------------------------------

------------------------------------------------------------
-- 1. Failure Count by Category
------------------------------------------------------------
SELECT 
    category,
    COUNT(*) AS failure_count
FROM vw_LicensingAnalysis
WHERE result = 'Failed'
GROUP BY category
ORDER BY failure_count DESC;


------------------------------------------------------------
-- 2. Total Time Lost by Product
------------------------------------------------------------
SELECT 
    product,
    SUM(time_lost_min) AS total_minutes_lost
FROM vw_LicensingAnalysis
GROUP BY product
ORDER BY total_minutes_lost DESC;


------------------------------------------------------------
-- 3. Average Frustration Score by Phase
------------------------------------------------------------
SELECT 
    phase,
    AVG(frustration_score) AS avg_frustration
FROM vw_LicensingAnalysis
GROUP BY phase
ORDER BY avg_frustration DESC;


------------------------------------------------------------
-- 4. Top Failure Reasons
------------------------------------------------------------
SELECT 
    error_message,
    COUNT(*) AS occurrences
FROM vw_LicensingAnalysis
WHERE result = 'Failed'
GROUP BY error_message
ORDER BY occurrences DESC;


------------------------------------------------------------
-- 5. Product Pain Index (Frustration + Time Lost)
------------------------------------------------------------
SELECT 
    product,
    SUM(frustration_score) AS total_frustration,
    SUM(time_lost_min) AS total_time_lost,
    (SUM(frustration_score) * 0.7) + (SUM(time_lost_min) * 0.3) AS pain_index
FROM vw_LicensingAnalysis
GROUP BY product
ORDER BY pain_index DESC;


------------------------------------------------------------
-- 6. Phase Bottleneck Detection (Where Failures Cluster)
------------------------------------------------------------
SELECT 
    phase,
    COUNT(*) AS phase_failures
FROM vw_LicensingAnalysis
WHERE result = 'Failed'
GROUP BY phase
ORDER BY phase_failures DESC;


------------------------------------------------------------
-- 7. Success vs Failure Ratio
------------------------------------------------------------
SELECT 
    result,
    COUNT(*) AS count
FROM vw_LicensingAnalysis
GROUP BY result;
