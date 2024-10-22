----create a join table 
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r
on a.Reason_for_absence = r.Number;

----find the healthiest
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 
and Body_mass_index <25 and 
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

--compensation rate increase for non smokers /budget $983,221 0.68cents per hour increase per hour/ $1,414.4 per year
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker =0

----optimize this query (Create a seasons column with CASE statement) 
select a.ID, r.Reason, Body_mass_index, Month_of_absence,
CASE WHEN Body_mass_index <18.5 THEN 'Underweight'
	WHEN Body_mass_index between 18.5 and 24.9 THEN 'Healthy'
	WHEN Body_mass_index between 25 and 30 THEN 'Overweight'
	WHEN Body_mass_index >30 THEN 'Obese'
	ELSE 'Unknown' END as BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
	WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
	WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
	WHEN Month_of_absence IN (9,10,11) THEN 'Fall'
	ELSE 'Unknown' END as Season_Names,
Month_of_absence, 
Day_of_the_week,
Transportation_expense,
Distance_from_Residence_to_Work,
Service_time,
Age,
Work_load_Average_day,
Hit_target,
Disciplinary_failure,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Height,
Weight,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on a.Reason_for_absence =r.Number

