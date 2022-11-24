![Dart build](https://github.com/naoufalzerai/dart_scheduler/actions/workflows/dart.yml/badge.svg)
![Docker build](https://github.com/naoufalzerai/dart_scheduler/actions/workflows/docker-image.yml/badge.svg)

# Introduction
Dart scheduler allows you to run agnostic cron and jobs, all you have to do is fire the app and dchedule your job 🔥
![home](doc/img/job1.png)
# How to run

## Docker
```
docker run -d -p 3010:3010 --name scheduler dart-scheduler:1  \
-e ENV='development' \
-e PORT='bar' \
-e AES_CIPHER='2,3,2,10,3,77,2,3,31,2,65,151,35,111,1,2,3,9,2,64,111,7,111,1,2,3,211,2,34,111,33,111' \
-e DB_PATH='/home/db' 
```
## Docker compose
```
version: "3.9"
services:
  web:
    image: naoufalzerai/dart_scheduler
    ports:
      - "3010:3010"
    volumes:
      - ../compose-test:/db
    environment:
      ENV: development
      HOST: 0.0.0.0
      PORT: 3010
      AES_CIPHER: 2,3,2,1,3,77,2,3,31,2,65,111,35,111,1,2,3,9,2,64,111,7,111,1,2,3,211,2,34,111,33,111
      DB_PATH: /db
```

## From source
Make sure you have [Dart](https://dart.dev/get-dart) instaled 

1. Clone the repo
```
Git clone https://github.com/naoufalzerai/dart_scheduler.git
```
2. Open the folder
```
cd dart_scheduler
```
3. Build the project 
```
dart compile exe -o dart_scheduler.exe lib/main.dart   
```
4. create .env config
```
ENV = development
HOST = 0.0.0.0
PORT = 3010
AES_CIPHER = 2,3,2,10,3,77,2,3,31,2,65,151,35,111,1,2,3,9,2,64,111,7,111,1,2,3,211,2,34,111,33,111
DB_PATH = /home/db
```
5. Execute dart_scheduler.exe
```
./dart_scheduler.exe 
```

## From binaries (Linux/Windows/Macos)

[Here](https://github.com/naoufalzerai/dart_scheduler/releases)

# Exemple
## GUI

## Web Api

# Todo list:
- [ ] Authentification
- [ ] API
- [ ] Filter and sort table
- [x] Docker-compose
- [x] Edit 
- [x] Enable/disable
- [x] Wipe logs 
- [x] Start/Stop 
- [x] Delete
  - [x] Stop execs
  - [x] Delete Job + Logs
- [x] Run script
- [x] Sort executions by date
- [x] Bug first job didn't show
