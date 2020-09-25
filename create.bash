#!/bin/bash

echo -n "Item number: "
read  item_num
echo -n "Item name: "
read item_name
echo -n "Simple name: "
read simple_name
echo -n "Unit price: "
read unit_price
echo -n "Current quantity: "
read cur_qty
echo -n "Maximum quantity: "
read max_qty
echo -n "Description: "
read item_desc

line_One="${item_name} ${simple_name}"
line_Two="${unit_price} ${cur_qty} ${max_qty}"
line_Three="${item_desc}"

filename="./data/${item_num}.item"

if [ -s $filename ]; then
    echo "Error: item $item_num already exists"
else
    echo $line_One > $filename
    echo $line_Two >> $filename
    echo -e $line_Three >> $filename
    
    
    logs="`date "+[%Y-%m-%d %H:%M:%S]"` CREATED: ${item_num} - ${item_name} - ${cur_qty} / ${max_qty}"
    
    echo -e $logs >> ./data/queries.log
    
fi