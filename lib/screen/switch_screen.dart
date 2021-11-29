import 'package:flutter/material.dart';
import 'package:miagedflutter/screen/auth/auth_screen.dart';
import 'package:miagedflutter/screen/home.dart';
import 'package:miagedflutter/user.dart';
import 'package:provider/provider.dart';

class SwitchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    if(user == null){
      return AuthScreen();
    } else {
      return HomeScreen();
    }

  }
}
