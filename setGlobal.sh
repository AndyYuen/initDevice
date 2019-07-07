#! /bin/sh



USER='ayuen:Wky16694'
export BASEURL="http://localhost:8080/kie-server/services/rest/server/containers/instances/Demo1"

curl -X POST -H 'X-KIE-ContentType: JSON' -H 'Content-type: application/json' -u $USER \
-d '{
"lookup":"alertStateful",
  "commands" : [ {"set-global":
  {"identifier":"initDevice","object":
  {"com.myspace.mysql.InitDevice":{}}}}]}]
}' \
$BASEURL

