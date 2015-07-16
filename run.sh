#!/bin/bash
# version 0.1
# Florin Badita baditaflorin@gmail.com
echo "Enter the name of the file, without the extension ( example : romania-latest.osm.pbf will be romania-latest  ) Press CTRL+Z to cancel"
read osmfile
echo "Setting 8 GB RAM for this task to the server"
set JAVACMD_OPTIONS= -Xmx8G
# execute osmosis command
osmosis --rbf $osmfile.osm.pbf --tf accept-relations type=route --tf --tf reject-relations route=junction --tf reject-relations route=detour  --tf reject-relations route=power --tf reject-ways --tf reject-nodes --wx routes.osm
xsltproc --stringparam updated "`date -r routes.osm "+%Y-%m-%d"`"  routeList.xsl routes.osm > public_html/index.html
echo -e "\vThis \vscript \vis \vdone \v \vCluj \vMap Analyst Team" 
