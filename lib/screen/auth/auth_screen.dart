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
      _formKey.currentState?.reset();
      emailController.text = '';
      passwordController.text = '';
      showSignIn = !showSignIn;
      textErr='';

    });
  }


  Widget build(BuildContext context) {
    return loading ? Loading() :
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: new Center(child: new Text(showSignIn ? 'MIAGED' : 'MIAGED', textAlign: TextAlign.center)),
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(showSignIn ? 'Connexion' : 'Inscription',
                style: TextStyle(color: Colors.white)),
              onPressed: ()=>toggleView(),
          )
        ],
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) =>
                value == null || value.isEmpty ? "Entrez un nom d'utilisateur" : null,
                decoration: InputDecoration(
                    hintText: 'email'
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value) => value != null && value.length < 6
                    ? "Entrez un mot de passe au minimum 6 caractères"
                    : null,
                decoration: InputDecoration(
                    hintText: 'mot de passe'
                ),

              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                child: Text(
                  showSignIn ? "Connexion" : "Inscription",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  if(_formKey.currentState?.validate() == true){
                    setState(() => loading = true);
                    var password = passwordController.value.text;
                    var email = emailController.value.text;

                    //TODO CALL FIREBASE

                    dynamic result = null;
                    if(result == null){
                      setState((){
                        loading = false;
                        textErr = "Entrez un email valide";
                      });

                    }
                  }
                },
              ),
              SizedBox(height: 10.0),
              Text(
                textErr,
                style: TextStyle(color: Colors.red, fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
