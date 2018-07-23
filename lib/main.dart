import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main( ){
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}
class MyState extends State
{

  TextEditingController te1 = new TextEditingController();
  TextEditingController te2 = new TextEditingController();

  String email_value = "";
  String pass_value = "";


  void insert( ) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', te1.text);
    await prefs.setString('pass', te2.text);
    prefs.commit();
  }

  void read( ) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email_value =   await prefs.getString('email');
    pass_value =   await prefs.getString('pass');

    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter App",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0
              ),
              textAlign: TextAlign.center,),
            backgroundColor: Colors.deepOrange,
          ),
          body:new Center(
              child: new Form(
                  child: new Column(
                      children: <Widget>[

                            new TextFormField(
                              decoration: new InputDecoration(
                                hintText: 'Enter User Name'
                              ),
                              controller: te1,
                            ),

                          new Padding(padding: EdgeInsets.only(top: 20.0)),

                            new TextFormField(
                              decoration: new InputDecoration(
                                  hintText: 'Enter Password'
                              ),
                              controller: te2,
                            ),

                            new Padding(padding: EdgeInsets.only(top: 20.0)),

                            new Row(
                              children: <Widget>[
                                new RaisedButton(onPressed: read,
                                child: new Text("READ",
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),),
                                color: Colors.greenAccent,
                                ),

                                new Padding(padding: const EdgeInsets.only(left: 20.0)),

                                new RaisedButton(onPressed: insert,
                                  child: new Text("INSERT",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),),
                                  color: Colors.greenAccent,
                                )
                              ],
                            ),

                            new Padding(padding: const EdgeInsets.only(top: 20.0)),

                            new Text("$email_value",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            new Padding(padding: const EdgeInsets.only(top: 20.0)),

                            new Text("$pass_value",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                        
                        
                      ],
                  ),),
          ),
          floatingActionButton:
          new FloatingActionButton(onPressed: null,
            backgroundColor: Colors.deepOrange,
            child: new Icon(Icons.face),),

        )
    );
  }

}

/*
class MyWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: new Scaffold(
       appBar: new AppBar(
         title: new Text("Flutter App",
         style: new TextStyle(
           fontWeight: FontWeight.bold,
           color: Colors.white,
           fontSize: 30.0
         ),
         textAlign: TextAlign.center,),
         backgroundColor: Colors.deepOrange,
       ),
       body:new Center(
         child: new Text("Welcome 2 NareshIT",
           style: new TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.deepOrange,
               fontSize: 50.0
           ),
           textAlign: TextAlign.center,)
       ),
       floatingActionButton:
       new FloatingActionButton(onPressed: null,
       backgroundColor: Colors.deepOrange,
       child: new Icon(Icons.face),),
       
     )
   );
  }
} */
