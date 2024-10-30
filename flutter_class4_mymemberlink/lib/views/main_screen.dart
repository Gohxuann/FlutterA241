import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: newsList.isEmpty
      //     ? const Center(
      //         child: Text("Loading..."),
      //       )
      //     : ListView.builder(
      //         itemCount: newsList.length,
      //         itemBuilder: (context, index) {
      //           return Card(
      //             child: ListTile(
      //               title: Text(newsList[index].newsTitle.toString()),
      //               subtitle: Text(newsList[index].newsDetails.toString()),
      //             ),
      //           );
      //         }),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              onTap: () {},
              title: const Text("Newsletter"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Events"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Members"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Vetting"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Members"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Payment"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Product"),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // loadNewsData();
      //     await Navigator.push(context,
      //         MaterialPageRoute(builder: (content) => const NewNewsScreen()));
      //     loadNewsData();
      //   },
      //   child: const Icon(Icons.add),
      // )
    );
  }
}
