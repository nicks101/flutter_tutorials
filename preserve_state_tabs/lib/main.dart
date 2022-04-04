import 'package:flutter/material.dart';
import 'package:preserve_state_tabs/indexed_stack_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bottom Tabbar Navigation Demo',
      home: IndexedStackDemo(),
    );
  }
}
