import 'package:flutter_driver/driver_extension.dart';
import 'package:testing_tutorial/helpers.dart';
import 'package:testing_tutorial/finders/finders_extension.dart';
import 'package:testing_tutorial/main.dart' as app;

void main() {
  enableFlutterDriverExtension(
      handler: dataHandlerFunction,
      commands: [FloatingActionButtonCommandExtension()],
      finders: [FloatingActionButtonFinderExtension()]);
  app.main();
}
