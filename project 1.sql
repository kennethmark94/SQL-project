select *
from "orders"

select *
from "accounts"

select *
from "region"

select *
from "sales_reps"

select *
from "web_events"

---Q1---"day of the week that had the highest orders and who was the primary POC"
select *
from
(select  "primary_POC", to_char("Highest_sales_week" ,'day'), "Highest_sales_week", sum("amount") as "sum_total"
from
(select distinct a.primary_poc  "primary_POC", a.id, o.account_id, o.total "amount", o.occurred_at "Highest_sales_week"
from "accounts" a
join "orders" o
on a.id = o.account_id) as "table_one"
group by "primary_POC", "Highest_sales_week"
order by "sum_total" desc) table_two

Answer:
The day of the week with the highest orders is Monday(2016-11-07) and the Primary_poc is Kyoko Randall

-----Q2-------total_sales_made_by_Walmart_on_Saturday-------
select "name", to_char(occurred_at, 'day'), sum(total) as "total_quantity"
from "accounts" a
join "orders" o
on o.account_id = a.id
where trim(to_char(occurred_at, 'day')) = 'saturday' and "name" = 'Walmart'
group by "name", "occurred_at"
order by "total_quantity" desc

Answers:
The total sales made by Walmart is

------Q3------sales_rep_that_made_highest_sales_which_week_day_and_what_month
select *
from
(select distinct("name"), "week_day", to_char("week_day", 'month') "months", to_char("week_day", 'day') "day", sum("total_sales") as "sales_total"
from
(select s.name, o.occurred_at "week_day", o.total "total_sales"
from "sales_reps" s
join "orders" o
on s.region_id = o.id) as "table_one"
group by "name", "week_day"
order by "sales_total" desc) "table_two"

Answer:
The sales rep with the highest sales is Carletta Kosinski, the weekday is Thursday, in the month of November; I cant really interprete why her sales were high because i dont know what she was selling