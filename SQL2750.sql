select dr.gender, count(dn.id) as total_donations from Donors dr
join Donations dn on dr.id = dn.donor_id
group by dr.gender