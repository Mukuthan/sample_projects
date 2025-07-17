import 'package:flutter/material.dart';
import 'homePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _height = 0.0;
  var _width = 0.0;
  var _height1 = 600.0;
  var _width1 = 350.0;
  var height = 0.0;

  _login() {
    setState(() {
      _height = 0.0;
      _width = 0.0;
      _height1 = 600.0;
      _width1 = 350.0;
    });
  }

  _signup() {
    setState(() {
      _height1 = 0.0;
      _width1 = 0.0;
      _height = 600.0;
      _width = 350.0;
    });
  }

  void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login/Signin"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            color: Colors.white10,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          dismissKeyboard(context);
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 10),
                            height: _height1,
                            width: _width1,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              border: Border.all(width: 4.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    ".  LOGIN BAR    .",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.white,
                                        backgroundColor: Colors.black87,
                                        wordSpacing: 10.0),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.indigoAccent,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          label: Text(
                                            "UserName/E-mail",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          hintText: ("name/mail"),
                                          hintStyle: TextStyle(fontSize: 20),
                                          icon: Icon(
                                            Icons.person,
                                            size: 20.0,
                                            color: Colors.black87,
                                          )),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.indigoAccent,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          label: Text(
                                            "Password",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          hintText: ("password"),
                                          hintStyle: TextStyle(fontSize: 20),
                                          icon: Icon(
                                            Icons.key,
                                            size: 20.0,
                                            color: Colors.black87,
                                          )),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            dismissKeyboard(context);
                                            _signup();
                                          },
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.lightGreen),
                                              overlayColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.purpleAccent)),
                                          child: const Text(
                                            "Create Account",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            dismissKeyboard(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Homepage()));
                                          },
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.red),
                                              overlayColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.redAccent)),
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          dismissKeyboard(context);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 10),
                          height: _height,
                          width: _width,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            border: Border.all(width: 4.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                const Text(
                                  ".  SIGNUP BAR    .",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      backgroundColor: Colors.black87,
                                      wordSpacing: 10.0),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        label: Text(
                                          "Name",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        hintText: ("name"),
                                        hintStyle: TextStyle(fontSize: 20),
                                        icon: Icon(
                                          Icons.person,
                                          size: 20.0,
                                          color: Colors.black87,
                                        )),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        label: Text(
                                          "E-mail",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        hintText: ("mail.id"),
                                        hintStyle: TextStyle(fontSize: 20),
                                        icon: Icon(
                                          Icons.mail,
                                          size: 20.0,
                                          color: Colors.black87,
                                        )),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        label: Text(
                                          "Contact",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        hintText: ("phone.no"),
                                        hintStyle: TextStyle(fontSize: 20),
                                        icon: Icon(
                                          Icons.phone,
                                          size: 20.0,
                                          color: Colors.black87,
                                        )),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        label: Text(
                                          "Password",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        hintText: ("password"),
                                        hintStyle: TextStyle(fontSize: 20),
                                        icon: Icon(Icons.key,
                                            size: 20.0, color: Colors.black87)),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        label: Text(
                                          "Confirm Password",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        hintText: ("password"),
                                        hintStyle: TextStyle(fontSize: 20),
                                        icon: Icon(
                                          Icons.key,
                                          size: 20.0,
                                          color: Colors.black87,
                                        )),
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 60.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          dismissKeyboard(context);
                                          _login();
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.yellow),
                                            overlayColor:
                                                WidgetStatePropertyAll(
                                                    Colors.yellowAccent)),
                                        child: const Text(
                                          "Have Account",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white),
                                        )),
                                    ElevatedButton(
                                        onPressed: () {
                                          dismissKeyboard(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Homepage()));
                                        },
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.red),
                                            overlayColor:
                                                WidgetStatePropertyAll(
                                                    Colors.redAccent)),
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ],
            ))));
  }
}
