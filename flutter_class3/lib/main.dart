import 'package:flutter/material.dart';
import 'package:flutter_class3/person.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

//person_generator_app

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonScreen(),
    );
  }
}

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  List<Person> personList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person List"),
        backgroundColor: Colors.yellow,
      ),
      body: personList.isEmpty
          ? const Center(
              child: Text("NO DATA"),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: List.generate(personList.length, (index) {
                return Card(
                  color: Colors.yellow.shade100,
                  elevation: 5.0, //shadow of the cards
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}:${personList[index].name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(personList[index].email.toString()),
                        Text(personList[index].phone.toString()),
                        Text(personList[index].address.toString()),
                        Text(personList[index].country.toString())
                      ],
                    ),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.download),
      ),
    );
  }

  void onPressed() async {
    int c = 5;
    http
        .get(
      Uri.parse("https://slumberjer.com/myfaker/myfaker.php?count=$c"),
    )
        .then((response) {
      //print(response.body);
      if (response.statusCode == 200) {
        var resp = convert.jsonDecode(response.body);
        //print(resp.toString());
        if (resp['status'] == "success") {
          personList.clear();
          resp['data'].forEach((v) {
            personList.add(Person.fromJson(v));
            //print(v.toString());
          });
          setState(() {});
          ();
        }
      }
    });
  }
}
