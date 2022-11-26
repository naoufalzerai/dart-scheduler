import 'dart:async';
import 'dart:io';

import 'package:lucifer/lucifer.dart';

class RunController extends Controller {
  RunController(App app) : super(app);
  @override
  FutureOr index(Req req, Res res) async {
    await res.render('run/index', {});
  }

  FutureOr ws(Req req, Res res) async {
    final socket = app.socket(req, res);
    socket.on('open', (WebSocket client) {
      res.log.i(client.toString());
    });
    socket.on('close', (WebSocket client) {
      res.log.i('close');
    });
    socket.on('message', (WebSocket client, message) {
      res.log.i('message:$message');
      client.send('hi');
    });
    socket.on('error', (WebSocket client, error) {
      res.log.e('$error');
    });
    await socket.listen();
  }
}
