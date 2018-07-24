#!/bin/sh

cd /opt/cloud9 && \
bash bin/cloud9.sh \ 
     -w /workspace 
     -l 0.0.0.0 
     -p 8181 
     --username $C9_USERNAME 
     --password $C9_PASSWORD;