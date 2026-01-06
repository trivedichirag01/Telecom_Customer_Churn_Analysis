USE telecom_db;


-- Creating view
CREATE VIEW churn_data_view AS
	SELECT * FROM production_churn WHERE Customer_Status IN ('Churned, Stayed');


CREATE VIEW join_data_view AS
	SELECT * FROM production_churn WHERE Customer_Status = 'Joined';    

