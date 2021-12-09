import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(



    appBar: AppBar(
    title: Text('Profile',textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
    ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Icon(Icons.person_outline,
          color: Colors.grey,
          size:100.0),
          SizedBox(height:15.0,),
          Text('Sign Up for an account'),
          SizedBox(width:200.0,
              child: Builder(
            builder: (context) => RaisedButton(onPressed: () =>{},
            color: Colors.red[400],
              textColor:Colors.white,
              child: Text('Sign up')

            ),
      ),
    ),
        ]
      ),
      ),
    );


  }
}
