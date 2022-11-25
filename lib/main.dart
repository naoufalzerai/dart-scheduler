import 'package:lucifer/lucifer.dart';
import 'package:scheduler/controller/job_controller.dart';
import 'package:scheduler/middleware/templating.dart';

import 'controller/execution_controller.dart';
import 'service/cron_service.dart';

void main() async {
  final app = App();
  final port = env('DART_SCHEDULER_PORT') ?? 3000;
  final host = env('DART_SCHEDULER_HOST') ?? '127.0.0.1';

  if (env('DART_SCHEDULER_ENV') != 'development') {
    app.use(logger(level: Level.error));
  } else {
    app.use(logger());
  }
  app.use(static('public'));
  app.use(templating());
  // usually sent from REST API
  app.use(json());
  // use xssClean to clean the inputs
  app.use(xssClean());
  // usually sent from HTML form
  app.use(urlencoded());
  final job = JobController(app);
  final execution = ExecutionController(app);

  app.get('/', (Req req, Res res) async {
    await res.render('index', {'title': 'Hello Detective'});
    // await res.send(output);
  });
  app
      .route('/job', job)
      .get('/create', job.addForm)
      .get('/edit/:id', job.editForm)
      .post('/toggle/:id', job.toggle);
  app.route('/execution', execution);

  await app.listen(port, host, (() {
    print('Server running at http://${app.host}:${app.port}');
  }));

  app.checkRoutes();
  startDemonSchedule();
}
