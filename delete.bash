#!/bin/bash
function getnames(){
    read item_name simple_name
    read unit_price cur_qty max_qty
    read item_desc
}
read -p "Enter an item number: " item_num

filename="./data/${item_num}.item"



if [ ! -e $filename ]; then
    
    echo "ERROR: item $item_num found"
    
else
    getnames < $filename
    rm -r $filename
    
    logs="`date "+[%Y-%m-%d %H:%M:%S]"` DELETED: ${item_num} - ${item_name} - ${simple_name} - ${cur_qty}"
    echo -e $logs >> ./data/queries.log
fi