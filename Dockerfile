FROM 251607623447.dkr.ecr.us-east-1.amazonaws.com/groovy-docker:latest

COPY src/service.groovy /app/service.groovy
EXPOSE 5050

WORKDIR /app

RUN grape install io.ratpack ratpack-groovy 1.4.4 &&\
    grape install org.slf4j slf4j-simple 1.7.22 &&\    
    chmod -R g+rwX . && chmod 755 -R . &&\
    chmod -R g+rwX /opt && chmod 755 -R /opt 

CMD ["groovy","/app/service.groovy"]
