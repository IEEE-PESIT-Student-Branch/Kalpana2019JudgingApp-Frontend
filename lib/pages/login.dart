import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalpana2019judgingapp/Widgets/dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                            onSubmitted: (str) {
                              FocusScope.of(context).requestFocus(focus);
                            },
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
                            focusNode: focus,
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
                                horizontal: 45, vertical: 15),
                            onPressed: () {
                              // String username = _username.text;
                              // String password = _password.text;
                              // if (username.isEmpty) {
                              //   showError("Enter an Username");
                              //   return;
                              // }
                              // if (password.isEmpty) {
                              //   showError("Enter a Password");
                              //   return;
                              // }
                              // validateData();
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                child: LoginDialog(),
                              );
                              validateData();
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

  void validateData() async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _username.text + "@kalpana.com", password: _password.text);
      FirebaseUser user = result.user;
      Navigator.of(context).pop();
      Navigator.pushReplacementNamed(context, '/home');
    } on PlatformException catch (e) {
      if (e.code == "ERROR_USER_NOT_FOUND") {
        showError("User Not Found");
      } else if (e.code == "ERROR_INVALID_EMAIL") {
        showError("Invalid Email");
      } else if (e.code == "ERROR_WRONG_PASSWORD") {
        showError("Wrong Password");
      }
      // print("Invalid Email: ${e.code}");
    } catch (e) {
      print("Error: $e");
    }
  }
}
