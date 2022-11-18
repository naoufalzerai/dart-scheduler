import 'dart:async';

import 'package:lucifer/lucifer.dart';
import 'package:scheduler/service/cron_service.dart';

class ExecutionController extends Controller {
  ExecutionController(App app) : super(app);

  @override
  FutureOr index(Req req, Res res) async {
    var list = await getAllExecutions();
    await res.render('execution/list', {
      'back': false,
      'data': list.entries.toList().map(
            (e) => {'key': e.key, 'value': e.value},
          )
    });
  }

  @override
  FutureOr view(Req req, Res res) async {
    // await res.send(req.params["id"]);
    var list = await getAllExecutions();

    await res.render('execution/list', {
      'back': true,
      'data': list.entries
          .toList()
          .where((e) => e.value['cronId'] == req.params["id"])
          .map((e) => {'key': e.key, 'value': e.value})
    });
  }
}
