import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miagedflutter/services/auth.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> productProfilesList;
  DetailScreen({Key? key, required this.productProfilesList}) : super(key: key);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          ),
        ],
      ),
      body:
        SafeArea(
          child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
            child: ListView(
                children: <Widget>[
            Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),

          ),
            SizedBox(height: 10,),
            Card(
              elevation: 2,
              child: Hero(
                tag:"TEST", //widget.id.toString(),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(productProfilesList['image']),fit: BoxFit.cover)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Nom :",style: TextStyle(
                      fontSize: 16,
                      height: 1.5
                  ),),

                  Flexible(
                    child: Text(productProfilesList['titre'],style: TextStyle(
                        fontSize: 16,
                        height: 1.5
                    ),),
                  ),
                ],
        ),
    ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Taille :",style: TextStyle(
                            fontSize: 16,
                            height: 1.5
                        ),),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Text(productProfilesList['taille'],style: TextStyle(
                              fontSize: 16,
                              height: 1.5
                          ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Prix :",style: TextStyle(
                            fontSize: 16,
                            height: 1.5
                        ),),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Text(productProfilesList['prix'],style: TextStyle(
                              fontSize: 16,
                              height: 1.5
                          ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("marque :",style: TextStyle(
                            fontSize: 16,
                            height: 1.5
                        ),),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Text(productProfilesList['marque'],style: TextStyle(
                              fontSize: 16,
                              height: 1.5
                          ),),
                        ),
                      ],
                    ),
                  ),

        ],
    )
        ),
        ),
    );
  }
}
