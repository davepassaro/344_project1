    #!/bin/bash
    #tmp="tmpfile$$"
    #touch $tmp
    #matrix transpose $2 > $tmp
    #cat $tmp
 #while read line1 <&3 && read line2 <&4
 #   do
        #while read -a  word1 <line1 && read -a word1 <line1
 #        
 #      # printf -- "%s" "$line1"
        #printf -- "%s""$line2"
 #       for i in $line1
 #       do
 #           echo ""
 #       done
        
 #   done 3<$1 4<$tmp
 #   echo "next"
    
    tmp="tmpColFile$$"
    touch $tmp #named with PID
    #fnlCol="fnlColFile"
    #touch $fnlCol$$ #named with PID
    final="FinalFile$$"
    touch $final #named with PID
    matrix dim $1 > $final #get the size with dim --count = rows lineNum = col
    counter=0


   # cat $tmpCol$$
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
    matrix dim $2 > $final #get the size with dim --count = rows lineNum = col
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
    echo "$r1 $c1 $r2 $c2"







    printf "h" > $final
    #cat $final
    i=1

    while [ $i -le $r1 ]
    do
        j=1
        while [ $j -le $c1 ]
        do  
            k=1
            #while [ $k -le $c1 ]
            #do  
                cat $1 | head -n $i | tail -n 1 | cut -f $j > $tmp  #throw specified line in tmpCol file y
                val1=$(<$tmp)
                echo "val1= $val1"

                #echo "$x"
                #((k++))
            #done
            ((j++))
        done
        #echo "i= $i"
        ((i++))
    done
    
    #cat  $final$$  #test tabs newlines
    #rm -f $fnlCol$$ #get rid of tempfile
    #rm -f $tmpCol$$ #get rid of tempfile
    #rm -f $final$$ #get rid of tempfile

#rm -f $tmp
#            while read -a  word1 <&5 && read -a word1 <&6
 #       do 
  #          echo "$word1"
   #         echo "$word2"
    #    done 5<$tmpCol$$ 6<$fnlCol$$


    #while [ $l -le $count ] #for each number in 1 line (should be same)
      #  do 
           # cut -f $l  $tmpCol$$ > #cut fields of cols one by one put in tmpCol
        #cat $tmpCol$$
         #   l=`expr $l + 1`

       # done

        #cat $tmpCol$$