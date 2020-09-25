#!/bin/bash

echo -n -e "\nItem number: "
read  item_num
echo -n "Item name: "
read ItemName
echo -n "Simple name: "
read SimpleName
echo -n "Unit price: "
read UnitPrice
echo -n "Current quantity: "
read CurQty
echo -n "Maximum quantity: "
read MaxQty
echo -n "Description: "
read ItemDesc

function getnames(){
    read item_name simple_name
    read unit_price cur_qty max_qty
    read item_desc
}

filename="./data/${item_num}.item"
#if file does not exist
if [ ! -e $filename ];  then
    echo -e "\nERROR: item $item_num not found"
    
else
    getnames < $filename
    
    #if the input is for line 1 is blank
    if [ -z "$ItemName" ]; then
        if [ -z "$SimpleName" ]; then
            echo  "$item_name $simple_name" > $filename  #both are empty
        else
            echo "$item_name $SimpleName" > $filename #only left is empty
        fi
    fi
    if [ ! -z "$ItemName" ]; then
        if [ ! -z "$SimpleName" ]; then
            echo  "$ItemName $SimpleName" > $filename  #neither empty
        else
            echo "$ItemName $simple_name" > $filename #only right is empty
        fi
    fi
    
    # Going to check if line 2 has empty variables.
    if [ -z "$UnitPrice" ]; then # variable number 1
        if [ -z "$CurQty" ]; then # variable number 2
            if [ -z "$MaxQty" ]; then #variable number 3
                echo "$unit_price $cur_qty $max_qty" >> $filename #all var are empty
            else
                echo "$unit_price $cur_qty $MaxQty" >> $filename #var 3 is not empty
            fi
        else
            if [ -z $MaxQty ]; then
                echo "$unit_price $CurQty $max_qty" >> $filename # var 2 is only one not empty
            else
                echo "$unit_price $CurQty $MaxQty" >> $filename #  var 1 & 3 are not empty
            fi
        fi
    fi
    #  ------------------------------------------- Test good
    
    if [ ! -z "$UnitPrice" ]; then  
        if [ -z "$CurQty" ]; then
            if [ -z "$MaxQty" ]; then
                echo "$UnitPrice $cur_qty $max_qty" >> $filename   
            else
                echo "$UnitPrice $cur_qty $MaxQty" >> $filename  
            fi
        else
            if [ -z $MaxQty ]; then
                echo "$UnitPrice $CurQty $max_qty" >> $filename
            else
                echo "$UnitPrice $CurQty $MaxQty" >> $filename
            fi
        fi
    fi
    
    
    # this will check line 3 (the last one).
    if [ -z "$ItemDesc" ]; then
        echo "$item_desc" >> $filename
    else
        echo "$ItemDesc" >> $filename
    fi
    getnames < $filename
    logs="`date "+[%Y-%m-%d %H:%M:%S]"` UPDATED: ${item_num} - ${item_name} - ${cur_qty} / ${max_qty}"
    echo -e $logs >> ./data/queries.log
fi