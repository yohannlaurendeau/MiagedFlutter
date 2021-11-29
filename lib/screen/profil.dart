import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/services/auth.dart';

class ProfilScreen extends StatelessWidget {

  @override

  final AuthService _auth = AuthService();
  profil(){
    return FirebaseFirestore.instance.collection('guestbook').add(<String, dynamic>{
      'text': "C EST UN TEST",
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('PROFIL'),
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
          onPressed: () async {
            await _auth.Deconnexion();
          },
        label: const Text('Déconnexion'),

        backgroundColor: Colors.red,
      ),

    );
  }
}
