FROM --platform=linux/arm64 openjdk:8-jdk                                                                                                                          
WORKDIR /

EXPOSE 25565

VOLUME [ "/data" ]

ENV INIT_MEM=2G
ENV MAX_MEM=3G

RUN apt-get update -y && apt-get install wget unzip -y --no-install-recommends 
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=14YrdOHc6pLjgQD-e3JHraXD4JrJxhHLf' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=14YrdOHc6pLjgQD-e3JHraXD4JrJxhHLf" -O onelife.zip && rm -rf /tmp/cookies.txt
RUN unzip onelife.zip -d /data-temp

COPY ./start.sh start.sh
RUN chmod +x ./start.sh

ENTRYPOINT [ "./start.sh" ]
