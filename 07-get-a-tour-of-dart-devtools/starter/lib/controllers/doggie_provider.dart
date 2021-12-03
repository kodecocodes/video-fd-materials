import 'package:flutter/cupertino.dart';

import 'dog_controller.dart';

class DoggieProvider extends InheritedWidget {
  final _controller = DogController();

  DoggieProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  static DogController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DoggieProvider>()!
        ._controller;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
