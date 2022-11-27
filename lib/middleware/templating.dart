import 'dart:io';

import 'package:lucifer/lucifer.dart';
import 'package:mustache_template/mustache.dart';

Callback templating([String? views]) {
  return (Req req, Res res) {
    res.renderer = (String view, Map<String, dynamic> data) async {
      String directory = views ?? 'views';
      File file = File('$directory/$view.mustache');
      File headerFile = File('$directory/shared/header.mustache');
      File footerFile = File('$directory/shared/footer.mustache');
      data['refresh'] = data['refresh'] ?? false;
      if (await file.exists() &&
          await headerFile.exists() &&
          await footerFile.exists()) {
        var header = Template(await headerFile.readAsString(), name: 'partial');
        var footer = Template(await footerFile.readAsString(), name: 'partial');

        resolver(String name) {
          if (name == 'header') {
            return header;
          }
          if (name == 'footer') {
            return footer;
          }
        }

        var template = Template(
            '{{> header }} ${await file.readAsString()} {{> footer }}',
            partialResolver: resolver);

        String html = template.renderString(data);
        await res.send(html);
      }
    };
  };
}
