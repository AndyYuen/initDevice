#! /bin/sh



USER='user:password'
export BASEURL="http://localhost:8080/kie-server/services/rest/server/containers/instances/Demo1"

curl -X POST -H 'X-KIE-ContentType: JSON' -H 'Content-type: application/json' -u $USER \
-d '{
"lookup":"alertStateful",
  "commands" : [ 
  {
    "insert" : {
      "object" : {"com.myspace.demo1.Alert": {
      "description" : "INIT",
      "value" : true
      }
    }}},
  {
      "fire-all-rules" : ""
  }]
}' \
$BASEURL
