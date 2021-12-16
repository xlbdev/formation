#!/usr/bin/env bash
echo "checking brew"
bdr=$(brew doctor > /dev/null 2>&1)
if $? ;
then    
    echo "we are good"
else    
    echo "uh oh. Brew is not happy. Do you want to have a look?"
    echo $bdr
    options=("Yes" "No" "Quit")
    select opt in "${options[@]}"
    do
    case $opt in
        "Yes")
            printf(bdr)
            ;;
        "No")
            echo "skipping"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
fi

