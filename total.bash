#!/bin/bash

read -p "Enter an item number: " item_num

filename="./data/${item_num}.item"

function getnames(){
    read item_name simple_name
    read unit_price cur_qty max_qty
    read item_desc
}
getnames < $filename

if [ ! -e $filename ]; then
    echo "ERROR: item $item_num not found"
    
else
    
    echo -n "$item_name - $simple_name - "
    
    echo "$unit_price * $cur_qty" | bc
    
fi