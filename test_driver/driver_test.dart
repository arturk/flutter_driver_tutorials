import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:testing_tutorial/finders/finders.dart';

void main() {
  group('Counter App', () {
    final buttonFinder = find.byValueKey('increment');
    final counterTextFinder = find.byValueKey('counter');
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async => driver?.close());

    test('increments the counter', () async {
      await driver.tap(buttonFinder, timeout: Duration(seconds: 10));
      expect(await driver.getText(counterTextFinder), "1");
    });

    test('increments the counter', () async {
      var buttonIcon = await driver.requestData("getButtonIcon");
      expect(buttonIcon, equals(0xe567.toString()));
    });

    test('increments by 1000000', () async {
      await driver.requestData("increaseBy1000000");
      expect(await driver.getText(counterTextFinder), "1000001");
    });

    test('increments using custom commands by 5', () async {
      final expected = int.parse(await driver.getText(counterTextFinder)) + 5;
      await driver.sendCommand(FloatingActionButtonCommand(
          FloatingActionButtonFinder(), 5,
          timeout: Duration(seconds: 10)));
      final actual = int.parse(await driver.getText(counterTextFinder));
      expect(actual, equals(expected));
    });
  });
}
