with gbalance as (
	select user_id, type, currency_id, sum(money) as volume
    	from balance
    	group by user_id, type, currency_id
),
gcurrency as (
	select id, name, rate_to_usd, updated 
	from currency
	group by id, name, rate_to_usd, updated 
), 
rate as (
	select distinct id, currency."name", currency.rate_to_usd
	from balance b
	full join currency on currency.id = b.currency_id 
	where currency.updated = (SELECT MAX(updated) FROM currency)
)
select coalesce ("user".name, 'not defined') as name,
       coalesce ("user".lastname, 'not defined') as lastname,
       type,
       volume,
       coalesce (gcurrency.name, 'not defined') as currency_name,
       coalesce (rate.rate_to_usd, 1) as last_rate_to_usd,
       (volume * coalesce(rate.rate_to_usd, 1)) as total_volume_in_usd
from gbalance b 
full join "user" on b.user_id = "user".id
full join gcurrency on b.currency_id = gcurrency.id
full join rate on b.currency_id = rate.id
group by "user".name, "user".lastname, b."type", volume, gcurrency.name, rate.rate_to_usd
order by name desc, lastname, type
