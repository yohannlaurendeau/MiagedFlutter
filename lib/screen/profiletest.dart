import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miagedflutter/bd/BdManager.dart';
import 'package:miagedflutter/services/auth.dart';

class ProfilTestScreen extends StatefulWidget {
  const ProfilTestScreen({Key? key}) : super(key: key);

  @override
  _ProfilTestScreenState createState() => _ProfilTestScreenState();
}

//A FINIR
class _ProfilTestScreenState extends State<ProfilTestScreen> {
  final AuthService _auth = AuthService();
  String userID = "";
  List userProfilesList = [];

  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _codePostalController = TextEditingController();
  final TextEditingController _villeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();

  }


  fetchUserInfo() async {
    User getUser = await FirebaseAuth.instance.currentUser;
    userID = getUser.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await BdManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
        print("SUCESS to retrieve");
        print(userProfilesList);
        print("END BOUCLE");
      });
    }

    print(userProfilesList);

  }



  updateData(String birthday, String adresse, String codePostal, String ville,
      String userID)  {

     BdManager()
        .updateUserList(birthday, adresse, codePostal, ville, userID);
    fetchDatabaseList();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('PROFIL'),

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
        body: SingleChildScrollView(

          child: Container(

            child: Column(

              children: [
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'userid',
                  ),

                  initialValue: userProfilesList[0]['id'],
                  enabled: false,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: 'password',
                  ),
                  initialValue: userProfilesList[0]['password'],
                  obscureText: true,

                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.child_care),
                    labelText: 'anniversaire',
                  ),

                  controller: _birthdayController..text = userProfilesList[0]['birthday'],

                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.add_location_sharp),
                    labelText: 'adresse',
                  ),

                  controller: _adresseController..text = userProfilesList[0]['addresse'],

                ),
                SizedBox(height: 10.0),


                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.map),
                    labelText: 'ville',
                  ),
                  controller: _villeController..text = userProfilesList[0]['ville'],


                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.add_location),
                    labelText: 'code postal',
                  ),
                  controller: _codePostalController..text = userProfilesList[0]['codepostal'],
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                SizedBox(height: 30.0),
                ElevatedButton(

                  onPressed: () {
                    submitAction(context);
                  },
                  child: const Text('Valider'),

                ),
              ],
            ),
          ),



        ));
  }

  submitAction(BuildContext context) {
    updateData(_birthdayController.text, _adresseController.text,
        _codePostalController.text, _villeController.text, userID);
    print(userID);
    print("Hello");
    print(_birthdayController.text);
    _birthdayController.clear();
    _adresseController.clear();
    _codePostalController.clear();
    _villeController.clear();

  }
}
