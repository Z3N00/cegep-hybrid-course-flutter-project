import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/pages/loginMain.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;



  // create user obj based on firebaseUSer

  Person? _userFromFirebaseUser(User? user){
    return user != null ? Person(uid: user.uid) : null;
  }

  // auth chnage user stream

  Stream<Person?> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  // sign in anonymously
  // Future signInAnon() async {
  //   try{
  //     UserCredential result = await _auth.signInAnonymously();
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user!);
  //   }catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // sign in with email and password

  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try{
      loginMain();
      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // select file


}