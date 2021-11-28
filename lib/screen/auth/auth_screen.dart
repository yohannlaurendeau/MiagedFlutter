import 'package:flutter/material.dart';
import 'package:miagedflutter/common/loading.dart';

class AuthScreen extends StatefulWidget {

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {

  final _formKey = GlobalKey<FormState>(); // Cle obligatoire pour identifier le formulaire et valider les champs
  String textErr ='';
  bool loading = false;

  final emailController = TextEditingController(); // Champ de texte
  final passwordController = TextEditingController(); // Champ de texte
  bool showSignIn = true; //Switch entre formulaire


  @override
  void dispose(){ // Permet de clear les 2 controleurs
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  void toggleView() {
    setState(() {
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
    });
  }


  Widget build(BuildContext context) {
    return loading ? Loading() :
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(showSignIn ? 'Connexion A MIAGED' : 'Inscription A MIAGED'),
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.person),
              label: Text(showSignIn ? 'Connexion' : 'Inscription'),
              onPressed: ()=>toggleView(),
          )
        ],
      ),
    );
  }
}
