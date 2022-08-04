import 'package:flutter/material.dart';
import 'package:pikachu_jumping_game/moving_rock_animation.dart';
import 'package:pikachu_jumping_game/pikachu_jumping_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: jumpingAnimation(),
          ),
          Container(
            height: 200,
            width: 200,
            child: MovingRock(),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  jumpingAnimation();
                });
              },
              child: Text('Jump'))
        ],
      ),
    );
  }
}
