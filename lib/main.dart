import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/fullScreenVideo.dart';
import 'package:camera/camera.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/navigation_container.dart';
import 'package:social_media_app/pages/loginMain.dart';
import 'package:social_media_app/pages/signin.dart';
import 'package:social_media_app/services/auth.dart';

//late List<CameraDescription> cameras;


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Person?>(context);
    //print("user:  $user");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Social Media App",
      theme: ThemeData(
       textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),

      home: user == null ? loginMain() : NavigationContainer(), //NavigationConatiner()
    );
  }



}


