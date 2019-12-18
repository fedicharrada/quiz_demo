

import 'package:flutter/material.dart';
import 'quiz_app.dart';


class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHome> {


  @override
  Widget build (BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Quiz Home'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Card(
              elevation: 8.0,
              child: new Container(
                height:MediaQuery.of(context).size.height *0.6 ,
                width: MediaQuery.of(context).size.width *0.8,
                child: Image.asset('images/quizz_cover.jpg', fit: BoxFit.cover,),
              ),

            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('Demarer le Quizz'),
              onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){return new QuizzPage();}));
              },
            )
            
          ],
        )

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
