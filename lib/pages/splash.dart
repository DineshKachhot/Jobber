import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((user){
      if(user != null){
        navigateToHome();
      }else{
        navigateToLogin();
      }
    }).catchError((e){
      print(e);
      navigateToLogin();
    });
  }

  navigateToLogin(){
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }

  navigateToHome(){
    Navigator.of(context).pushReplacementNamed(MyHomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
