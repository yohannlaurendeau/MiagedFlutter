import 'package:cloud_firestore/cloud_firestore.dart';

class BdManager {
  final CollectionReference users =
  FirebaseFirestore.instance.collection('guestbook');




  Future updateUserList(String birthday, String adresse, String codePostal,String ville, String uid) async {
    print(birthday);
    print(uid);
    print("UPDATE HERE");
    print(FirebaseFirestore.instance.collection('guestbook').doc(uid));
    return await users.doc(uid).update({
      "birthday": birthday, 'adresse': adresse, 'codePostal': codePostal, 'ville':ville

    });


  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await users.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);

        });
      });
      print("CESTLESITEMS");
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}