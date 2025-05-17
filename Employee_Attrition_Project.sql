-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Employee Attrition Project
-- MAGIC ## Problem Statement:
-- MAGIC Employee attrition is a critical challenge for organizations, impacting productivity and workforce stability. Analyzing attrition data can help identify key factors influencing employee turnover and support strategic retention efforts.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Let us load the dataset using sql

-- COMMAND ----------

SELECT * FROM Employee_attrition;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Let us Find the total number of Employees
-- MAGIC

-- COMMAND ----------

SELECT sum(EmployeeCount) FROM employee_attrition;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Total number of Employee count who are left and who stays
-- MAGIC

-- COMMAND ----------

SELECT sum(EmployeeCount), Attrition FROM employee_attrition 
GROUP BY 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Keeping Age as a factor and see which age group having what attrition percentage
-- MAGIC
-- MAGIC AGE ANALYSIS
-- MAGIC

-- COMMAND ----------

SELECT sum(EmployeeCount), 
CASE when age between 20 and 25 then '20-25' when age BETWEEN 26 and 32 then '26-32' when age BETWEEN 33 and 40 then '33-40' else '40+' END age_group
FROM employee_attrition
where Attrition='Yes'
GROUP BY 2 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insights:
-- MAGIC Here we have noticed that employees from age grup 26-32 leave most
-- MAGIC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Now we find attrition based on departments
-- MAGIC

-- COMMAND ----------

SELECT sum(EmployeeCount), department from employee_attrition where Attrition='Yes'
GROUP BY Department;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insights
-- MAGIC we got to know that employees from R&D department leaves the most

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Now we extract data based on Education
-- MAGIC Attrition by education (1-Below college, 2-college, 3-Bachelor, 4-Master, 5-Doctor)

-- COMMAND ----------

SELECT sum(EmployeeCount), 
Case when Education=1 then 'Below College Level' when Education=2 then 'College Level' when Education=3 then 'Bachelor graduate' when Education=4 then 'Master or Post Graduate' else 'Doctor' END Education_qualification  
FROM employee_attrition
where Attrition='Yes'
GROUP BY Education

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insights:
-- MAGIC Based on education Bachelor degree graduate has most attrition rate

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Based on Environment Satisfaction
-- MAGIC Attrition by environment satisfaction (1-low, 2-medium, 3-high, 4-highly satisfied)
-- MAGIC

-- COMMAND ----------

SELECT sum(EmployeeCount), 
CASE when EnvironmentSatisfaction=1 then 'Low' when EnvironmentSatisfaction=2 then 'Medium' when EnvironmentSatisfaction=3 then 'High' else 'Highly Satisfied' end Satisfaction
FROM employee_attrition
where Attrition = 'Yes'
Group BY EnvironmentSatisfaction

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Insights:
-- MAGIC We have noticed that people who are less satisfied with environment leaves the most

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Attrition based on business Travel
-- MAGIC

-- COMMAND ----------

SELECT sum(EmployeeCount), BusinessTravel FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Insights on total
-- MAGIC Based on Age 35.9 % are from age group 26-32 where most of them belongs to R&D Department and have bachelor degree qualification and have less environment and job satisfaction and usually they Travel_Rarely
-- MAGIC
-- MAGIC There are many such factors and we can find solution for the problem from these insights