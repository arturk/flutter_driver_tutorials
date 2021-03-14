import 'package:flutter_driver/flutter_driver.dart';

class FloatingActionButtonFinder extends SerializableFinder {
  const FloatingActionButtonFinder();

  @override
  String get finderType => 'FloatingActionButtonFinder';

  @override
  Map<String, String> serialize() => super.serialize();
}

class FloatingActionButtonCommand extends CommandWithTarget {
  FloatingActionButtonCommand(SerializableFinder finder, this.times,
      {Duration timeout})
      : super(finder, timeout: timeout);

  FloatingActionButtonCommand.deserialize(
      Map<String, String> json, DeserializeFinderFactory finderFactory)
      : times = int.parse(json['times']),
        super.deserialize(json, finderFactory);

  @override
  Map<String, String> serialize() {
    return super.serialize()..addAll(<String, String>{'times': '$times'});
  }

  @override
  String get kind => 'FloatingActionButtonCommand';

  final int times;
}

class FloatingActionButtonCommandResult extends Result {
  const FloatingActionButtonCommandResult(this.result);

  final String result;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'result': result,
    };
  }
}
