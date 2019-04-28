#!/bin/bash

if [ "$1" == "--list" ] ; then
j=`gcloud compute instances list | wc -l`
let i=j-1
cat <<EOF > inventory.json
{
EOF

for (( i; i <= j; i++ ))
do
host_name=`gcloud compute instances list | awk ' {print $1,$5} ' | sed -n ${i}p | awk ' {print $1} '`
ip_address=`gcloud compute instances list | awk ' {print $1,$5} ' | sed -n ${i}p | awk ' {print $2} '`
cat <<EOF >> inventory.json
    "$host_name": {
        "hosts": {
            "$host_name": {
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
