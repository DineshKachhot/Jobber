import 'package:flutter/material.dart';
import 'package:jobber/data/data_loader.dart';
import 'package:jobber/data/jobs.dart';
import 'package:jobber/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  Widget _buildFormFieldRow(IconData icon, String hint,
      TextEditingController controller, TextInputType type,
      {bool enabled = true, bool obscureText = false}) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 16.0,
        ),
        Icon(
          icon,
          color: Colors.grey[500],
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
            child: TextFormField(
              obscureText: obscureText,
              enabled: enabled,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hint,
                  labelText: hint),
              controller: controller,
              keyboardType: type,
            )),
        SizedBox(
          width: 16.0,
        )
      ],
    );
  }

  _loginAction() async {
    try {
      Navigator.popAndPushNamed(context, MyHomePage.routeName);
    } catch (e) {
      print(e);
      scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: Text('Failed to login. Please contact administrator.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 92.0),
              _buildFormFieldRow(Icons.email, 'Email', emailController,
                  TextInputType.emailAddress),
              SizedBox(height: 24.0),
              _buildFormFieldRow(Icons.lock, 'Password', passwordController,
                  TextInputType.text,
                  obscureText: true),
              SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 42.0,
                  child: RaisedButton(
                    onPressed: _loginAction,
                    child: Text(
                      'LOG IN',
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 42.0),
            ],
          ),
        ),
      ),
    );
  }
}
