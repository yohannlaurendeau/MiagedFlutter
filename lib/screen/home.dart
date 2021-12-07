import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/screen/acheter.dart';
import 'package:miagedflutter/screen/panier.dart';

import 'package:miagedflutter/screen/profiletest.dart';
import 'package:miagedflutter/services/auth.dart';

class HomeScreen extends StatelessWidget {
  @override

  final AuthService _auth = AuthService();


  Widget build(BuildContext context) {
    return Scaffold(


      body:

           MaterialApp(
             home: MyBottomNavigationBar(),
             debugShowCheckedModeBanner: false,

      ),


    );
  }
}



class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex = 0;
  final List<Widget> _children =[
    AcheterScreen(),
    PanierScreen(),
    ProfilTestScreen(),

  ];

  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        items:[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Acheter")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Panier")
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Profil")
          ),
        ],
        onTap: _onTappedBar,
        currentIndex: _currentIndex,
      ),

    );
  }
}

