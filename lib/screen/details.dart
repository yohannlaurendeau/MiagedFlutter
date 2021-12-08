import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miagedflutter/services/auth.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('SHOP'),
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
          ),
        ],
      ),
      body: new Center(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
