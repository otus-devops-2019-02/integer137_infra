#!/bin/bash

if [ "$1" == "--list" ] ; then
j=`gcloud compute instances list | wc -l`
let i=j-1
cat <<EOF > inventory.json
{
EOF

for (( i; i <= j; i++ ))
do
hn=`gcloud compute instances list | awk ' {print $1,$5} ' | sed -n ${i}p | awk ' {print $1} '`
ip_address=`gcloud compute instances list | awk ' {print $1,$5} ' | sed -n ${i}p | awk ' {print $2} '`
ghn=`gcloud compute instances list | awk ' {print $1,$5} ' | sed -n ${i}p | awk ' {print $1} ' | sed -n '/.*-/s///p'`
cat <<EOF >> inventory.json
    "$ghn": {
        "hosts": {
            "$hn": {
              "ansible_host": "$ip_address"
            }
        }
    },
EOF

done
truncate -s-2 inventory.json
cat <<EOF >> inventory.json

}
EOF
fi
