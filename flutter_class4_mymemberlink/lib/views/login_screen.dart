import 'package:flutter/material.dart';

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
                height: 20,
              ),
              TextField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Your Password"),
                obscureText: true,
              ),
              Row(
                children: [
                  const Text("Remember me"),
                  Checkbox(
                      value: rememberme,
                      activeColor: Colors.yellow,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberme = value ?? false;

                          setState(() {});
                        });
                      }),
                ],
              ),
              MaterialButton(
                elevation: 5, //shadow
                onPressed: onLogin,
                minWidth: 300,
                height: 50,
                color: Colors.yellow,
                child: const Text("Login"),
              ),
              const SizedBox(height: 20),
              GestureDetector(child: Text("Forgot Password?")),
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
  }
}
