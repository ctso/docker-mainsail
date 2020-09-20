FROM nginx:1.19.2

RUN apt-get update -qy && apt-get install -qy wget unzip

WORKDIR /usr/share/nginx/html
RUN wget -q -O mainsail.zip https://github.com/meteyou/mainsail/releases/download/v0.2.2/mainsail-beta-0.2.2.zip && \
      unzip -o mainsail.zip && \
      rm mainsail.zip
