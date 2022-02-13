FROM --platform=linux/arm64 openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV URL=https://www.dropbox.com/s/2ghc836sk2iguw0/OneLifeServerv4.zip?dl=1
ENV INIT_MEM=2G
ENV MAX_MEM=3G

RUN apt-get update -y && apt-get install unzip wget -y --no-install-recommends 

RUN wget ${URL} -O mc.zip
RUN unzip mc.zip -d /data-temp

COPY ./start.sh start.sh
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]
