import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:miagedflutter/bd/BdManager.dart';
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
  List productProfilesList = [];

  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await BdManager().getProductList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        productProfilesList = resultant;
        print("SUCESS to retrieve PRODUCT");
        print(productProfilesList[0]['prix']);
        print(productProfilesList[1]['prix']);
        print(productProfilesList[2]['prix']);
        print(productProfilesList[3]['prix']);
        print("END BOUCLE");
      });
    }



  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.red.shade300),
      home :new Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.redAccent,
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
                MaterialPageRoute(builder: (context) => DetailScreen(productProfilesList :productProfilesList[0])),);
          },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image(image: NetworkImage(productProfilesList[0]['image'])),
              color: Colors.white,


            ),

          ),
          Text('${productProfilesList[0]['titre']}\nTaille : ${productProfilesList[0]['taille']}\nPrix : ${productProfilesList[0]['prix']}',
              textAlign: TextAlign.center,
              style: TextStyle(height: 3, fontSize: 15,color: Colors.white),

          ),
          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen(productProfilesList :productProfilesList[1])),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image(image: NetworkImage(productProfilesList[1]['image'])),
              color: Colors.white,

            ),

          ),
          Text('${productProfilesList[1]['titre']}\nTaille : ${productProfilesList[1]['taille']}\nPrix : ${productProfilesList[1]['prix']}',
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 15,color: Colors.white),

          ),



          InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen(productProfilesList :productProfilesList[2])),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image(image: NetworkImage(productProfilesList[2]['image'])),
              color: Colors.white,

            ),

          ),
          Text('${productProfilesList[2]['titre']}\nTaille : ${productProfilesList[2]['taille']}\n Prix : ${productProfilesList[2]['prix']}',
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 15,color: Colors.white),

          ),InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen(productProfilesList :productProfilesList[3])),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image(image: NetworkImage(productProfilesList[3]['image'])),
              color: Colors.white,

            ),

          ),
          Text('${productProfilesList[3]['titre']}\nTaille : ${productProfilesList[3]['taille']}\n Prix : ${productProfilesList[3]['prix']}',
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 15,color: Colors.white),

          ),InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen(productProfilesList :productProfilesList[4])),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child:Image(image: NetworkImage(productProfilesList[4]['image'])),
              color: Colors.white,

            ),


          ),

          Text('${productProfilesList[4]['titre']}\nTaille : ${productProfilesList[4]['taille']}\n"Prix : ${productProfilesList[4]['prix']}',
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 15,color: Colors.white),

          ),InkWell(
            onTap: (){
              print("CLICKED");
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailScreen(productProfilesList :productProfilesList[5])),);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image(image: NetworkImage(productProfilesList[5]['image'])), color: Colors.white,

            ),

          ),
          Text('${productProfilesList[5]['titre']}\nTaille : ${productProfilesList[5]['taille']}\nPrix : ${productProfilesList[5]['prix']}',
            textAlign: TextAlign.center,
            style: TextStyle(height: 3, fontSize: 15,color: Colors.white),

          ),],
      )

    ));
  }
}
