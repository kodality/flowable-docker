FROM flowable/all-in-one:6.4.0
WORKDIR /opt/tomcat

USER root

RUN apk --update add fontconfig ttf-dejavu
ENV TZ=Europe/Tallinn
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN rm -rf webapps/docs webapps/examples
RUN sed -i 's/<Engine /<Engine startStopThreads="0" /g' conf/server.xml ;\
    sed -i 's/<Host /<Host startStopThreads="0" /g' conf/server.xml ;

RUN wget http://central.maven.org/maven2/org/postgresql/postgresql/42.2.5/postgresql-42.2.5.jar &&\
    cp postgresql-42.2.5.jar lib/

USER tomcat
ENV FLOWABLE_COMMON_APP_IDM-URL='http://localhost:8080/flowable-idm' \
    FLOWABLE_MODELER_APP_DEPLOYMENT-API-URL='http://localhost:8080/flowable-task/app-api' \
    FLOWABLE_ASYNC-EXECUTOR-ACTIVATE='false' \
    FLOWABLE_ASYNC-HISTORY-EXECUTOR-ACTIVATE='false'

CMD ["bin/catalina.sh", "run"]