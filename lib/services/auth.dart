import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/pages/loginMain.dart';

AccessToken? _accessToken;
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map<String, dynamic>? _userData;

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

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email']);
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    if(loginResult == LoginStatus.success){
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    }else{
      print(loginResult.message);
    }

    String userEmail = _userData!['email'];
    print(userEmail.toString());
    return await _auth.signInWithCredential(facebookAuthCredential);
  }


  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult =
  //   await FacebookAuth.instance.login(permissions: ['email']);
  //   final OAuthCredential facebookAuthCredential =
  //   FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   final userData = await FacebookAuth.instance.getUserData();
  //   String userEmail = userData['email'];
  //   print(userEmail.toString());
  //   // UserAttributes userAttributes = UserAttributes(email: userEmail, );
  //
  //   // await NewUser(uid: _accessToken!.userId).addUser('${userEmail}');
  //   return await _auth.signInWithCredential(facebookAuthCredential);
  // }

  //another method sign in facebook



  // // sign out
  Future signOut() async {
    try{

      return await _auth.signOut();

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> logOut() async {
    await FacebookAuth.i.logOut();
    await _auth.signOut();
  }

}

  // select file


