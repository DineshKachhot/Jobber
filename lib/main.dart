import 'package:flutter/material.dart';
import 'package:jobber/pages/home_page.dart';

import 'data/data_loader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BaseDataLoader dataLoader = BaseDataLoader();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', data: dataLoader),
    );
  }
}
