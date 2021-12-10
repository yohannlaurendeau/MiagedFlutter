import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BdManager {





  Future<void> updateUserList(String birthday, String adresse, String codePostal,String ville, String uid) async {
    //print(birthday);
    print(uid);
    print("UPDATE HERE");
    //print(FirebaseFirestore.instance.collection('user').doc(uid));

    return FirebaseFirestore.instance!.collection('user')
        .doc(uid) //// IMPORTAN A CHANGER DOIT ETRE DOCUMENTID PAS CHAMPS ID
        .update({'birthday': birthday, 'addresse': adresse, 'codepostal': codePostal, 'ville':ville})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));

  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await FirebaseFirestore.instance.collection('user').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
         if(element.data()['id'] == FirebaseAuth.instance.currentUser.uid){
           itemsList.add(element.data());
         }

          //print(element.data()['email']);


        });
      });



      print("CESTLESITEMS");

      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future getProductList() async {
    List productList = [];

    try {
      await FirebaseFirestore.instance.collection('products').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {

            productList.add(element.data());


          //print(element.data()['email']);


        });
      });
      print("C EST LES PRODUITS");
      print(productList[0].runtimeType);





      return productList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}