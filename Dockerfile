# Install Operating system and dependencies
FROM ubuntu:20.04

RUN apt-get update 
RUN apt-get install -y curl -y
RUN apt-get install -y git -y
RUN apt-get install -y wget -y
RUN apt-get install -y unzip -y 
RUN DEBIAN_FRONTEND='noninteractive' apt-get install -y libgconf-2-4 -y 
RUN apt-get install -y gdb -y 
RUN apt-get install -y libstdc++6 -y 
RUN apt-get install -y libglu1-mesa -y 
RUN apt-get install -y fonts-droid-fallback -y 
RUN apt-get install -y lib32stdc++6 -y
RUN apt-get install -y python3 -y
RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor 

# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web --release --dart-define-from-file=.env

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]