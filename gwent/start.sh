#! env bash

while [[ $# -gt 0 ]]; do
  arg="$1"
  case $arg in
    -b|--bind)
      BIND="$2"
      shift
      shift
      ;;
    -w|--ws|--web|--webserver)
      WEBSERVER="$2"
      shift
      shift
      ;;
    -s|--wss|--sock|--websocket)
      WEBSOCKET="$2"
      shift
      shift
      ;;
  esac
done

cd /not-gwent-online && \
  sed -i "s/127.0.0.1/${BIND}/" public/Config.js && \
  sed -i "s/3000/${WEBSERVER}/" public/Config.js && \
  sed -i "s/16918/${WEBSOCKET}/" public/Config.js && \
  exec node server/server.js \
