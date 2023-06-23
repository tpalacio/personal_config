clear
rm cal_output.temp
for i in {6..0}; do cal -d $(date -v-"$i"m +%Y-%m) >> cal_output.temp ; done
for i in {1..6}; do cal -d $(date -v+"$i"m +%Y-%m) >> cal_output.temp ; done
less cal_output.temp
