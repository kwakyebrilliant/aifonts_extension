import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chrome Extension',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chrome Extension'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('Hello, World!');
          },
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
