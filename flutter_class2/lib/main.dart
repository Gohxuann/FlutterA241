import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textabc = TextEditingController();
  TextEditingController textxyz = TextEditingController();

  int result = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic IO",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Basic IO"),
          backgroundColor: Color.fromARGB(201, 234, 166, 107),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              shadowColor: Color.fromARGB(201, 234, 166, 107),
              child: Column(
                children: [
                  TextField(
                    controller: textabc,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter First Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textxyz,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter First Number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 4,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: calculateMe,
                            child: const Text("Calculate")),
                        ElevatedButton(
                            onPressed: clearScreen, child: const Text("Clear")),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "OUTPUT: $result",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  calculateMe() {
    if (textabc.text == "" || textxyz.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter both numbers.")));
      return;
    }
    ;
    setState(() {
      int num1 = int.parse(textabc.text);
      int num2 = int.parse(textxyz.text);
      result = num1 + num2;
      print(result);
    }); //dipanggil utk refresh UI, letak bawah sekali
  }

  void clearScreen() {
    textabc.text = "";
    textxyz.text = "";
    result = 0;
  }
}
