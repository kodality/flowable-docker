# flowable-docker

docker run -d --name=$name \
  -p 9080:8080 \
  --link workflow-postgres \
  -e SPRING_DATASOURCE_DRIVER-CLASS-NAME='org.postgresql.Driver' \
  -e SPRING_DATASOURCE_URL='jdbc:postgresql://workflow-postgres:5432/workflow' \
  -e SPRING_DATASOURCE_USERNAME='wfm_app' \
  -e SPRING_DATASOURCE_PASSWORD='test' \
  -e FLOWABLE_COMMON_APP_IDM-URL='http://localhost:8080/flowable-idm' \
  -e FLOWABLE_COMMON_APP_IDM-REDIRECT-URL='http://localhost:9080/flowable-idm' \
  -e FLOWABLE_COMMON_APP_IDM-URL.USER=admin \
  -e FLOWABLE_COMMON_APP_IDM-URL.PASSOWRD=test \
  -e FLOWABLE_MODELER_APP_DEPLOYMENT-API-URL='http://localhost:8080/flowable-task/process-api' \
  --restart=unless-stopped \
  kodality/flowable
