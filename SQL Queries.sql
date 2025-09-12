create database bank_loan;
use bank_loan;

#1.Total funded Amount
select sum(fundedamount) Total_funded_amount from bank;

#2.Statewise Loan
select distinct statename,sum(fundedamount) as LoanAmount from bank
group by 1 order by 2 asc;

#3.Religionwise Loan
select distinct religion,sum(fundedamount) as LoanAmount from bank
group by 1 order by 2 asc;

#4.Purpose Category wise Loan
select distinct purposecategory,sum(fundedamount) as LoanAmount from bank
group by 1 order by 2 asc;

#5.Grade wise Loan
select distinct grade,sum(fundedamount) Funded_Amt from bank
group by 1 order by 1 asc;

#6.Age wise client count
select distinct age,count(clientid) Client_Count from bank
group by 1 order by 2 desc;

#7.Age wise Loan
select distinct age,sum(fundedamount) Total_LoanAmt from bank
group by 1 order by 2 desc;

#8.Delinquent client count
select count(clientid) from bank
where isdelinquentloan="Y";

#9.Default client Count
select count(clientid) from bank
where isdefaultloan="Y";

#10.Disbursement trends(Year & Month)
select year,Month_Name,Disbursed_Amt from (select year(disbursementdate_converted) Year ,
month(disbursementdate_converted)Month_No,monthname(disbursementdate_converted)Month_Name,sum(fundedamount) Disbursed_Amt from bank
group by 1,2,3 order by 1,2)a;

#11.total client count
select count(clientid) Client_Count from bank;

#12.Total Collection
select sum(totalpymntinv+totalrecprncp+totalfees+totalreclatefee+totalrecint) Total_collection
from bank;

#13.Total interest
select sum(totalrecint) Total_interest from bank;





select concat(sum(totalrecint)/100000,"L") Total_interest from bank;


select distinct year(disbursementdate_converted),sum(fundedamount) from bank
group by 1;


alter table bank
modify column disbursementdate date;
alter table bank
add column disbursementdate_converted date;
desc bank;
UPDATE bank
SET disbursementdate_converted = STR_TO_DATE(disbursementdate, '%d-%m-%Y');
ALTER TABLE bank
CHANGE `totalrrec int` totalrecint INT;
desc bank;

select * from bank
where statename ="Jharkhand" and
year(disbursementdate_converted)=2020 and
Monthname(disbursementdate_converted)="January";
