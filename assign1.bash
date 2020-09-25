#!/bin/bash
go=0
while [ $go ]; do
    
    echo -e "\nEnter one of the following actions or press CTRL-D to exit."
    echo "C - create a new inventory item"
    echo "R - read an existing inventory item"
    echo "U - update an existing inventory item"
    echo "D - delete an existing inventory item"
    echo "T - calculate total value of an inventory item"
    
    if ! read ans; then
        break
    fi
    
    case "$ans" in
        
        [Cc]) chmod u+x create.bash # [Cc] will allow user to input upper or lower case. Then give user excuting permission.
            ./create.bash
        ;;
        
        [Rr]) chmod u+x read.bash
            ./read.bash
        ;;
        
        [Uu]) chmod u+x update.bash
            ./update.bash
        ;;
        
        [Dd]) chmod u+x delete.bash
            ./delete.bash
        ;;
        
        [Tt]) chmod u+x total.bash
            ./total.bash
        ;;
        
        *) echo "ERROR: invalid option"
        ;;
    esac
done

