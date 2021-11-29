import 'package:flutter/material.dart';
import 'package:miagedflutter/screen/auth/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miagedflutter/screen/switch_screen.dart';
import 'package:miagedflutter/services/auth.dart';

import 'package:miagedflutter/user.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return StreamProvider<AppUser?>.value(

        value: AuthService().user,
        
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SwitchScreen(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

        ),
    );


  }
}

