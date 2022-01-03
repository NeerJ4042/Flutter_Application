import 'package:flutter/material.dart';
import 'package:flutter_app/utils/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _fkey = GlobalKey<FormState>();

  moveToHome (BuildContext context) async {
    if(_fkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
        child: Form(
          key: _fkey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png", fit: BoxFit.cover),

              SizedBox(height: 20),

              Text("Welcome $name",style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
              ),),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),

                      validator: (value) {
                        if(value == "") {
                          return "Username cannot be blank";
                        }
                      },
                      onChanged: (value) {
                        setState(() { name = value;});
                      },
                    ),


                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Passwprd",
                        labelText: "Password",
                      ),

                      validator: (value) {
                        if(value == "") {
                          return "Password cannot be blank";
                        }else if(value!.length < 6) {
                          return "Password length should be of atleast 6";
                        }
                      },
                    ),

                    SizedBox(height: 40),

                    Material(
                        borderRadius: BorderRadius.circular(changeButton? 50 : 8),
                        color: Colors.purple,
                      child: InkWell(
                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 40,
                          width: changeButton? 50 : 150,
                            child: changeButton?
                                Icon(Icons.done, color: Colors.white)
                                :Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                          ),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}