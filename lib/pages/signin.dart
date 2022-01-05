import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/models/user.dart';
import 'package:social_media_app/models/user_login.dart';
import 'package:social_media_app/navigation_container.dart';
import 'package:social_media_app/pages/loginMain.dart';
import 'package:social_media_app/pages/signup.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/widgets/loading.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  late bool _isHidden = true;
  bool loading = false;



  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),

        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text("Login",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      Text("Login to your account",
                        style: TextStyle(
                            fontSize: 15,
                            color:Colors.grey[700]),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) => value!.isEmpty ? 'Enter an Email' : null,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 5.0
                                )
                              ),
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail)
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
                              setState(() {
                                email = value;
                              //  print("Email");
                              });
                            },
                          ),

                          const SizedBox(
                            height: 30.0,
                          ),

                          TextFormField(
                            validator: (value) => value!.length < 6 ? 'Enter a password of 6 or more characters' : null,
                            decoration:  InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueGrey,
                                      width: 5.0
                                  )
                              ),
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isHidden = !_isHidden;
                                  });
                                },
                              )
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: _isHidden,
                            onChanged: (value){
                              setState(() {
                                password = value;
                               // print(password);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding:
                  const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration:
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),

                          )

                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            setState(() => loading = true);
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                              //dynamic  user = Provider.of<Person?>(context);
                             // print("user Value: " + user);
                            if(result == null) {
                              setState(() {
                                error = 'Could Not Sign In With Those Credentials ';
                                loading = false;
                                Fluttertoast.showToast(
                                  msg: error,
                                  toastLength: Toast.LENGTH_LONG,
                                  //gravity: ToastGravity.CENTER
                                );
                              });
                            }else if(result != null){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationContainer()));
                            }
                            // else if(user == null){
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=> loginMain()));
                            // }
                          }

                        },
                        color: Colors.redAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: const Text(
                          "Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),

                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account?"),

                      GestureDetector(
                        child:  const Text(" Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          //decoration: TextDecoration.underline,
                          color: Colors.blue,
                        )
                      ),

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                           // print("clicked on sign up page");
                          //signupColor = Colors.black;
                        },

                      )
                    ],
                  ),

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}


