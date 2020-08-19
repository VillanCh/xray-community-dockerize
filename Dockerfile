FROM ubuntu

RUN apt update && apt install -y wget unzip curl vim

COPY download-latest-xray.sh /download-latest-xray.sh
RUN chmod +x /download-latest-xray.sh
RUN bash /download-latest-xray.sh

RUN curl -LJO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

WORKDIR /xray

# block
CMD tail -f