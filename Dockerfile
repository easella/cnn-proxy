FROM ubuntu:18.04

# install nginx, git, and curl
RUN sudo apt-get update
RUN  apt-get upgrade # this is recommended, but it's optional

# install nodejs
RUN sudo apt-get install git
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install nginx
RUN sudo apt-get install lua-nginx-redis
RUN git clone https://github.com/scheng123/cnn-proxy.git ~/cnn-proxy
RUN sudo cp ~/cnn-proxy/nginx.conf /etc/nginx/nginx.conf
RUN sudo service nginx restart
RUN cd ~/cnn-proxy
RUN npm install
RUN sudo npm install -g pm2
RUN pm2 start index.js
RUN sudo pm2 startup
RUN pm2 save
