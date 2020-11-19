FROM pandeiro/lein:latest

EXPOSE 80

WORKDIR /app
COPY . /app
# ENTRYPOINT ["/bin/bash"]

RUN echo | lein upgrade
RUN lein deps
ENTRYPOINT ["/usr/bin/lein" , "run" , "interruptsoftware.run"]
