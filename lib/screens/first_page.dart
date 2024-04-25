import 'package:flutter/material.dart';
import 'package:news_app/screens/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Text(
              "Welcome to News World",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/ronaldo.jpeg",
                height: 240,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Icon(Icons.dashboard)
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                    "Get to Know what happening around the world faster than everyone")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()));
                  },
                  child: const Icon(Icons.arrow_forward)),
            ],
          )
        ],
      ),
    );
  }
}
