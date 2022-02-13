drop database if exists travel_onthego;
create database travel_onthego;

use travel_onthego;
drop table if exists passenger;
create table passenger (passenger_name varchar(50), category varchar(20), gender varchar(1),  
   boarding_city varchar(20), destination_city varchar(20), distance int, bus_type varchar(20));

drop table if exists price;   
create table price (bus_type varchar(20), distance int, price int); 
 
insert into passenger values ("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
insert into passenger values ("Anmol", "Non-AC","M", "Mumbai", "Hyderabad", 700, "Sitting");
insert into passenger values ("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
insert into passenger values ("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
insert into passenger values ("Udit", "Non-AC", "M", "Trivandrum", "Panaji", 1000, "Sleeper");
insert into passenger values ("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500, "Sitting");
insert into passenger values ("Hemant", "Non-AC", "M", "Panaji", "Mumbai", 700, "Sleeper");
insert into passenger values ("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into passenger values ("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

insert into price values ("Sleeper", 350, 770);
insert into price values ("Sleeper", 500, 1100);
insert into price values ("Sleeper", 600, 1320);
insert into price values ("Sleeper", 700, 1540);
insert into price values ("Sleeper", 1000, 2200);
insert into price values ("Sleeper", 1200, 2640);
insert into price values ("Sleeper", 1500, 2700);
insert into price values ("Sitting", 500, 620);
insert into price values ("Sitting", 600, 744);
insert into price values ("Sitting", 700, 868);
insert into price values ("Sitting", 1000, 1240);
insert into price values ("Sitting", 1200, 1488);
insert into price values ("Sitting", 1500, 1860);

select gender, count(gender) as No_of_Passengers from passenger where distance>=600 group by gender;

select min(price) as Minimum_ticket_price from price where bus_type = "Sleeper";

select passenger_name from passenger where passenger_name like 'S%';

select P.passenger_name, P.boarding_city, P.destination_city, P.bus_type, PR.price from passenger P
  inner join price PR on P.bus_type = PR.bus_type and P.distance=PR.distance;
  
select P.passenger_name, PR.price as ticket_price from passenger P, price PR 
    where P.bus_type = PR.bus_type = "Sitting" and P.distance = PR.distance = 1000;

select P.passenger_name, "Bangalore" as boarding_city, "Panaji" as destination_city, PR.bus_type, PR.price from passenger P 
		inner join price PR on P. distance = PR.distance
			where P.passenger_name = "Pallavi";
            
select distance from passenger group by distance having count(distance)=1 order by distance desc;

select passenger_name, distance, distance * 100/(select sum(distance) from passenger) as Percentage_of_distance
 from passenger group by passenger_name;
 
select distance, price,
case 
  when price>1000 then 'Expensive'
  when price>500 and price<1000 then 'Average Cost'
  else 'Cheap'
  end as price_category
  from price;
  
