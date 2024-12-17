#!/bin/bash
history -r ~/history__describe_table
shopt -s expand_aliases
source ~/.aliases

clear && read -e -p "Table name?
" TABLENAME \
&& history -s "$TABLENAME" \
&& history -w ~/history__describe_table \
&& echo $TABLENAME"," > ~/postgres_describe_table.csv \
&& echo "
    select column_name, data_type from dbt_prod.unbound_views where st = replace('$TABLENAME', chr(34), '') order by ordinal_position;
    select column_name, data_type from dbt_prod.bound_views where st = replace('$TABLENAME', chr(34), '') order by ordinal_position;
    select column_name, data_type from dbt_prod.external_views where st = replace('$TABLENAME', chr(34), '') order by ordinal_position;
" > ~/table_name.tmp \
&& dw_root -X --csv -t -f ~/table_name.tmp >> ~/postgres_describe_table.csv \
&& clear \
&& pspg --csv --csv-header on --no-mouse ~/postgres_describe_table.csv ;
rm ~/postgres_describe_table.csv ;
rm ~/table_name.tmp
# && dw_root -X -t -f ~/table_name.tmp >> ~/postgres_describe_table.csv \
