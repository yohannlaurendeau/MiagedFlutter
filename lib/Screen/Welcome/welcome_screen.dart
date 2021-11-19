import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class WelcomeScreen extends StatefulWidget{
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
      Text(
        'Email',
        style: TextStyle(
          color: Colors.purple,
          fontSize: 20,

        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6,

            )
          ]
        ),
      )
    ],
  );
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
/*Partie pour la couleur du background etc */decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff5ac18e),
                      Color(0xff5ac18e),
                      Color(0xff5ac18e),
                      Color(0xff5ac18e),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    SizedBox(height: 50,),
                    buildEmail(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}