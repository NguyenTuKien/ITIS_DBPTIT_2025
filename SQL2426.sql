select sum(subscription_fee) as num_revenue from (
  select subscription_fee, date from mobile_subscribers
  union all 
  select subscription_fee, date from broadband_subscribers
) as subcripbers
where date between '2025-03-01' AND '2025-03-31';
