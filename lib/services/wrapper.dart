
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
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<Person?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<Person?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final Person? userAttributes = snapshot.data;
            return userAttributes == null ? loginMain() : NavigationContainer();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
