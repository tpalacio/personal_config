shopt -s expand_aliases
source ~/.aliases

dw_root -X -c "select pid, trim(user_name) as "user_name", starttime as start_time, (duration / 1000000) || 's' as duration, query as sql from stv_recents as s where status = \$\$Running\$\$ and query not ilike \$\$%stv_recents%\$\$ order by s.duration desc;" > active_query_results.txt

less active_query_results.txt
