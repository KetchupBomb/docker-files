FROM python:2
LABEL maintainer="mail@lolnope.us"

RUN apt-get update && \
  apt-get install git && \
  git clone https://github.com/mumble-voip/mumo.git && \
  pip install zeroc-ice

VOLUME /mumo
WORKDIR /mumo
ENTRYPOINT ["python"]
CMD ["mumo.py"]
