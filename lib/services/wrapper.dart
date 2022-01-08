
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/navigation_container.dart';
import 'package:social_media_app/pages/loginMain.dart';
import 'package:social_media_app/pages/profile_page.dart';

import 'auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return NavigationContainer();
          } else
            return loginMain();
        });
  }
}
