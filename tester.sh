    #!/bin/bash
    tmp="tmpfile$$"
    matrix transpose $2 > $tmp
    cat $tmp
 while read line1 <&3 && read line2 <&4
    do
        #while read -a  word1 <line1 && read -a word1 <line1
         
        printf -- "%s" "$line1"
        printf -- "%s""$line2"
        for i in $line1
        do
            echo "$i"
        done
        
    done 3<$1 4<$tmp
    echo ""
rm -f $tmp
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