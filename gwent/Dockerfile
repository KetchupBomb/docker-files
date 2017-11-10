FROM mpneuried/nodejs-alpine-buildtools-gm:latest
LABEL maintainer="mail@lolnope.us"

# Used for build-time configuration
ARG DIR=/not-gwent-online
ARG WEBSERVER_PORT=80
ARG WEBSOCKET_PORT=8080

RUN git clone https://github.com/exane/not-gwent-online.git ${DIR}
WORKDIR ${DIR}
RUN npm install && \
	npm run build

COPY start.sh start.sh
# RUN sed -i "s/_DIR_/${DIR}/" start.sh

EXPOSE ${WEBSERVER_PORT}/tcp ${WEBSOCKET_PORT}/tcp
ENTRYPOINT ["bash", "./start.sh"]
CMD [ \
	"--bind", "0.0.0.0", \
	"--webserver", "${WEBSERVER_PORT}", \
	"--websocket", "${WEBSOCKET_PORT}", \
]
