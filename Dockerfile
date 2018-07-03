FROM tomcat:9-alpine

ENV FLOWABLE_VERSION=6.3.1

ENV TZ=Europe/Tallinn
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm -rf webapps/docs webapps/examples
RUN sed -i 's/<Engine /<Engine startStopThreads="0" /g' conf/server.xml ;\
    sed -i 's/<Host /<Host startStopThreads="0" /g' conf/server.xml ;

RUN wget https://github.com/flowable/flowable-engine/releases/download/flowable-${FLOWABLE_VERSION}/flowable-${FLOWABLE_VERSION}.zip &&\
    unzip flowable-${FLOWABLE_VERSION}.zip &&\
    mv flowable-${FLOWABLE_VERSION}/wars/* webapps
RUN wget http://central.maven.org/maven2/org/postgresql/postgresql/42.2.1/postgresql-42.2.1.jar &&\
    cp postgresql-42.2.1.jar lib/

CMD ["bin/catalina.sh", "run"]

