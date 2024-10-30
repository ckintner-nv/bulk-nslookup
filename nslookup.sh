#!/bin/bash

#input and output files
input_file="nslookup_ips.txt"
output_file="nslookup_results.txt"

#check if input exists
if [[ ! -f $input_file ]]; then
        echo "Input file $input_file not found!"
        exit 1
fi

#Clear output file if it exists, or create it
> "$output_file"

#read each line from input
while IFS= read -r ip; do
        if [[ -n $ip ]]; then
                echo "Running nslookup for $ip..."
                #run nslookup and write to output
                {
                        echo "Results for $ip:"
                        nslookup "$ip"
                        echo "================================================================================================"
                } >> "$output_file"
        fi
done < "$input_file"

echo "nslookup results have been saved to $output_file"
