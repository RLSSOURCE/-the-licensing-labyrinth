SELECT 
    result,
    COUNT(*) AS count
FROM vw_LicensingAnalysis
GROUP BY result;
