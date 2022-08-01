import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scratcher/scratcher.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Reward"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/');
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'spinner');
                  // Get.snackbar('Message', 'Welcom to ghardhailo', snackPosition:SnackPosition.BOTTOM );
                },
                child: Text("OK"),
              ),
              Center(
                child: Scratcher(
                  brushSize: 30,
                  threshold: 50,
                  color: Colors.grey,
                  // onChange: (value) => print("Scratch progress: $value%"),
                  // onThreshold: () => print("Threshold reached, you won!"),
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.grey[100],
                    child: Center(
                      child: Text("Congratulation!!!! You got 10% discount"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
           
            icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.ticketAlt), label: 'Coupon', backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.gift), label: 'Reward', backgroundColor: Colors.white),
        ]),
      ),
    );
  }
}