select id, union_name, state, member_count from Union_Info
where member_count > 5000 and state = 'California'