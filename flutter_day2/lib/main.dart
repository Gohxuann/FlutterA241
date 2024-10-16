import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Nunito'),
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
    )..addListener(_onscroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(
              image: 'assets/images/labubu1.jpg',
              Title: 'LABUBU',
              description:
                  'Labubu is a kind-hearted, curious, and optimistic creature with pointed ears, sharp teeth, and a squarish face. Labubu is inspired by the forest spirits of Scandinavia and is part of a universe of characters modeled after elves, fairies, and monsters.'),
          makePage(
              image: 'assets/images/labubu2.jpg',
              Title: 'Zimomo',
              description:
                  'Zimomo is fuzzy, long-eared, and sports sharp teeth that they show off when they smile.'),
          makePage(
              image: 'assets/images/labubu3.jpg',
              Title: 'History',
              description:
                  'In 2015, Kasing Lung created a fairy world in his three Nordic Fairy Tale picture books, where live The Monsters, which are both good and evil, including Zimomo, Tycoco, Spooky and Pato.'),
        ],
      ),
    );
  }
}

Widget makePage({image, Title, description}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.7), //bottom
          Colors.black.withOpacity(.1), //upper
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20), //position of text
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, //set position of text to start
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const Row(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: const Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      const Text(
                        "4.0",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const Text(
                        "(4.5k)",
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.9,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'READ MORE',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ))
            ]),
      ),
    ),
  );
}
