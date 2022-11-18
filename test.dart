import 'dart:io';

void main(List<String> args) async {
  var p = await Process.run("python", ["-c", "print('ok')"]);
  print(p.stdout);
}
