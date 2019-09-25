import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController usermameTextFieldController =
      TextEditingController();
  final TextEditingController passwordTextFieldController =
      TextEditingController();
  final TextEditingController emailAddressTextFieldController =
      TextEditingController();
  final TextEditingController createUsernameTextFieldController =
      TextEditingController();
  final TextEditingController createPasswordTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      child: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/background.jpg"), fit: BoxFit.cover),
          ),
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 130.0)),
              new Icon(
                Icons.fastfood,
                size: 150,
                color: Colors.amberAccent,
              ),
              new Padding(padding: EdgeInsets.only(top: 5.0)),
              new Text(
                "Login",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              new Padding(padding: EdgeInsets.only(top: 20.0)),
              new Opacity(
                opacity: 0.6,
                child: new SizedBox(
                  width: 350,
                  child: new TextField(
                    controller: usermameTextFieldController,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 15.0)),
              new Opacity(
                opacity: 0.6,
                child: new SizedBox(
                  width: 350,
                  child: new TextField(
                    controller: passwordTextFieldController,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 30.0)),
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      if (usermameTextFieldController.text != "" &&
                          passwordTextFieldController.text != "") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                      } else {
                        showInvalidLoginInformationAlertDialog(context);
                      }
                    },
                    color: Colors.black,
                    child: new Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 300,
              ),
              new Padding(padding: EdgeInsets.only(top: 20.0)),
              new FlatButton(
                onPressed: () {
                  showPasswordResetAlertDialog(context);
                },
                child: new Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 30.0)),
              new FlatButton(
                onPressed: () {
                  showCreateAccountAlertDialog(context);
                },
                child: new Text(
                  "Dont have an account? click here.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }

  Future<Null> showPasswordResetAlertDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              "Password Reset",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text(
                    "Enter a valid email address to reset password:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15, left: 15)),
                  Opacity(
                    opacity: 0.8,
                    child: SizedBox(
                      child: TextField(
                        controller: emailAddressTextFieldController,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter a Valid email address",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      if (emailAddressTextFieldController.text != "") {
                        Navigator.of(context).pop();
                      } else {
                        showMissingValidEmailAddressAlertDialog(context);
                      }
                    },
                    color: Colors.black,
                    child: new Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              ),
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.black,
                    child: new Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              ),
            ],
            backgroundColor: Colors.amberAccent,
          );
        });
  }

  Future<Null> showInvalidLoginInformationAlertDialog(
      BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              "Error",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text(
                    "username or password are invalid",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.black,
                    child: new Text(
                      "Okay",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              )
            ],
            backgroundColor: Colors.amberAccent,
          );
        });
  }

  Future<Null> showCreateAccountAlertDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              "Create Account",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text(
                    "Enter a valid email and password to create an account:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15, left: 15)),
                  Opacity(
                    opacity: 0.8,
                    child: SizedBox(
                      child: TextField(
                        controller: createUsernameTextFieldController,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter a Valid email address here.",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      width: 250,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15, left: 15)),
                  Opacity(
                    opacity: 0.8,
                    child: SizedBox(
                      child: TextField(
                        controller: createPasswordTextFieldController,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter a memorable password here.",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      if (createUsernameTextFieldController.text != "" &&
                          createPasswordTextFieldController.text != "") {
                        Navigator.of(context).pop();
                      } else {
                        showMissingAccountInformationAlertDialog(context);
                      }
                    },
                    color: Colors.black,
                    child: new Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              ),
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.black,
                    child: new Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              ),
            ],
            backgroundColor: Colors.amberAccent,
          );
        });
  }

  Future<Null> showMissingAccountInformationAlertDialog(
      BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              "Error",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text(
                    "username or password are missing",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.black,
                    child: new Text(
                      "Okay",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              )
            ],
            backgroundColor: Colors.amberAccent,
          );
        });
  }

  Future<Null> showMissingValidEmailAddressAlertDialog(
      BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              "Error",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text(
                    "valid email address is missing",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new ButtonTheme(
                child: new Opacity(
                  opacity: 0.7,
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.black,
                    child: new Text(
                      "Okay",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                height: 50,
                minWidth: 100,
              )
            ],
            backgroundColor: Colors.amberAccent,
          );
        });
  }
}
