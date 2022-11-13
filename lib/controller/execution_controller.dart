import 'dart:async';

import 'package:lucifer/lucifer.dart';

class ExecutionController extends Controller {
  ExecutionController(App app) : super(app);

  @override
  FutureOr index(Req req, Res res) async {
    await res.render('execution/list', {'title': 'Hello Detective'});
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
