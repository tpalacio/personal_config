clear && read -p "Table name?
" TABLENAME && echo -e $TABLENAME":" > ~/vertica_describe_table.tmp && echo "select c, data_type from rtrbi.columns where st = '$TABLENAME';" > table_name.tmp && /usr/local/bin/vsql -h vertica.analytics.renttherunway.it -U dbadmin -X -t -f table_name.tmp >> ~/vertica_describe_table.tmp && clear && less ~/vertica_describe_table.tmp
