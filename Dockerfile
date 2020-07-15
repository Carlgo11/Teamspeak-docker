FROM ubuntu
WORKDIR /tmp
RUN apt update; apt install curl jq wget -y
COPY install.sh install.sh
COPY run.sh run.sh
RUN chmod +x install.sh
RUN useradd -Ms /bin/bash teamspeak
RUN ./install.sh
USER teamspeak
CMD ./run.sh