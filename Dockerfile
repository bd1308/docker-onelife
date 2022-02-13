FROM --platform=linux/arm64 openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV INIT_MEM=2G
ENV MAX_MEM=3G

RUN apt-get update -y && apt-get install wget unzip -y --no-install-recommends 
RUN wget --no-check-certificate -O onelife.zip 'https://drive.google.com/uc?export=download&id=14YrdOHc6pLjgQD-e3JHraXD4JrJxhHLf'
RUN unzip onelife.zip -d /data-temp

COPY ./start.sh start.sh
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]
