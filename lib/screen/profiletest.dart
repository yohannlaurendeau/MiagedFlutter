import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

        print("END BOUCLE");
      });
    }

    print(userProfilesList);

  }

  updateData(String birthday, String adresse, String codePostal, String ville,
      String userID) async {
    await BdManager()
        .updateUserList(birthday, adresse, codePostal, ville, userID);
    fetchDatabaseList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('PROFIL'),
          centerTitle: true,
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
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    labelText: 'password',
                  ),
                  initialValue: "",
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.child_care),
                    labelText: 'anniversaire',
                  ),
                  controller: _birthdayController,

                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.add_location_sharp),
                    labelText: 'adresse',
                  ),
                  controller: _adresseController,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.add_location),
                    labelText: 'code postal',
                  ),
                  controller: _codePostalController,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.map),
                    labelText: 'ville',
                  ),
                  controller: _villeController,
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    submitAction(context);
                  }, child: null, 

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
