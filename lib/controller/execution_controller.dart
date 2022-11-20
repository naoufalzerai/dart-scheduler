import 'dart:async';

import 'package:lucifer/lucifer.dart';
import 'package:scheduler/service/cron_service.dart';

class ExecutionController extends Controller {
  ExecutionController(App app) : super(app);

  @override
  FutureOr index(Req req, Res res) async {
    var list = (await getAllExecutions()).entries.toList()
      ..sort((a, b) => b.value['date'].compareTo(a.value['date']));
    await res.render('execution/list', {
      'back': false,
      'id': req.params["id"] ?? '',
      'data': Map.fromEntries(list).entries.toList().map(
            (e) => {'key': e.key, 'value': e.value},
          )
    });
  }

  @override
  FutureOr view(Req req, Res res) async {
    var list = (await getAllExecutions()).entries.toList()
      ..sort((a, b) => b.value['date'].compareTo(a.value['date']));

    await res.render('execution/list', {
      'back': true,
      'id': req.params["id"] ?? '',
      'data': Map.fromEntries(list)
          .entries
          .toList()
          .where((e) => e.value['cronId'] == req.params["id"])
          .map((e) => {'key': e.key, 'value': e.value})
    });
  }

  @override
  FutureOr deleteAll(Req req, Res res) async {
    deleteExecution(null);
    await res.send('');
  }

  @override
  FutureOr delete(Req req, Res res) async {
    deleteExecution(req.params["id"]);
    await res.send(req.params["id"]);
  }
}
