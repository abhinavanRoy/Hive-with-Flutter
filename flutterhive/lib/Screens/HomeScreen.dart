import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        actions:<Widget> [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.logout), onPressed: () {
                Navigator.of(context).pushReplacement(_createRoute());
              },
              )
          ),
        ],
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
        height: height,
        width: width,
        color: Colors.black,

        child: Column(
          children:<Widget> [
            Row(
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text("Welcome Abhinavan",
                    style: TextStyle(
                      fontSize: width/34,

                      color: Colors.white,

                    ),),
                )
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
}
