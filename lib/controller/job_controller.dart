import 'dart:async';

import 'package:lucifer/lucifer.dart';

class JobController extends Controller {
  JobController(App app) : super(app);

  FutureOr addForm(Req req, Res res) async {
    await res.send("data");
  }

  @override
  FutureOr index(Req req, Res res) async {
    await res.render('job/list', {'title': 'Hello Detective'});
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
