import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/screen/profil.dart';
import 'package:miagedflutter/services/auth.dart';

class HomeScreen extends StatelessWidget {
  @override

  final AuthService _auth = AuthService();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('MIAGED'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text('Déconnexion'),
            onPressed: () async {
              await _auth.Deconnexion();
            }
          )
        ],
      ),

      body:
        const Center(

        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: ()=>_navigateToNextScreen(context),
            label: const Text('Profil'),
            icon: const Icon(Icons.person),
            backgroundColor: Colors.red,
          ),

    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilScreen()));
}
