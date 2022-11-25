FROM google/dart AS build

WORKDIR /app

ADD pubspec.* /app/
RUN pub get
ADD . /app
RUN pub get --offline
RUN dart compile exe -o serv.exe lib/main.dart

## Deploy
FROM nikolaik/python-nodejs:latest

WORKDIR /app

COPY --from=build /app/serv.exe /app/serv.exe
COPY --from=build /app/public /app/public
COPY --from=build /app/views /app/views
CMD []
ENTRYPOINT ["/app/serv.exe"]
