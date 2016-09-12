#!/bin/bash
file=./all.arp
#grep "12AmesAmmac0001:C952TANXX:5:250595956" $1
#grep "13AmesAmmac0001:C952TANXX:5:250596021" $1
#grep "14AmmesAmmac0001:C952TANXX:5:250596026" $1
#grep -A1 "13AmesAmmac0119:C952TANXX:5:250596015" $file | sed 's/\?//g' | sed 's/ //g' | wc -c
#grep -A1 "13AmesAmmac0122:C952TANXX:5:250596023" $file | sed 's/\?//g' | sed 's/ //g' | wc -c
#grep -A1 "12AmesAmmac0007:C952TANXX:5:250596051" $file | sed 's/\?//g' | sed 's/ //g' | wc -c
#grep "13AmesAmmac0119:C952TANXX:5:250596015" $file | cut -f 4- | sed 's/\?//g' | sed 's/ //g' | wc -c
#grep "13AmesAmmac0122:C952TANXX:5:250596023" $file | cut -f 4- | sed 's/\?//g' | sed 's/ //g' | wc -c
#grep "12AmesAmmac0007:C952TANXX:5:250596051" $file | cut -f 4- | sed 's/\?//g' | sed 's/ //g' | wc -c
echo "13AmesAmmac0119:C952TANXX:5:250596015"
grep -A1 "13AmesAmmac0119:C952TANXX:5:250596015" $file | sed 's/ /\n/g' | sort | uniq -c
echo "13AmesAmmac0122:C952TANXX:5:250596023"
grep -A1 "13AmesAmmac0122:C952TANXX:5:250596023" $file | sed 's/ /\n/g' | sort | uniq -c
