SELECT *
FROM h_claims
;


SELECT  
SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END),
SUM(CASE WHEN outcome LIKE "%Partially%" THEN 1 ELSE 0 END)
FROM h_claims
;

SELECT  
SUM(CASE WHEN outcome = 'Paid
' THEN 1 ELSE 0 END)
FROM h_claims
;

#Percentages of claim status
SELECT  
SUM(CASE WHEN claim_status = "Paid" THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percent_paid,
SUM(CASE WHEN claim_status = "Denied" THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percent_denied,
SUM(CASE WHEN claim_status = "Under Review" THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percent_under_review
FROM h_claims
;

#Percentages of outcome
SELECT  
SUM(CASE WHEN outcome LIKE "%Paid%" THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percent_paid_and_partially_paid,
SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percent_denied
FROM h_claims
;

#Ratio of paid to billed amount
SELECT 
ROUND(SUM(billed_amount),2) AS total_billed, 
ROUND(SUM(paid_amount),2) AS total_paid, 
ROUND(SUM(billed_amount),2) - ROUND(SUM(paid_amount),2) AS total_difference,
ROUND(SUM(paid_amount),2) / ROUND(SUM(billed_amount),2) * 100 AS paid_percentage,
 ROUND(SUM(billed_amount),2) / ROUND(SUM(paid_amount),2) AS ratio
 FROM h_claims
;

#Underpayment Rates
SELECT claim_id, date_of_service, insurance_type,  billed_amount, paid_amount
FROM h_claims
WHERE paid_amount < 0.5 * billed_amount
;




#Follow up rate
SELECT (SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS follow_up_rate
FROM h_claims
;

#Denial Rate by Procedure Code
SELECT procedure_code, SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied, ROUND((SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percent_denied
FROM h_claims
GROUP BY procedure_code
ORDER BY 3 DESC
;


#Denial Rate by Diagnosis Code
SELECT diagnosis_code, SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied, ROUND((SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percent_denied
FROM h_claims
GROUP BY diagnosis_code
ORDER BY 3 DESC
LIMIT 20
;

#Denial Rate by Insurance Type
SELECT insurance_type, SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied, ROUND((SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percent_denied
FROM h_claims
GROUP BY insurance_type
ORDER BY 3 DESC
;

#Denial Rate by Reason Code
SELECT reason_code, SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied, ROUND((SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) / COUNT(*)) * 100) AS percent_denied
FROM h_claims
GROUP BY reason_code
ORDER BY 3 DESC
;

#Comparative metrics for each insurance type
SELECT insurance_type, 
SUM(CASE WHEN outcome LIKE "%Paid%" THEN 1 ELSE 0 END) AS num_paid,
SUM(CASE WHEN outcome LIKE "%Partially Paid%" THEN 1 ELSE 0 END) AS num_partially_paid,
SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied, 
ROUND(((SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END)  / COUNT(*)) * 100),2) AS percent_denied
FROM h_claims
GROUP BY insurance_type
;

SELECT claim_status, reason_code, outcome
FROM h_claims
WHERE claim_status = "Under Review"
;


#Top denials reasons by reason code and denial rates
SELECT reason_code, SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied,
ROUND((SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) / COUNT(*) * 100),2) AS denial_rate
FROM h_claims
WHERE claim_status = "Under Review" OR "Denied"
GROUP BY reason_code
ORDER BY 3 DESC
;

#Checking to see if there were any paid amounts more than the allowed amount
SELECT allowed_amount, paid_amount
FROM h_claims
WHERE paid_amount > allowed_amount
;


#Claim Delays overall
SELECT follow_up_required, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) AS num_yes,  SUM(CASE WHEN follow_up_required = "No" THEN 1 ELSE 0 END) AS num_no
FROM h_claims
GROUP BY follow_up_required
;

#Claim delays that lead to a paid outcome
SELECT follow_up_required, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) AS num_yes,  SUM(CASE WHEN follow_up_required = "No" THEN 1 ELSE 0 END) AS num_no
FROM h_claims
WHERE outcome LIKE "Paid%"
GROUP BY follow_up_required
;

#Claim Delays by insurance type
SELECT insurance_type, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) AS claim_delays, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) / COUNT(*) * 100 AS claim_delay_percent
FROM h_claims
GROUP BY insurance_type
;

#Claim Delays by procedure code
SELECT procedure_code, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) AS claim_delays, ROUND(SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) / COUNT(*) * 100,2) AS claim_delay_percent
FROM h_claims
GROUP BY procedure_code
ORDER BY 3 DESC
;

#Claim Delays by reason code
SELECT reason_code, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) AS claim_delays, ROUND(SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) / COUNT(*) * 100,2) AS claim_delay_percent
FROM h_claims
GROUP BY reason_code
ORDER BY 2 DESC
;

#Claim Delays by diagnosis code (TOP 10)
SELECT diagnosis_code, SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) AS claim_delays, ROUND(SUM(CASE WHEN follow_up_required = "Yes" THEN 1 ELSE 0 END) / COUNT(*) * 100,2) AS claim_delay_percent
FROM h_claims
GROUP BY diagnosis_code
ORDER BY 3 DESC
LIMIT 10
;


#Top 10 Providers based on number of denials, insurance, and reason codes
SELECT provider_ID,  SUM(CASE WHEN outcome LIKE "%Denied%" THEN 1 ELSE 0 END) AS num_denied
FROM h_claims
GROUP BY provider_ID
ORDER BY 2 DESC
LIMIT 10
;

#Average performance of Insurance types by average billed and paid amounts
SELECT insurance_type, ROUND(AVG(billed_amount),2) AS avg_billed, ROUND(AVG(allowed_amount),2) AS avg_allowed, ROUND(AVG(paid_amount),2) AS avg_paid
FROM h_claims
GROUP BY insurance_type
;
