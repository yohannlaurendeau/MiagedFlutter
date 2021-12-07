import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/services/auth.dart';

class ProfilTestScreen extends StatefulWidget {
  const ProfilTestScreen({Key? key}) : super(key: key);

  @override
  _ProfilTestScreenState createState() => _ProfilTestScreenState();
}

class _ProfilTestScreenState extends State<ProfilTestScreen> {
  final AuthService _auth = AuthService();
  @override
  var userid = FirebaseAuth.instance.currentUser!.uid;

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
      Container(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'userid',
              ),
              initialValue: userid,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: 'password',
              ),
              initialValue: "",
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.child_care),
                labelText: 'anniversaire',
              ),

            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.add_location_sharp),
                labelText: 'adresse',
              ),

            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.add_location),
                labelText: 'code postal',
              ),

            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.map),
                labelText: 'ville',
              ),

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          _auth.Deconnexion();
        },
        label: const Text('Déconnexion'),

        backgroundColor: Colors.red,
      ),


    );
  }
}
