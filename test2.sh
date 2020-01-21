    #!/bin/bash

    
    tmp="tmpColFile$$"
    touch $tmp #named with PID

    final="FinalFile$$"
    touch $final #named with PID
    matrix dim $1 > $final #get the size with dim --   r1= rows c1  = col of first matrix
    counter=0
    #grab the dimentions of the 2 matricies
    while read line; do
        for word in $line; do
            if [ $counter -eq 0 ]
                then
                   
                    r1=$word
                else 
                    c1=$word
                    
                fi
            ((counter++))
        done
    done <  $final
    matrix dim $2 > $final #get the size with dim --  r2 = rows c2 = col of second matrix input
    counter=0
    while read line; do
        for word in $line; do
            if [ $counter -eq 0 ]
                then
               
                    r2=$word
                else 
                    c2=$word
   
                fi
            ((counter++))
        done
    done < $final
    printf "" > $final
    i=1
    sum=0
    while [ $i -le $r1 ]
    do
        j=1
        while [ $j -le $c2 ]
        do  
            k=1
            while [ $k -le $c1 ]
            do  
                cat $1 | head -n $i | tail -n 1 | cut -f $k > $tmp  #throw specified line in tmpCol file y
                a=$(<$tmp)
                cat $2 | head -n $k | tail -n 1 | cut -f $j > $tmp  #throw specified line in tmpCol file y
                b=$(<$tmp)
                sum=$(( $sum+($a * $b) ))
                ((k++))
            done

            if [ $j -eq $c2 ]
            then
                printf -- "%s\n" "$sum" >> $final 
            else 
                printf -- "%s\t" "$sum" >> $final 
            fi
            sum=0
            ((j++))
        done
        ((i++))
    done
    
    cat -A $final  #test tabs newlines
    rm -f $tmp #get rid of tempfile
    rm -f $final #get rid of tempfile

