count=$(acpi -b | wc -l); 
sum=$(acpi -b | egrep -o '[0-9]{1,3}%' | tr -d '%' | xargs -I% echo -n '+%'); 
echo $(date +%s) Avg capacity: $(( sum / count ))%
