import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';


class FB{
  final fb = FacebookLogin();


  fbSignIn() async {

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

// Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
      // Logged in

      // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        final AuthCredential authCredential = FacebookAuthProvider.credential(accessToken!.token);
        final result = await FirebaseAuth.instance.signInWithCredential(authCredential);

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);

        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');

        break;

      case FacebookLoginStatus.cancel:
      // User cancel log in
        break;
      case FacebookLoginStatus.error:
      // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }


  }

  fbProfileImage() async {
      final imageUrl = await fb.getProfileImageUrl(width: 100);
      return imageUrl;
  }
  fbProfileName() async {
    final profile = await fb.getUserProfile();
    return profile!.name;
  }
  fbProfileEmail() async {
    final email = await fb.getUserEmail();
    if(email!= null){
      return await email;
    }else {
      return "@User123";
    }
  }
  fbLogInCheck() async {

    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    bool flag;

    switch(res.status){
      case FacebookLoginStatus.success:
        flag = true;
        break;

      case FacebookLoginStatus.cancel:
        // TODO: Handle this case.
        flag = false;
        break;

      case FacebookLoginStatus.error:
        // TODO: Handle this case.
        flag = false;
        break;

    }
    return flag;

  }
}


