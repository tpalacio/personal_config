shopt -s expand_aliases
source ~/.aliases

clear && read -p "Table name?
" TABLENAME \
&& echo $TABLENAME":" > ~/postgres_describe_table.tmp \
&& echo "
    select column_name, data_type from dbt_prod.unbound_views where st = '$TABLENAME' order by ordinal_position;
    select column_name, data_type from dbt_prod.bound_views where st = '$TABLENAME' order by ordinal_position;
    select column_name, data_type from dbt_prod.external_views where st = '$TABLENAME' order by ordinal_position;
" > table_name.tmp \
&& dw_root -X -t -f table_name.tmp >> ~/postgres_describe_table.tmp \
&& clear \
&& less ~/postgres_describe_table.tmp ;
rm ~/postgres_describe_table.tmp ;
rm ~/table_name.tmp
