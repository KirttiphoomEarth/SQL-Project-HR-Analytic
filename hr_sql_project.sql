#------------------ 1. create table ---------------------------#
-- create table Employee(
-- 	employee_id int NOT null,
--     first_name	varchar(100),
-- 	last_name	varchar(100),
-- 	email	varchar(100),
-- 	hire_date date,	
-- 	team_id int
-- ); 

-- create table Salary(
-- 	employee_id int NOT null,
-- 	role varchar(100),
-- 	salary int
-- );

-- create table Team(
-- 	team_id int,
-- 	team_name varchar(100)
-- );

-- insert into Employee(employee_id, first_name, last_name, email, hire_date, team_id)
-- VALUES (1, 'Warde', 'Remon', 'wremon0@zimbio.com','2023-6-1', 1),
-- (2, 'Orlando', 'Groneway', 'ogroneway1@wikipedia.org', '2023-6-22', 1),
-- (3, 'Amalita', 'Shorland', 'ashorland2@npr.org', '2023-5-25', 1),
-- (4, 'Reinwald', 'Pickersail', 'rpickersail3@skyrock.com', '2023-6-24', 1),
-- (5, 'Ilario', 'Anfrey', 'ianfrey4@google.com','2023-1-2',1),
-- (6,'Davey', 'Frowen', 'dfrowen5@nsw.gov.au', '2023-3-3', 6),
-- (7, 'Leigha', 'Randlesome', 'lrandlesome6@alibaba.com', '2022-10-15', 6),
-- (8,'Junia', 'Yakovliv', 'jyakovliv7@artisteer.com', '2023-7-31', 6),
-- (9, 'Rochell', 'Waggatt', 'rwaggatt8@opera.com', '2023-4-15', 6),
-- (10, 'Moises', 'Ardley', 'mardley9@webnode.com', '2023-6-21', 6);

-- INSERT INTO Team (team_id, team_name)
-- VALUES (1, 'plan_A'),
-- (6, 'plan_B');

-- INSERT INTO Salary (employee_id, role, salary)
-- VALUES (1, 'Sales', 40153),
-- (2, 'Marketing', 46670),
-- (3, 'Legal', 71983),
-- (4, 'Sales', 15857),
-- (5, 'Software Engineer', 95174),
-- (6, 'Sales', 27819),
-- (7, 'Legal', 75323),
-- (8, 'Software Engineer', 90525),
-- (9, 'Tax Accountant', 85946),
-- (10, 'Marketing', 56575);

#------------------ 2. พนักงานในบริษัทเราเป็นใคร ทำตำแหน่งอะไร เงินเดือนเท่าไหร่ ทำงานตั้งแต่เมื่อไหร่ ? ---------------------------#
-- select first_name, last_name, email, hire_date, salary.role, salary.salary from employee
-- inner join salary ON employee.employee_id = salary.employee_id;

#------------------ข้อ 3 : พนักงานที่รับเข้าทำงาน 3 คนล่าสุดเป็นใคร อยู่ทีมไหน เข้ามาทำงานวันไหน ?---------------------------#
-- select first_name, last_name, email, team.team_name hire_date from employee
-- inner join team ON employee.team_id = team.team_id
-- order by hire_date desc
-- LIMIT 3;

#------------------ขข้อ 4 เงินเดือนเฉลี่ยของพนักงานแต่ละตำแหน่ง ?---------------------------#
-- select role, avg(salary) AS average_salary from salary
-- group by role;

-- SELECT 
--     S.role,
--     SUM(S.salary) * 1.0 / (SELECT SUM(salary) FROM Salary) AS proportion
-- FROM 
--     Team T
-- JOIN 
--     Employee E ON T.team_id = E.team_id
-- JOIN 
--     Salary S ON E.employee_id = S.employee_id
-- GROUP BY 
--   S.role;

#--ข้อ 5 : กำหนดให้ว่าพนักงานที่เงินเดือนสูงกว่า 75000 เรียกว่า Manager เงินเดือนไม่เกิน 45,000 เรียก Senior น้อยกว่านั้นเรียกว่า Staff--#
-- select 
-- 	E.employee_id, 
-- 	E.first_name,
--     E.last_name,
--     S.salary,
-- case
-- 	when salary >= 75000 THEN "Manager"
--     when salary >= 45000 AND salary <= 75000 THEN "Senior"	
--     ELSE "Staff"
-- END AS position
-- FROM employee E
-- left join salary S on E.employee_id = S.employee_id;

#------ข้อ 6 : ถ้ามีพนักงานเข้ามาในวันที่ 14-Oct-23 ตำแหน่ง Marketing เงินเดือน 45,000 บาท เงินเดือนเฉลี่ยล่าสุดของตำแหน่ง Marketing จะเป็นเท่าใด ?------#
-- insert into Employee(employee_id,hire_date)
-- VALUES (11,'2023-10-14');

-- insert into salary(employee_id, role, salary)
-- VALUES (11,'Marketing',45000);

-- select role, avg(salary) AS average_salary
-- from salary
-- group by role 
-- having role = 'Marketing';