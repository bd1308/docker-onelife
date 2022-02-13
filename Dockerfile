FROM --platform=linux/arm64 openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV INIT_MEM=2G
ENV MAX_MEM=3G

RUN apt-get update -y && apt-get install unzip -y --no-install-recommends 

COPY ./onelife.zip onelife.zip
RUN unzip onelife.zip -d /data-temp

COPY ./start.sh start.sh
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]
