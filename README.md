# flowable-docker

```
docker run -d \
  --name=flowable \
  -p 9080:8080 \
  -e FLOWABLE_COMMON_APP_IDM-URL='http://localhost:8080/flowable-idm' \
  -e FLOWABLE_COMMON_APP_IDM-REDIRECT-URL='http://localhost:9080/flowable-idm' \
  -e FLOWABLE_COMMON_APP_IDM-URL.USER=admin \
  -e FLOWABLE_COMMON_APP_IDM-URL.PASSOWRD=test \
  -e FLOWABLE_MODELER_APP_DEPLOYMENT-API-URL='http://localhost:8080/flowable-task/process-api' \
  --restart=unless-stopped \
  kodality/flowable
```

add for own database:
```
  --link flowable-postgres \
  -e SPRING_DATASOURCE_DRIVER-CLASS-NAME='org.postgresql.Driver' \
  -e SPRING_DATASOURCE_URL='jdbc:postgresql://flowable-postgres:5432/flowable' \
  -e SPRING_DATASOURCE_USERNAME='flowable' \
  -e SPRING_DATASOURCE_PASSWORD='test' \
```
now you can navigate to http://localhost:9080/flowable-modeler/
