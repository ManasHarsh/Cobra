FROM golang:latest

#Remove sh and replace with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh 

RUN mkdir /Cobra
COPY *.sh /Cobra

WORKDIR /Cobra

RUN touch /.dockerenv && \
     source /Cobra/setup.sh && \
     setupEnvironment && \
     setupAssets && \
     touch /Cobra/.installed

ENTRYPOINT [ "bash", "/Cobra/Cobra.sh" ]
