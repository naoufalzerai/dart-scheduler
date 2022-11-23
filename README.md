![example workflow](https://github.com/github/docs/actions/workflows/main.yml/badge.svg)
# Introduction
Dart scheduler allows you to run agnostic cron and jobs, all you have to do is fire the app and dchedule your job 🔥
![home](doc/img/job1.png)
# How to run
## Windows

## Linux

## Macos

## Docker
    docker run -d -p 3010:3010 --name scheduler dart-scheduler:1  
## Docker compose
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
4. Execute dart_scheduler.exe
```
./dart_scheduler.exe 
```
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