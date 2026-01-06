CREATE DATABASE telecom_db;

USE telecom_db;

CREATE TABLE customer_churn(
Customer_ID VARCHAR(50) PRIMARY KEY,
Gender VARCHAR(20) NOT NULL,
Age	INT NOT NULL,
Married VARCHAR(30) NULL,
State VARCHAR(50) NULL,
Number_of_Referrals INT NULL,	
Tenure_in_Months TINYINT NULL,
Value_Deal VARCHAR(30) NULL,	
Phone_Service VARCHAR(20) NULL,
Multiple_Lines VARCHAR(20) NULL,
Internet_Service VARCHAR(20) NULL,
Internet_Type VARCHAR(30) NULL,
Online_Security	VARCHAR(20) NULL,
Online_Backup VARCHAR(20) NULL,
Device_Protection_Plan VARCHAR(20) NULL,
Premium_Support	VARCHAR(20) NULL,
Streaming_TV VARCHAR(20) NULL,
Streaming_Movies VARCHAR(20) NULL,
Streaming_Music	VARCHAR(20) NULL,
Unlimited_Data VARCHAR(20) NULL,
Contract VARCHAR(50) NULL,
Paperless_Billing VARCHAR(20) NULL,	
Payment_Method	VARCHAR(50) NULL,
Monthly_Charge FLOAT NULL,
Total_Charges FLOAT NULL,
Total_Refunds FLOAT NULL,
Total_Extra_Data_Charges INT NULL,	
Total_Long_Distance_Charges	FLOAT NULL,
Total_Revenue FLOAT NULL,
Customer_Status	VARCHAR(40) NULL,
Churn_Category VARCHAR(40) NULL,
Churn_Reason VARCHAR(200) NULL
);
SELECT * FROM customer_churn;
DESCRIBE customer_churn;

SET GLOBAL local_infile = 1;



-- loading data from csv file
LOAD DATA LOCAL INFILE 'D:/telecom_churn_analysis/Data/Customer_data.csv'
INTO TABLE customer_churn
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Customer_ID,@Gender,@Age,@Married,@State,@Number_of_Referrals,@Tenure_in_Months,
 @Value_Deal,@Phone_Service,@Multiple_Lines,@Internet_Service,@Internet_Type,
 @Online_Security,@Online_Backup,@Device_Protection_Plan,@Premium_Support,
 @Streaming_TV,@Streaming_Movies,@Streaming_Music,@Unlimited_Data,@Contract,
 @Paperless_Billing,@Payment_Method,@Monthly_Charge,@Total_Charges,@Total_Refunds,
 @Total_Extra_Data_Charges,@Total_Long_Distance_Charges,@Total_Revenue,
 @Customer_Status,@Churn_Category,@Churn_Reason)
SET
Customer_ID = NULLIF(@Customer_ID,''),
Gender = NULLIF(@Gender, ''),
Age = NULLIF(@Age, ''),
Married = NULLIF(@Married,''),
State = NULLIF(@State,''),
Number_of_Referrals = NULLIF(@Number_of_Referrals,''),
Tenure_in_Months = NULLIF(@Tenure_in_Months,''),
Value_Deal = NULLIF(@Value_Deal,''),
Phone_Service = NULLIF(@Phone_Service,''),
Multiple_Lines = NULLIF(@Multiple_Lines,''),
Internet_Service = NULLIF(@Internet_Service,''),
Internet_Type = NULLIF(@Internet_Type,''),
Online_Security = NULLIF(@Online_Security,''),
Online_Backup = NULLIF(@Online_Backup,''),
Device_Protection_Plan = NULLIF(@Device_Protection_Plan,''),
Premium_Support = NULLIF(@Premium_Support,''),
Streaming_TV = NULLIF(@Streaming_TV,''),
Streaming_Movies = NULLIF(@Streaming_Movies,''),
Streaming_Music = NULLIF(@Streaming_Music,''),
Unlimited_Data = NULLIF(@Unlimited_Data,''),
Contract = NULLIF(@Contract,''),
Paperless_Billing = NULLIF(@Paperless_Billing,''),
Payment_Method = NULLIF(@Payment_Method,''),
Monthly_Charge = NULLIF(@Monthly_Charge,''),
Total_Charges = NULLIF(@Total_Charges,''),
Total_Refunds = NULLIF(@Total_Refunds,''),
Total_Extra_Data_Charges = NULLIF(@Total_Extra_Data_Charges,''),
Total_Long_Distance_Charges = NULLIF(@Total_Long_Distance_Charges,''),
Total_Revenue = NULLIF(@Total_Revenue,''),
Customer_Status = NULLIF(@Customer_Status,''),
Churn_Category = NULLIF(@Churn_Category,''),
Churn_Reason = NULLIF(NULLIF(NULLIF(@Churn_Reason,''), '\N'), 'NULL')
;


SELECT * FROM customer_churn;
TRUNCATE TABLE customer_churn;



-- binary level inspection to get actuall NULL values in "Churn_Reason" column 
SELECT 
    Customer_ID,
    HEX(Churn_Reason) AS Hex_Value,
    LENGTH(Churn_Reason) AS Byte_Length,
    CHAR_LENGTH(Churn_Reason) AS Char_Length
FROM customer_churn
WHERE Churn_Reason IS NOT NULL
LIMIT 20;

-- assigning NULL in "Churn_Reason"
UPDATE customer_churn
	SET Churn_Reason = NULL
    WHERE hex(Churn_Reason) = '0D';



