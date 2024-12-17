#!/bin/bash
history -r ~/history__query_uniqueness__table
shopt -s expand_aliases
source ~/.aliases

clear && read -e -p "Table name?
" TABLENAME \
&& history -s "$TABLENAME" \
&& history -w ~/history__query_uniqueness__table \
&& history -c \
&& history -r ~/history__query_uniqueness__column
clear && read -e -p "Unique column?
" COLUMN \
&& history -s "$COLUMN" \
&& history -w ~/history__query_uniqueness__column \
&& history -c \
&& history -r ~/history__query_uniqueness__filter
COLUMN="${COLUMN:-id}"
clear && read -e -p "Filter?
" FILTER \
&& history -s "$FILTER" \
&& history -w ~/history__query_uniqueness__filter \
&& history -c \
FILTER="${FILTER:-True}"
echo $TABLENAME" ("$COLUMN"),count,min_id,max_id" > ~/query_uniqueness_results.csv
echo "
    with data as (

        select
            $COLUMN as id,
            count(*) as count
        from $TABLENAME
        where $FILTER
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
