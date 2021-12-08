import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miagedflutter/user.dart';



class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebase(User user){
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future Connexion(String email, String password) async {
    try{
      UserCredential result =
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch(exception){
      print(exception.toString());
      return null;
    }

  }

  Future Inscription(String email, String password) async {
    try{
      UserCredential result =
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;


      FirebaseFirestore.instance.collection('guestbook').add({
        'text': "C EST UN TEST DEPUIS INSCRIPTION",
        'email': email,
        'password': password,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'anniversaire':'',
        'addresse':'',
        'codepostal':'',
        'ville':'',

      });
      print("hello c est auth ici");
      print(FirebaseAuth.instance.currentUser!.uid);
      return _userFromFirebase(user);
    } catch(exception){
      print(exception.toString());
      return null;
    }

  }


  Future Deconnexion() async {
    try{
      return await _auth.signOut();
    } catch(exception){
      print(exception.toString());
      return null;
    }

  }



}

