import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: key,
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: (0.15 * height),
                  ),
                  child: Image.asset('images/Kalpana.png'),
                ),
                Text(
                  "Sign In to your account",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: _username,
                            decoration: InputDecoration(
                              hintText: "Username",
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: _password,
                            decoration: InputDecoration(
                              hintText: "Password",
                            ),
                            obscureText: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: RaisedButton(
                            child: Text("Login"),
                            color: Colors.yellow[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            onPressed: () {
                              String username = _username.text;
                              String password = _password.text;
                              if (username.isEmpty) {
                                showError("Enter an Username");
                                return;
                              }
                              if (password.isEmpty) {
                                showError("Enter a Password");
                                return;
                              }
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showError(String str) {
    key.currentState.showSnackBar(new SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.yellow[300],
      content: new Text(
        str,
        style: TextStyle(color: Colors.black),
      ),
    ));
  }
}
