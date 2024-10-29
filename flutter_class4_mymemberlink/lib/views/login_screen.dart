import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool rememberme = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Your Email"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Your Password"),
              ),
              Row(
                children: [
                  const Text("Remember me"),
                  Checkbox(
                      value: rememberme,
                      onChanged: (bool? value) {
                        setState(() {
                          String email = emailcontroller.text;
                          String pass = passwordcontroller.text;
                          if (value!) {
                            if (email.isNotEmpty && pass.isNotEmpty) {
                              storeSharedPrefs(value, email, pass);
                            } else {
                              rememberme = false;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Please enter your credention"),
                                backgroundColor: Colors.red,
                              ));
                              return;
                            }
                          } else {
                            email = "";
                            pass = "";
                            storeSharedPrefs(value, email, pass);
                          }
                          rememberme = value ?? false;
                          setState(() {});
                        });
                      }),
                ],
              ),
              MaterialButton(
                  elevation: 10,
                  onPressed: onLogin,
                  minWidth: 400,
                  height: 50,
                  color: Colors.purple[800],
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white))),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: const Text("Forgot Password? "),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter email and password"),
      ));
      return;
    }
    http.post(Uri.parse("http://192.168.0.159/memberlink/api/login_user.php"),
        body: {"email": email, "password": password}).then((response) {
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        // var data = jsonDecode(response.body);
        // if (data['status'] == "success") {
        //   // User user = User.fromJson(data['data']);
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //     content: Text("Login Success"),
        //     backgroundColor: Colors.green,
        //   ));
        //   // Navigator.push(context,
        //   //     MaterialPageRoute(builder: (content) =>  MainPage(userdata:user)));
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //     content: Text("Login Failed"),
        //     backgroundColor: Colors.red,
        //   ));
        // }
      }
    });
  }

  Future<void> storeSharedPrefs(bool value, String email, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value) {
      prefs.setString("email", email);
      prefs.setString("password", pass);
      prefs.setBool("rememberme", value);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Preferences Saved"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ));
    } else {
      prefs.setString("email", email);
      prefs.setString("password", pass);
      prefs.setBool("rememberme", value);
      emailcontroller.text = "";
      passwordcontroller.text = "";
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Preferences is Removed"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ));
    }
  }

  Future<void> loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailcontroller.text = prefs.getString("email") ?? "";
    passwordcontroller.text = prefs.getString("password") ?? "";
    rememberme = prefs.getBool("rememberme") ?? false;

    setState(() {});
  }
}
