shopt -s expand_aliases
source ~/.aliases

clear && read -e -p "Table name?
" TABLENAME \
clear && read -e -p "Unique column?
" COLUMN
echo $TABLENAME" ("$COLUMN"),count,min_id,max_id" > ~/query_uniqueness_results.csv \
&& echo "
    with data as (

        select
            $COLUMN as id,
            count(*) as count
        from $TABLENAME
        group by 1

    )

    select
        count,
        count(*),
        min(id) as min_id,
        max(id) as max_id
    from data
    group by 1
    order by 1;
" > ~/query.tmp
dw_root -X --csv -t -f ~/query.tmp >> ~/query_uniqueness_results.csv \
&& clear \
&& pspg --csv --csv-separator , --csv-header on --no-mouse ~/query_uniqueness_results.csv ;
rm ~/query_uniqueness_results.csv ;
rm ~/query.tmp
