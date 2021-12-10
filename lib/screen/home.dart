import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/common/loading.dart';
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
  bool loading = false;
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
    return loading ? Loading() :
    new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        items:[
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_shopping_cart,color: Colors.red,),
            title: new Text("Magasin",style: TextStyle(color: Colors.red),)
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_basket,color: Colors.green, ),
              title: new Text("Panier",style: TextStyle(color: Colors.green))
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person,color:Colors.lightBlueAccent,),
              title: new Text("Profil",style: TextStyle(color: Colors.lightBlueAccent))
          ),
        ],
        onTap: _onTappedBar,
        currentIndex: _currentIndex,
      ),

    );
  }
}

