
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/_mock_data/mock.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/pages/loginMain.dart';
import 'package:social_media_app/pages/signin.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/services/firebase_api.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();


  AccessToken? _accessToken;
  UserModel? _currentUser;

  File? file;

  @override
  Widget build(BuildContext context) {


    final fileName = file != null ? basename(file!.path) : "No File Selected";

    return Scaffold(
      backgroundColor: Colors.white,


      appBar: PreferredSize(
          child: appBar(),
          preferredSize: Size.fromHeight(180)),
      body: Body(context),

    );
  }


  // case FacebookLoginStatus.loggedIn:
  // print("LoggedIn");
  //
  // var graphResponse = await http.get(
  // 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
  //     .accessToken.token}');
  //
  // var profile = json.decode(graphResponse.body);
  // print(profile.toString());
  //
  // onLoginStatusChanged(true, profileData: profile);
  // break;


  Widget appBar()  {
    UserModel? user = _currentUser;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.black)
              ),
              child: Center(
                child: GestureDetector(
                  onTap: selectFile,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        image: const DecorationImage(
                            image: AssetImage("assets/user.jpg"),
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text("User",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black,),),
            const SizedBox(height: 10,),
            const Text("@user431", style: TextStyle(fontSize: 16,color: Colors.black,),),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(
            onPressed: ()async{
              await _auth.signOut();

              Navigator.push(context, MaterialPageRoute(builder: (context) => loginMain()));
              Fluttertoast.showToast(
                msg: "Logout Successfully",
                toastLength: Toast.LENGTH_LONG,
                //gravity: ToastGravity.CENTER
              );

            },
            icon: Icon(Icons.person),
            label: Text("Logout")
        )
      ],
    );
  }

  Widget Body(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(

      child: Column(
        children: [
          const SizedBox(height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text("Posts",
                      style: TextStyle(fontSize: 15, color: Colors.black)
                  ),
                  SizedBox(height: 8,),
                  Text("8", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text("Followers",
                      style: TextStyle(fontSize: 15, color: Colors.black)
                  ),
                  SizedBox(height: 8,),
                  Text("565", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text("Following",
                      style: TextStyle(fontSize: 15, color: Colors.black)
                  ),
                  SizedBox(height: 8,),
                  Text("15", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,
          ),

          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: List.generate(imgList.length, (index){
              return Container(
                width: (size.width-60)/2,
                height: (size.width-60)/2,
                decoration: BoxDecoration(image: DecorationImage(
                    image:NetworkImage(imgList[index]),
                    fit: BoxFit.cover)),
                child: const Center(
                  child: Icon(Icons.play_circle_outline,size: 40,color: Colors.white),

                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if(result == null) return;
    final path = result.files.single.path!;
    setState(() => file = File(path));

    setState(() {
      uploadFile();
    });
  }


  Future uploadFile() async {
    if(file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    FirebaseApi.uploadFile(destination, file!);
  }

  basename(String path) {
    return path;
  }

}

