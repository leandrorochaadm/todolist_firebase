import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    // required this.title,
    // required this.message,
  });

  // final String title;
  // final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('T'),
        ),
        body: const Center(
          child: Text('M'),
        ),
      ),
    );
  }
}
