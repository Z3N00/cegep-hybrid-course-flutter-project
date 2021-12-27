import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/fullScreenVideo.dart';
import 'package:camera/camera.dart';
import 'package:social_media_app/pages/loginMain.dart';

late List<CameraDescription> cameras;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Social Media App",
      theme: ThemeData(
       textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      home: loginMain(), //NavigationConatiner()
    );
  }
}
