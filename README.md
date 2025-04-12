# FDI Analysis
# FDI_Outflow
Objective: Analysing FDI Outflows in India during Q1 (FY25)  
Total number of Queries: 23

![image](https://github.com/user-attachments/assets/b11d4796-7657-46d0-99e4-6da7b7e64bc0)

---
## SNAPSHOTS  

#1 Contribution in outwards FDI by instruments <BR>

```
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
```
![image](https://github.com/user-attachments/assets/aa9f4505-1346-46b9-ad04-314fbf29f95e)


<BR>

#2 Top 20 Indian companies with biggest Total Outflow<BR>

```
SELECT Indian_party,
       ROUND(SUM(Total),3) AS Total_FDI_Outflow_millions_USD,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
                         FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Indian_party
ORDER BY Total_fdi_outflow_millions_USD DESC
LIMIT 20;

```
![image](https://github.com/user-attachments/assets/87d02de4-04eb-4292-918d-ccec5a71e98d)

<BR>

#3 Selecting activities according to FDI outflow  <BR>

```
-- Query 13
-- Selecting activities according to FDI outflow

SELECT Activity,
       ROUND(SUM(Total),3) AS Total_FDI,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
                         FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Activity
ORDER BY Total_FDI DESC;

```
![image](https://github.com/user-attachments/assets/2955a5aa-05e4-444a-95b8-41ba741ce08b)

<BR>

#4 Selecting month_name, outflow, contribution in total FDI outflow in Q1  <BR>

```
-- Query 2
-- Selecting month_name, outflow, contribution in total FDI outflow in Q1

SELECT Month_name,
       ROUND(SUM(Total),3) AS Outflow_in_million,
       ROUND(SUM(Total)/(SELECT SUM(Total) 
                         FROM outflow)*100,3) AS contribution_percent
FROM outflow
GROUP BY Month_name;

```
![image](https://github.com/user-attachments/assets/fd194e2b-0d56-4bdb-89f2-018d0c977d82)

<BR>
