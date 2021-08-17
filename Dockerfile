FROM google/cloud-sdk:266.0.0-alpine

RUN apk --no-cache --upgrade add openjdk11-jre
RUN gcloud components install pubsub-emulator beta --quiet

VOLUME /opt/data

EXPOSE 8085

ENTRYPOINT ["gcloud", "beta", "emulators", "pubsub", "start", "--data-dir=/opt/data", "--host-port=0.0.0.0:8085"]
