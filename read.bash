#!/bin/bash

read -p "Enter an item number: " item_num
filename="./data/${item_num}.item"

function getnames(){
    read item_name simple_name
    read unit_price cur_qty max_qty
    read item_desc
}

if [ ! -e $filename ];  then
    echo "ERROR: item $item_num not found"
else
    getnames < $filename
    
    echo -e "\nItem Number: $item_input"
    echo "Item Name: $item_name"
    echo "Simple Name: $simple_name"
    echo "Unit Price: $unit_price"
    echo "Quantity: $cur_qty / $max_qty"
    echo "Description: $item_desc"
    
fi