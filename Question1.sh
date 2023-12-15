#!/bin/bash

# Check if the number of arguments is correct
if [ $# -ne 1 ]; then
    echo "Usage: $0 <positive integer>"
    exit 1
fi

# Check if the argument is a positive integer
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: Argument must be a positive integer."
    exit 1
fi

# Define the functions to calculate the sum and product of digits
function sum_of_digits {
    local n=$1
    local sum=0
    while [ $n -gt 0 ]; do
        ((sum += n % 10))
        ((n /= 10))
    done
    echo $sum
}

function product_of_digits {
    local n=$1
    local product=1
    while [ $n -gt 0 ]; do
        ((product *= n % 10))
        ((n /= 10))
    done
    echo $product
}

# Define the function to check if the number is a palindrome
function is_palindrome {
    local n=$1
    local reverse=0
    local original=$n
    while [ $n -gt 0 ]; do
        ((reverse = reverse * 10 + n % 10))
        ((n /= 10))
    done
    if [ $original -eq $reverse ]; then
        echo "The number $original is a palindrome."
    else
        echo "The number $original is not a palindrome."
    fi
}

# Prompt the user to choose an option
echo "Please choose an option:"
echo "1. Display the sum and the product of the digits of the number."
echo "2. Display whether the number is a palindrome or not."
read option

# Call the appropriate function based on the user's choice
case $option in
    1) sum=$(sum_of_digits $1)
       product=$(product_of_digits $1)
       echo "The sum of the digits of $1 is $sum."
       echo "The product of the digits of $1 is $product."
       ;;
    2) is_palindrome $1
       ;;
    *) echo "Error: Invalid option."
       exit 1
       ;;
esac
