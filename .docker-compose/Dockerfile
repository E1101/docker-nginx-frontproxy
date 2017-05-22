FROM nginx:latest

MAINTAINER Payam Naderi <naderi.payam@gmail.com>

COPY ["./sh/*.sh", "/docker/bin/"]
RUN chmod a+x /docker/bin/*.sh \
    ## compatible with windows
    && sed -i -e 's/\r$//' /docker/bin/*.sh

CMD ["/docker/bin/run.sh"]
