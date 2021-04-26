
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutterhive/Screens/LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'HomeScreen.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Box<String> friendsBox;
  var nameFromHive = "See your Name form Hive here";


  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController reEnteruserPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    friendsBox = Hive.box<String>("friends");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Hive With Flutter',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        height: height,
        width: width,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: AnimatedTextKit(

                        animatedTexts: [
                          WavyAnimatedText('SignUp',
                              textStyle: TextStyle(
                                  color: Colors.blue.shade100,

                                  fontSize: 25.0
                              )

                          ),

                        ],
                        isRepeatingAnimation: false,

                      ),
                    ),],
                ),
                SizedBox(
                  height: height / 80,
                ),


                Image.network(
                  'https://avatars.githubusercontent.com/u/55202745?s=200&v=4',
                  width: 120,
                  height: 120,
                ),
                SizedBox(
                  height: height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: userNameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                          hintText: "Username",
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: userPasswordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        filled: true,

                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                        hintText: "Password",
                        fillColor: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(

                    keyboardType: TextInputType.number,
                    controller: reEnteruserPasswordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                        filled: true,

                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                        hintText: "Re-enter Password",
                        fillColor: Colors.white),
                  ),
                ),

                SizedBox(
                  height: height / 40,
                ),
                SizedBox(
                  height: height/22,
                  width: width/5,
                  child: ElevatedButton(

                    onPressed: () {
                      final key = userPasswordController.text;
                      final value = userNameController.text;
                      friendsBox.put(key, value);
                      Navigator.of(context).pushReplacement(_HomeCreateRoute());

                    },
                    child: Text(
                      "SignUp",
                      style: GoogleFonts.mcLaren(
                          textStyle:
                          TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(onPressed: (){
                  Navigator.of(context).pushReplacement(_createRoute());
                }, child: Text('Already have an account? Login',
                  style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: width/45,
                      )
                  ),
                ),),


              ],
            ),
          ],
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  Route _HomeCreateRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
