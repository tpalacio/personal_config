clear && read -e -p "Table name?
" TABLENAME && echo -e $TABLENAME":" > ~/bigquery_describe_table.tmp && \
echo "select c, data_type from system.columns where st = '$TABLENAME';" > table_name.tmp && \
bq query --use_legacy_sql=false < table_name.tmp \
>> ~/bigquery_describe_table.tmp && clear && less ~/bigquery_describe_table.tmp ;
rm ~/postgres_describe_table.tmp ;
rm ~/table_name.tmp
