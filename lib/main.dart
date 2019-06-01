import 'package:flutter/material.dart';
import 'package:jobber/pages/home_page.dart';
import 'package:jobber/pages/login_page.dart';
import 'package:jobber/pages/splash.dart';
import 'package:provider/provider.dart';

import 'data/data_loader.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BaseDataLoader data = BaseDataLoader();
  final routes = <String, WidgetBuilder>{
    LoginPage.routeName: (context) => LoginPage(),
    MyHomePage.routeName: (context) =>
        MyHomePage(title: 'Flutter Demo Home Page'),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<BaseDataLoader>(
        dispose: (_, value) => value.dispose(),
        builder: (_) => data,
        child: SplashPage(),
      ),
    );
  }
}
