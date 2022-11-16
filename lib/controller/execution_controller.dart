import 'dart:async';

import 'package:lucifer/lucifer.dart';
import 'package:scheduler/service/cron_service.dart';

class ExecutionController extends Controller {
  ExecutionController(App app) : super(app);

  @override
  FutureOr index(Req req, Res res) async {
    var list = await getAllExecutions();
    await res.render('execution/list', {
      'data': list.entries.toList().map((e) => {'key': e.key, 'value': e.value})
    });
  }

  @override
  FutureOr view(Req req, Res res) async {}

  @override
  FutureOr create(Req req, Res res) async {}

  @override
  FutureOr edit(Req req, Res res) async {}

  @override
  FutureOr delete(Req req, Res res) async {}

  @override
  FutureOr deleteAll(Req req, Res res) async {}
}
