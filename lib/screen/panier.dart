import 'package:flutter/material.dart';
import 'package:miagedflutter/services/auth.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({Key? key}) : super(key: key);

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('PANIER'),
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
      body: new Center(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
