import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:users/data.dart';
import 'package:users/models/user.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JsonExampleProvider(
        coder: JsonExampleCoder(),
        child: const Buttons(),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
            child: const Text('Encode'),
          ),
          ElevatedButton(
            onPressed: () => JsonExampleProvider.watch(context)?.coder.decode(),
            child: const Text('Decode'),
          ),
        ],
      ),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;

  const JsonExampleProvider({
    Key? key,
    required this.coder,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class JsonExampleCoder {
  void encode() {
    final jsonString = jsonEncode(users);
    print(jsonString);
  }

  void decode() {
    List<dynamic> usersString = jsonDecode(jsonData);
    final users = usersString.map((user) => User.fromJson(user)).toList();
    print(users);
  }
}
