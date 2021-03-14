import 'package:flutter/material.dart';
import 'package:flutter_test/src/all_elements.dart';

List<T> findWidgets<T extends Widget>() =>
    collectAllElementsFrom(WidgetsBinding.instance.renderViewElement,
            skipOffstage: false)
        .map((e) => e.widget)
        .whereType<T>()
        .toList();

Future<String> dataHandlerFunction(String payload) async {
  switch (payload) {
    case "getButtonIcon":
      var addButton = findWidgets<FloatingActionButton>().first;
      return (addButton.child as Icon).icon.codePoint.toString();
    case "increaseBy1000000":
      var addButton = findWidgets<FloatingActionButton>().first;
      for (var i = 0; i < 1000000; i++) addButton.onPressed();
      return null;
    default:
      return null;
  }
}
