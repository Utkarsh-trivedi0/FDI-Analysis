-- India's FDI Outflow Trend: Q1 FY25 Analysis
USE Fdi_outflow;
-- ------------------------------------------------
-- Query 1
--  Contribution in outwards FDI by instruments

SELECT 'Instrument', 'Total','Contribution_percent'
UNION ALL
SELECT 'Equity' , ROUND(SUM(Equity_usd_million),3),ROUND(SUM(Equity_usd_million)/(SELECT SUM(Total)
																				  FROM outflow)*100,3) 
FROM Outflow
UNION ALL
SELECT	'Loans' , ROUND(SUM(Loan_usd_million),3), ROUND(SUM(loan_usd_million)/(SELECT SUM(Total)
																			   FROM outflow)*100,3)  
FROM outflow 
UNION ALL
SELECT  'Gurantees', ROUND(SUM(Guarantee_Issued_usd_million),3),ROUND(SUM(Guarantee_Issued_usd_million)/(SELECT SUM(Total)
																							 FROM outflow)*100,3)  
FROM outflow ;

-- ------------------------------------------------
-- Query 2
-- Selecting month_name, outflow, contribution in total FDI outflow in Q1

SELECT Month_name,
	   ROUND(SUM(Total),3) AS Outflow_in_million,
	   ROUND(SUM(Total)/(SELECT SUM(Total) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Month_name;

-- ------------------------------------------------
-- Query 3
-- Selecting month_name, outflow, contribution in total equity outflow in Q1

SELECT Month_name,
	   ROUND(SUM(equity_usd_million),3) AS Equity_Outflow_in_million,
	   ROUND(SUM(equity_usd_million)/(SELECT SUM(equity_usd_million) 
						              FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Month_name;

-- ------------------------------------------------
-- Query 4
-- Selecting month_name, outflow, contribution in total loan outflow in Q1

SELECT Month_name,
	   ROUND(SUM(Loan_usd_million),3) AS Loan_Outflow_in_million,
	   ROUND(SUM(Loan_usd_million)/(SELECT SUM(Loan_usd_million) 
						            FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Month_name;

-- ------------------------------------------------
-- Query 5
-- Selecting month_name, outflow, contribution in total gurantees outflow in Q1

SELECT Month_name,
	   ROUND(SUM(Guarantee_Issued_usd_million),3) AS gurantees_Outflow_in_million,
	   ROUND(SUM(Guarantee_Issued_usd_million)/(SELECT SUM(Guarantee_Issued_usd_million) 
												FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Month_name;

-- ------------------------------------------------
-- Query 6
-- Top 20 Indian companies with biggest Total Outflow

SELECT Indian_party,
	   ROUND(SUM(Total),3) AS Total_FDI_Outflow_millions_USD,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Indian_party
ORDER BY Total_fdi_outflow_millions_USD DESC
LIMIT 20;

-- ------------------------------------------------
-- Query 7
-- Top 20 overseas company that recieved FDI

SELECT JVorWOS_name AS Overseas_company,
       Overseas_country,
	   ROUND(SUM(Total),3) AS Total_FDI_inflow_millions_USD,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY JVorWOS_name, Overseas_country
ORDER BY Total_fdi_inflow_millions_USD DESC
LIMIT 20;

-- ------------------------------------------------
-- Query 8
-- FDI outflow according its nature (Joint Venture or WOS- Wholly Owned Subsidiary)

SELECT JV_or_Wos,
	   ROUND(SUM(Total),3) AS Total_FDI,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY JV_or_WOS;

-- ------------------------------------------------
-- Query 9
-- Selecting countries according to FDI outflow

SELECT Overseas_country,
	   ROUND(SUM(Total),3) AS Total_FDI,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Overseas_country
ORDER BY Total_FDI DESC;

-- ------------------------------------------------
-- Query 10
-- Selecting countries according to equity outflow

SELECT Overseas_country,
	   ROUND(SUM(Equity_usd_million),3) AS Total_equity_FDI,
       ROUND(SUM(Equity_usd_million)/(SELECT SUM(Equity_usd_million) 
						              FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Overseas_country
ORDER BY Total_equity_FDI DESC;

-- ------------------------------------------------
-- Query 11
-- Selecting countries according to loan outflow

SELECT Overseas_country,
	   ROUND(SUM(Loan_usd_million),3) AS Total_loan_FDI,
       ROUND(SUM(Loan_usd_million)/(SELECT SUM(Loan_usd_million) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Overseas_country
ORDER BY Total_loan_FDI DESC;

-- ------------------------------------------------
-- Query 12
-- Selecting countries according to gurantees outflow

SELECT Overseas_country,
	   ROUND(SUM(Guarantee_Issued_usd_million),3) AS Total_gurantee_FDI,
       ROUND(SUM(Guarantee_Issued_usd_million)/(SELECT SUM(Guarantee_Issued_usd_million) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Overseas_country
ORDER BY Total_gurantee_FDI DESC;

-- ------------------------------------------------
-- Query 13
-- Selecting activities according to FDI outflow

SELECT Activity,
	   ROUND(SUM(Total),3) AS Total_FDI,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
						 FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Activity
ORDER BY Total_FDI DESC;

-- ------------------------------------------------
-- Query 14
-- Selecting activities according to equity outflow

SELECT activity,
	   ROUND(SUM(Equity_usd_million),3) AS Total_equity_FDI,
       ROUND(SUM(Equity_usd_million)/(SELECT SUM(Equity_usd_million) 
									  FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY activity
ORDER BY Total_equity_FDI DESC;

-- ------------------------------------------------
-- Query 15
-- Selecting activities according to loan outflow

SELECT Activity,
	   ROUND(SUM(Loan_usd_million),3) AS Total_loan_FDI,
       ROUND(SUM(Loan_usd_million)/(SELECT SUM(Loan_usd_million) 
									FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Activity
ORDER BY Total_loan_FDI DESC;

-- ------------------------------------------------
-- Query 16
-- Selecting activities according to gurantees outflow

SELECT Activity,
	   ROUND(SUM(Guarantee_Issued_usd_million),3) AS Total_gurantee_FDI,
       ROUND(SUM(Guarantee_Issued_usd_million)/(SELECT SUM(Guarantee_Issued_usd_million) 
												FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Activity
ORDER BY Total_gurantee_FDI DESC;

-- ------------------------------------------------
-- Query 17
-- Top 20 FDI outflows in Q1

SELECT*
FROM outflow
ORDER BY Total DESC
LIMIT 20;

-- ------------------------------------------------
-- Query 18
-- Top 20 Equity outflows in Q1

SELECT*
FROM outflow
ORDER BY Equity_usd_million DESC
LIMIT 20;

-- ------------------------------------------------
-- Query 19
-- Top 20 loan outflows in Q1

SELECT*
FROM outflow
ORDER BY loan_usd_million DESC
LIMIT 20;

-- ------------------------------------------------
-- Query 20
-- Top 20 gurantees outflows in Q1

SELECT*
FROM outflow
ORDER BY Guarantee_Issued_usd_million DESC
LIMIT 20;

-- ------------------------------------------------
-- Query 21
-- Overseas company with FDI less than 0.0001  USD million

SELECT*
FROM outflow 
WHERE Total<0.0001;

-- ------------------------------------------------
-- Query 22
-- Maximum FDI ouflow By a country (a single instance)

SELECT *
FROM Outflow 
WHERE (Overseas_country,Total) IN (SELECT Overseas_country, MAX(total) 
								   FROM outflow
								   GROUP BY Overseas_country)
ORDER BY Total DESC;
                                   
-- ------------------------------------------------
-- Query 23
-- Maximum FDI ouflow By an activity (a single instance)

SELECT *
FROM Outflow 
WHERE (Activity,Total) IN (SELECT Activity, MAX(total) 
						   FROM outflow
						   GROUP BY Activity)
ORDER BY Total DESC;

-- DONE--------------------------------------------------------
