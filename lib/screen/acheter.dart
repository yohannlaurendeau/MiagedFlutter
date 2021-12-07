import 'package:flutter/material.dart';
import 'package:miagedflutter/services/auth.dart';
const kDefaultPaddin = 40.0;
class AcheterScreen extends StatefulWidget {

  @override
  _AcheterScreenState createState() => _AcheterScreenState();
}

class _AcheterScreenState extends State<AcheterScreen> {
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
          )
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Text(
        "Women",
        style: Theme.of(context)
            .textTheme
            .headline5

      ),
      ),
            Categories(),


    ]),

    );
  }
}

class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Sac","Manteau","Pantalon"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index)=> Text(
            categories[index],
          ) ),
    );
  }
}



