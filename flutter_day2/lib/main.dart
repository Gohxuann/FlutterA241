import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  void _onscroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(image: 'assets/images/labubu1.jpg'),
          makePage(image: 'assets/images/labubu2.jpg'),
          makePage(image: 'assets/images/labubu3.jpg'),
        ],
      ),
    );
  }
}

Widget makePage({image}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.7), //bottom
          Colors.black.withOpacity(.1), //upper
        ]),
      ),
      child: Padding(
        padding: EdgeInsets.all(20), //position of text
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, //set position of text to start
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, //set position of text to right end
                crossAxisAlignment: CrossAxisAlignment
                    .baseline, //set position of text to bottom
                textBaseline: TextBaseline
                    .alphabetic, //set position of text to bottom (must used wif crossAxisAlignment)
                children: <Widget>[
                  Text("1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  Text("/3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.end, //set position of text to bottom end
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "LABUBU",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))
            ]),
      ),
    ),
  );
}
