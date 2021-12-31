import 'package:flutter/material.dart';
import 'package:social_media_app/pages/signin.dart';

class SignupPage extends StatefulWidget {

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  late bool _isHidden = true;
  late bool _confirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  const SizedBox(height: 20),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) => value!.isEmpty ? 'Enter a User Name' : null,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 5.0
                              )
                          ),
                          labelText: "User Name",
                          prefixIcon: Icon(Icons.person)
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        setState(() {
                          email = value;
                          //  print("Email");
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
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
                    SizedBox(height: 20.0),
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
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (values) => !_confirmPassword ? 'Password is not matching' : null,
                      decoration:  InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 5.0
                              )
                          ),
                          labelText: "Confirm Password",
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
                          if(value == password){
                            _confirmPassword = true;
                          }else{
                            _confirmPassword = false;
                          }
                          // print(password);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
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

                    }
                  },
                  color: Colors.redAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: const Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  ),

                ),



              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  const Text("Already have an account?"),
                  GestureDetector(
                    child:  const Text(" Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          //decoration: TextDecoration.underline,
                          color: Colors.blue,
                        )
                    ),

                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      // print("clicked on sign up page");
                      //signupColor = Colors.black;
                    },

                  )
                ],
              )



            ],

          ),


        ),

      ),

    );
  }
}




