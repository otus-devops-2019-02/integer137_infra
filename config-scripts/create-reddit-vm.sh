#!/bin/sh
gcloud compute instances create reddit-app1 --boot-disk-size=10GB --image-family reddit-full --image-project=infra-235107 --machine-type=f1-micro --zone europe-west1-b --tags puma-server --restart-on-failure

