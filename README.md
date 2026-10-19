# Logistics-Operations-Analysis-

Logistics Operations Analysis (2022–2024)

## Project Overview

This project analyses logistics operations data from 2022 to 2024 using MySQL and Power BI. It explores customer activity, revenue, trips, fleet operations, fuel expenditure, loads, and routes to provide a clearer view of logistics performance.

## Business Problem

Logistics companies manage large amounts of operational data across customers, trips, loads, vehicles, and fuel purchases. When this information is spread across multiple tables, it can be difficult to monitor performance, compare operational costs, and understand activity across different parts of the business.

This project uses SQL and Power BI to organise and analyse logistics data, helping answer important business questions about revenue, customer activity, fleet operations, fuel expenditure, and route performance.

## Project Objectives

- Analyse logistics activity and revenue trends.
- Examine customer characteristics and activity.
- Compare truck utilisation, trip activity, and fuel expenditure.
- Investigate load volumes and route performance.
- Build an interactive dashboard for exploring operational data.

## Tools & Technologies

- MySQL: Data exploration and SQL analysis.
- MySQL Workbench: Database management and query execution.
- Power BI: Data modelling, and interactive visualisations.
- GitHub: Project documentation and version control.

## Dashboard Pages

1. Logistics Overview

- Monthly trip trends
- Top 10 customers by revenue
- Revenue by booking type
- Trips by driver
- KPI cards: Total Trailers, Total Loads, Total Revenue, and Total Distance

2. Customer Analysis

- Customers by freight type
- Customer acquisition trends
- Customer distribution by type
- Customer distribution by credit terms

3. Fleet and Fuel Analysis

- Fuel expenditure by year
- Fuel expenditure by truck
- Distance travelled by truck
- Number of trips by truck

4. Load and Route Analysis

- Monthly load trends
- 
- Load weight by route
- Loads by type
- Top customers by load volume
- Route performance matrix comparing actual distance, fuel expenditure, and revenue

## Dataset

Source: Kaggle
Dataset: Logistics Operations Database (2022–2024)
Creator: Yogape Rodriguez

The dataset contains approximately 361,799 records across 14 tables, covering different aspects of logistics operations.

[Insert the original Kaggle dataset link here.]

## Methodology

1. Explored the relational database using MySQL Workbench.
2. Used SQL to query and analyse operational data.
3. Reviewed data quality issues and relationships between tables.
4. Connected MySQL to Power BI and created relationships between relevant tables.
5. Developed a four-page dashboard to visualise logistics performance.

## Business Insights

- Customers: there are 200, split fairly evenly by type (31%, 31.5%, 37.5%).
- Acquisition: new customers peak in June (24) and are lowest in October (12). Monthly figures range from 12 to 24.
- Industries: Automotive leads (41), then Food/Beverage (37) and Retail (35). General is lowest (24).
- Credit terms: about 55 customers sit in the longest-term bucket (~60 days). That is a cash-flow risk worth tracking.
- Revenue concentration is low: First Group (18.6M) and XYZ Wholesale (14.8M) lead, but the top 10 customers total ~116M.
- Dedicated bookings bring ~33M, about double Contract (17M) or Spot (16M). This is the best segment to grow.
- Loads: steady at ~2.2K to 2.5K a month. February is lowest (2,179) and August highest (2,496).
- Load mix: Refrigerated and Dry Van are a near 50/50 split.
- Route RTE00025: it has the longest distance (1.2M miles) but the lowest revenue per mile (~$1.61, against $2.3 to $2.6 on other top routes). Check its pricing.
- Fleet utilization is very even: the top trucks run 656 to 681 trips and 0.94M to 0.99M miles each. No outliers.
- Fuel spend is falling: 4.1M, 3.7M, then 3.5M.
- Trips: January spikes (6.6K), then they hold flat at ~4.7K a month, so there is no seasonality.

## Business Recommendations 
