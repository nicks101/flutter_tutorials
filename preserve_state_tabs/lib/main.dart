import 'package:flutter/material.dart';
import 'package:preserve_state_tabs/basic_bottom_nav.dart';

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

      /// Call the class we want to see the demo of

      // home: AliveMixinDemo(),
      // home: IndexedStackDemo(),
      // home: StackDemo(),
      home: BasicBottomNavigation(),
    );
  }
}
