import 'package:flutter/material.dart';
import 'package:flutterhive/Models/ContactModel.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  late Box<String> userBox;

   List<ContactModel> userContact = [];


  @override
  void initState() {
    super.initState();
    userBox = Hive.box<String>("user");

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,

        backgroundColor: Colors.black,

        title: Text(
          'Contacts',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userContact.length,
        itemBuilder: (context,int index){
          return ListTile(
            tileColor: Colors.black,
            title: Text('Roy',
            style: TextStyle(
              color: Colors.white,
            ),),
          );
        },),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[100],
        onPressed: (){
          String? name = nameController.text;
          String? number = numberController.text;
          userContact.add(ContactModel(name:name ,number: number));
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        child: Icon(Icons.add,
        color: Colors.black,),
      ),
    );
  }
  Widget _buildPopupDialog(BuildContext context) {

    return new AlertDialog(
      elevation: 10,
      title: const Text('Add Contact Details'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.name,

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
                    hintText: "Name",
                    fillColor: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.phone,

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
                    hintText: "Phone Number",
                    fillColor: Colors.white),
              ),
            ),
          ),

          SizedBox(
            height:15 ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              ElevatedButton(
                onPressed: (){
                  if(nameController.text.isEmpty || numberController.text.isEmpty)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Field cannot be empty!")));
                    }
                  else if(nameController.text.isEmpty && numberController.text.isEmpty)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Field cannot be empty!")));
                    }
                  else{
                    nameController.text = "";
                    numberController.text = "";

                    Navigator.pop(context);
                  }



                }, child: Text('Add'),),
            ],
          ),


        ],
      ),

    );
  }

  /*Route _createRoute() {
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
  }*/
}
