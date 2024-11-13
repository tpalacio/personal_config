shopt -s expand_aliases
source ~/.aliases

dw_root -X -c "select * from dbt_admin.active_queries;" > ~/active_query_results.txt

pspg --no-mouse ~/active_query_results.txt
