import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;//This size provides us total height and width of our screen
    return Container(height : size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget> [
          Positioned(
            top:0,
            left:0,
            child: Image.asset("assets/images/main_top.png",
              width: size.width *0.3,
            )
          ,)
          Positioned(child:)
        ],
      ),
    );
  }
}