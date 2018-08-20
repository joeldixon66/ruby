FROM joeldixon66/rubybase:2.4.1

COPY init_container.sh /bin/
COPY startup.sh /opt/
COPY sshd_config /etc/ssh/
COPY hostingstart.html /home/site/wwwroot/hostingstart.html
COPY staticsite.rb /opt/staticsite.rb

#RUN printf "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get update -qq \
    && apt-get install -y nodejs openssh-server vim curl wget openssl imagemagick tcptraceroute --no-install-recommends \
    && echo "root:Docker!" | chpasswd \
    && echo "cd /home" >> /etc/bash.bashrc

#RUN ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.2 /usr/lib/libssl.so.1.0.2
#RUN ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.2 /home/libssl.so.1.0.2
#RUN ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.2 /home/site/wwwroot/libssl.so.1.0.2

RUN eval "$(rbenv init -)" \
  && rbenv global 2.4.1

RUN chmod 755 /bin/init_container.sh \
  && mkdir -p /home/LogFiles/ \
  && chmod 755 /opt/startup.sh

EXPOSE 2222 80

ENV PORT 80
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot

ENTRYPOINT [ "/bin/init_container.sh" ]
