import 'package:balance_calculator/screens/calculation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank Calculator',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/pic.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 50,
            bottom: 300,
            child: Text(
              'Banking Balance Calculator',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 100,
            child: Container(
              transform: Matrix4.translationValues(0, -100, 0),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3.4,
                    shadowColor: Colors.purple,
                    primary: Colors.purple),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  _auth.signInAnonymously().whenComplete(
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Calculation(),
                          ),
                        ),
                      );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
