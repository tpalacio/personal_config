clear && read -e -p "Table name?
" TABLENAME && echo -e $TABLENAME":" > ~/databricks_describe_table.tmp && \
databricks-sql-cli -e "DESCRIBE TABLE EXTENDED $TABLENAME" --table-format psql >> databricks_describe_table.tmp && \
clear && less ~/databricks_describe_table.tmp ;
rm ~/databricks_describe_table.tmp ;
