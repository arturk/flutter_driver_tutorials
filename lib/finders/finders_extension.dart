import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart'
    show SerializableFinder, Command, Tap, Result;
import 'finders.dart';

class FloatingActionButtonFinderExtension extends FinderExtension {
  String get finderType => 'FloatingActionButtonFinder';

  SerializableFinder deserialize(
      Map<String, String> params, DeserializeFinderFactory finderFactory) {
    return FloatingActionButtonFinder();
  }

  Finder createFinder(
      SerializableFinder finder, CreateFinderFactory finderFactory) {
    return find.byElementPredicate((Element element) {
      if (element.widget is FloatingActionButton) {
        return true;
      }
      return false;
    });
  }
}

class FloatingActionButtonCommandExtension extends CommandExtension {
  @override
  String get commandKind => 'FloatingActionButtonCommand';

  @override
  Future<Result> call(
      Command command,
      WidgetController prober,
      CreateFinderFactory finderFactory,
      CommandHandlerFactory handlerFactory) async {
    final FloatingActionButtonCommand someCommand = command;

    final Finder finder = finderFactory.createFinder(someCommand.finder);
    await handlerFactory.waitForElement(finder);
    for (int index = 0; index < someCommand.times; index++) {
      await handlerFactory.handleCommand(
          Tap(someCommand.finder), prober, finderFactory);
    }

    return FloatingActionButtonCommandResult(
        'Tapped ${someCommand.times} times');
  }

  @override
  Command deserialize(
      Map<String, String> params,
      DeserializeFinderFactory finderFactory,
      DeserializeCommandFactory commandFactory) {
    return FloatingActionButtonCommand.deserialize(params, finderFactory);
  }
}
