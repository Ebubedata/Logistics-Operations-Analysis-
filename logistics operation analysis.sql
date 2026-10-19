CREATE DATABASE logistics_operations;

use logistics_operations;

SELECT *
FROM drivers;

SELECT COUNT(*) AS total_drivers
FROM drivers;

SELECT *
FROM drivers
LIMIT 10;

DESCRIBE drivers;

ALTER TABLE drivers
ADD PRIMARY KEY (driver_id);

SELECT
    COUNT(*) AS total_rows,
    COUNT(driver_id) AS non_null_driver_ids,
    COUNT(DISTINCT driver_id) AS unique_driver_ids
FROM drivers;

ALTER TABLE drivers
MODIFY driver_id VARCHAR(20) NOT NULL;

show tables;

update drivers
set termination_date = null
where termination_date = ' ';

select hire_date, date_of_birth
from drivers
limit 10;

alter table drivers
modify hire_date datetime not null,
modify date_of_birth datetime not null;

alter table drivers
modify first_name varchar(50),
modify last_name varchar(50),
modify license_number varchar(30),
modify license_state varchar(20),
modify home_terminal varchar(50),
modify employment_status varchar(30),
modify cdl_class varchar(10);

describe drivers;

DESCRIBE trucks;

ALTER TABLE trucks
MODIFY truck_id VARCHAR(20) NOT NULL,
MODIFY make VARCHAR(50),
MODIFY vin VARCHAR(30),
MODIFY fuel_type VARCHAR(30),
MODIFY status VARCHAR(30),
MODIFY home_terminal VARCHAR(50);

ALTER TABLE trucks
ADD PRIMARY KEY (truck_id);

describe customers;

select annual_revenue_potential
from customers
limit 10;

select count(*) as
total_customers
from customers;

alter table customers
modify annual_revenue_potential
decimal(15,2);

alter table customers
modify customer_id varchar(20) not null,
modify customer_name varchar(100),
modify customer_type varchar(50),
modify primary_freight_type varchar(50),
modify account_status varchar(30);

alter table customers
add primary key (customer_id);

describe routes;

alter table routes
modify route_id varchar (20) not null,
modify origin_city varchar (50),
modify origin_state varchar (30),
modify destination_city varchar (50),
modify destination_state varchar (30);

alter table routes
add primary key (route_id);

select count(*)
from fuel_purchases;

select count(*)
from loads;

select count(*)
from trips;

describe trips;

alter table trips
modify trip_id varchar(20) not null,
modify driver_id varchar(20),
modify load_id varchar(20),
modify truck_id varchar(20),
modify trailer_id varchar(20),
modify dispatch_date datetime,
modify trip_status varchar(30);

select trip_id, count(*) as
count
from trips
group by trip_id
having count(*)>1;

alter table trips
add primary key (trip_id);

select count(*) as
matching_trips
from trips t
inner join loads l
on t.load_id = l.load_id;

select count(*) as
matching_trips
from trips t
inner join drivers d
on t.driver_id = d.driver_id;

select count(*) as
matching_trips
from trips t
inner join trucks tr
on t.truck_id = tr.truck_id;

select truck_id
from trips
limit 10;

select truck_id
from trucks
limit 10;

SELECT COUNT(*) AS total_trucks
FROM trucks;

describe trucks;

SELECT COUNT(*) AS matching_trips
FROM trips t
INNER JOIN trucks tr
    ON t.truck_id = tr.truck_id;
    
    SELECT COUNT(*) AS matching_loads
FROM loads l
INNER JOIN customers c
    ON l.customer_id = c.customer_id;
    
    describe loads;
    
    ALTER TABLE loads
MODIFY load_id VARCHAR(20) NOT NULL,
MODIFY customer_id VARCHAR(20),
MODIFY route_id VARCHAR(20),
MODIFY load_date DATETIME,
MODIFY load_type VARCHAR(30),
MODIFY load_status VARCHAR(30),
MODIFY booking_type VARCHAR(30);

SELECT load_id, COUNT(*) AS count
FROM loads
GROUP BY load_id
HAVING COUNT(*) > 1;

ALTER TABLE loads
ADD PRIMARY KEY (load_id);

describe fuel_purchases;

ALTER TABLE fuel_purchases
MODIFY fuel_purchase_id VARCHAR(20) NOT NULL,
MODIFY trip_id VARCHAR(20),
MODIFY truck_id VARCHAR(20),
MODIFY driver_id VARCHAR(20),
MODIFY purchase_date DATETIME,
MODIFY location_city VARCHAR(50),
MODIFY location_state VARCHAR(30),
MODIFY fuel_card_number VARCHAR(30);


SELECT fuel_purchase_id, COUNT(*) AS count
FROM fuel_purchases
GROUP BY fuel_purchase_id
HAVING COUNT(*) > 1;

ALTER TABLE fuel_purchases
ADD PRIMARY KEY (fuel_purchase_id);

SELECT COUNT(*) AS matching_purchases
FROM fuel_purchases fp
INNER JOIN trips t
    ON fp.trip_id = t.trip_id;
    
    SELECT COUNT(*) AS matching_purchases
FROM fuel_purchases fp
INNER JOIN trucks tr
    ON fp.truck_id = tr.truck_id;
    
    SELECT COUNT(*) AS matching_purchases
FROM fuel_purchases fp
INNER JOIN drivers d
    ON fp.driver_id = d.driver_id;
    
    -- Check Total Revenue by Load Status
SELECT 
    load_status,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY load_status;

-- Check Revenue by Customer
SELECT 
    customer_id,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY customer_id
ORDER BY total_revenue DESC;

-- Top 10 Customers by Revenue

SELECT 
    customer_id,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue by Booking Type

SELECT 
    booking_type,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY booking_type
ORDER BY total_revenue DESC;

-- Monthly Load Volume and Revenue

SELECT 
    DATE_FORMAT(load_date, '%Y-%m') AS month,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY month
ORDER BY month;

-- Top Routes by Revenue

SELECT 
    route_id,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY route_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Load Type Performance

SELECT 
    load_type,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY load_type
ORDER BY total_revenue DESC;

-- Load Status Performance

SELECT 
    load_status,
    COUNT(*) AS total_loads,
    SUM(revenue) AS total_revenue
FROM loads
GROUP BY load_status
ORDER BY total_revenue DESC;

-- Average Revenue per Load Type

SELECT 
    load_type,
    COUNT(*) AS total_loads,
    AVG(revenue) AS average_revenue
FROM loads
GROUP BY load_type
ORDER BY average_revenue DESC;

-- Revenue by Customer Type

SELECT 
    c.customer_type,
    COUNT(l.load_id) AS total_loads,
    SUM(l.revenue) AS total_revenue
FROM loads l
INNER JOIN customers c
    ON l.customer_id = c.customer_id
GROUP BY c.customer_type
ORDER BY total_revenue DESC;

-- Revenue by Route

SELECT 
    r.route_id,
    r.origin_city,
    r.destination_city,
    COUNT(l.load_id) AS total_loads,
    SUM(l.revenue) AS total_revenue
FROM loads l
INNER JOIN routes r
    ON l.route_id = r.route_id
GROUP BY 
    r.route_id,
    r.origin_city,
    r.destination_city
ORDER BY total_revenue DESC
LIMIT 10;

-- Average Revenue by Route

SELECT 
    r.route_id,
    r.origin_city,
    r.destination_city,
    COUNT(l.load_id) AS total_loads,
    ROUND(AVG(l.revenue), 2) AS average_revenue
FROM loads l
INNER JOIN routes r
    ON l.route_id = r.route_id
GROUP BY 
    r.route_id,
    r.origin_city,
    r.destination_city
ORDER BY average_revenue DESC
LIMIT 10;

-- Driver Performance

SELECT 
    d.driver_id,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    COUNT(t.trip_id) AS total_trips,
    SUM(t.actual_distance_miles) AS total_distance_miles
FROM trips t
INNER JOIN drivers d
    ON t.driver_id = d.driver_id
GROUP BY 
    d.driver_id,
    d.first_name,
    d.last_name
ORDER BY total_trips DESC
LIMIT 10;

-- Truck Performance

SELECT 
    tr.truck_id,
    tr.make,
    tr.model_year,
    COUNT(t.trip_id) AS total_trips,
    SUM(t.actual_distance_miles) AS total_distance_miles
FROM trips t
INNER JOIN trucks tr
    ON t.truck_id = tr.truck_id
GROUP BY 
    tr.truck_id,
    tr.make,
    tr.model_year
ORDER BY total_trips DESC
LIMIT 10;

-- Total Fuel Spending

SELECT 
    COUNT(*) AS total_fuel_purchases,
    SUM(gallons) AS total_gallons,
    SUM(total_cost) AS total_fuel_cost,
    AVG(price_per_gallon) AS average_price_per_gallon
FROM fuel_purchases;

-- Fuel Spending by Truck

SELECT 
    truck_id,
    COUNT(*) AS fuel_purchases,
    SUM(gallons) AS total_gallons,
    SUM(total_cost) AS total_fuel_cost
FROM fuel_purchases
GROUP BY truck_id
ORDER BY total_fuel_cost DESC
LIMIT 10;

-- Fuel Spending by Driver

SELECT 
    fp.driver_id,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    COUNT(fp.fuel_purchase_id) AS fuel_purchases,
    SUM(fp.gallons) AS total_gallons,
    SUM(fp.total_cost) AS total_fuel_cost
FROM fuel_purchases fp
INNER JOIN drivers d
    ON fp.driver_id = d.driver_id
GROUP BY 
    fp.driver_id,
    d.first_name,
    d.last_name
ORDER BY total_fuel_cost DESC
LIMIT 10;

-- Top 10 Customers Using a CTE

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue
    FROM loads
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- Rank Customers by Total Revenue

SELECT
    customer_id,
    SUM(revenue) AS total_revenue,
    RANK() OVER (ORDER BY SUM(revenue) DESC) AS revenue_rank
FROM loads
GROUP BY customer_id
ORDER BY revenue_rank;