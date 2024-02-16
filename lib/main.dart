import 'package:flutter/material.dart';
import 'package:singleton_app/pages/page_one.dart';
import 'package:singleton_app/pages/page_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pageOne',
      routes: {
        'pageOne': (BuildContext context) => const PageOne(),
        'pageTwo': (BuildContext context) => const PageTwo(),
      },
    );
  }
}
