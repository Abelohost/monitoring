/Device Id/ { counter += 1; device[counter] = $3 }
/Firmware state/ { state_drive[counter] = $3 }
/Inquiry/ { name_drive[counter] = $3 " " $4 " " $5 " " $6 }
/Media Error Count/ { media_error[counter] = $3 }
/Other Error Count/ { other_error[counter] = $3 }
 END {

for (i=1; i<=counter; i+=1) printf ( "Device %02d (%s) status is: %s Error: %d \n",
    device[i], 
    name_drive[i], 
    state_drive[i], 
    media_error[i] + other_error[i]);
}