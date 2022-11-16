import 'dart:io';

import 'package:cron/cron.dart';
import 'package:hive/hive.dart';
import 'package:lucifer/lucifer.dart';
import 'package:uuid/uuid.dart';

final cron = Cron();
final uuid = Uuid();
late final BoxCollection collection;
late final CollectionBox cronBox;
late final CollectionBox executionBox;

Map<String, dynamic> inMemoryCron = <String, dynamic>{};

void startDemonSchedule() async {
  var aes =
      env('AES_CIPHER').toString().split(',').map((e) => int.parse(e)).toList();

  collection = await BoxCollection.open(
    'CronBoxDb',
    {'crons', 'executions'},
    path: env('DB_PATH'),
    key: HiveAesCipher(aes),
  );
  cronBox = await collection.openBox<Map>('crons');
  executionBox = await collection.openBox<Map>('executions');
  // load cron from db
  _loadAllCron();
}

void addCron(Map c) async {
  var id = uuid.v1();
  await cronBox.put(id, c);
  _runCron(id);
}

void _loadAllCron() async {
  var lst = await cronBox.getAllValues();
  // foreach cron
  lst.forEach((key, value) async {
    _runCron(key);
  });
}

void _runCron(String i) async {
  var c = await cronBox.get(i);
  var id = uuid.v1();
  var s = cron.schedule(Schedule.parse('*/1 * * * *'), () async {
    // insert execution
    executionBox.put(id, {
      'cronId': i,
      'cronName': c["name"],
      'name': 'start',
      'date': DateTime.now().toString(),
      'code': "0",
    });
    // run schedule
    Process.start('ls', ['-l']).whenComplete(() {
      // insert end of execution
      executionBox.put(id, {
        'cronId': i,
        'cronName': c["name"],
        'name': 'end',
        'date': DateTime.now().toString(),
        'code': "0",
      });
    }).onError((error, stackTrace) {
      // catch error and store them into execution
      executionBox.put(id, {
        'cronId': i,
        'cronName': c["name"],
        'name': 'error',
        'date': DateTime.now().toString(),
        'code': stackTrace.toString(),
      });
      throw "$error";
    });
  });
  inMemoryCron[i] = {
    'scheduleTask': s,
    'name': c["name"],
    'actif': c["actif"],
    'schedule': c["schedule"],
  };
}

dynamic getAllExecutions() async {
  final execs = await executionBox.getAllValues();
  return execs;
}

Map<String, dynamic> getAllJobs() {
  return inMemoryCron;
}
