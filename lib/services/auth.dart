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


      //TODO FIRESTORE
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

