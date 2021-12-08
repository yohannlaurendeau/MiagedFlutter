import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/models/product.dart';
import 'package:miagedflutter/screen/details.dart';
import 'package:miagedflutter/screen/panier.dart';
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
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.indigo.shade800),
      home :new Scaffold(

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
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        children: <Widget>[
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
          },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),

          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
            color: Colors.white,
          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen()),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Image(image: NetworkImage('https://image.spreadshirtmedia.net/image-server/v1/mp/products/T635A1MPA4131PT17X258Y88D189221667FS4900Cx000000/views/1,width=378,height=378,appearanceId=1,backgroundColor=F2F2F2/jpg-t-shirt-bio-homme.jpg')),
              color: Colors.white,

            ),

          ),
          Text('TITRE DU PRODUIT\nTAILLE DU PRODUIT\nPRIX DU PRODUIT',textAlign: TextAlign.center),
        ],
      )

    ));
  }
}
