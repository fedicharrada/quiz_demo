import 'package:flutter/material.dart';
import 'package:quiz_demo/Model/question.dart';


class QuizzPage extends StatefulWidget {
  @override
  _QuizzPage createState()=>_QuizzPage();



}
 class _QuizzPage extends State <QuizzPage>{

  Question question;
  List<Question> listQuestions=[
    new Question('Les BCAA sont ils des acides necessaires dans la musculation ?', true, 'BCAA sont necessaires pour la contruction des fibres', 'bcaa.jpg'),
    new Question('Lucifer est elle une serie originale Netflix ?', true, 'Lucifer notée 8.5', 'lucifer.jpg'),
    new Question('Paris est elle la capitale de France ?', true, 'Paris est en nord ouest de france', 'paris.jpg'),
    new Question('Limoges est elle la plus grande ville de monde ?', false, 'Tokyo est la plus grande ville', 'limoges.jpg'),
  ];

  int index=0;
  int score=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    question= listQuestions[index];

  }

  @override
   Widget build(BuildContext context){
    var size=MediaQuery.of(context).size.width*0.7;
    return Scaffold(
      appBar: new AppBar(
        title: Text('QUIZZ GO'),
      ),
      body: new Center(
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[


          Text('Votre score est: ${score.toString()}'),
          Card(
            elevation: 8.0,
            child: Container(
              height: size,
              width: size,
              child: new Image.asset('images/${question.imagepath}'),
            ),
          ),

          Container(height: 15,),
          Container(
            alignment: Alignment.topCenter,

            height: size*0.2,
            width: size*1.4,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Text(question.question, style: TextStyle(color: Colors.white),),
            padding: EdgeInsets.only(left: 20, top: 5),
          ),
          Container(height: 20,),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),


                child: buttonBool(true),
              ),
              buttonBool(false)

            ],
          )
        ],),
      ),
    );


  }

  RaisedButton buttonBool(bool b){
  return new RaisedButton(onPressed:(()=>dialog(b)),
  elevation: 6.0,
  color: Colors.lightBlueAccent,
  child: Text(b.toString().toUpperCase()),);
  }


  Future dialog(bool b)async{
   bool verifReponse=(b==question.response);
   String vrai='images/true.png';
   String faux='images/false.png';
   if(verifReponse){score++;}
   return showDialog(context: context,
   barrierDismissible: false,
     builder: (BuildContext context){
     return SimpleDialog(
       title: Text(verifReponse ? "Bravo": "Dommage"),
       children: <Widget>[
         Image.asset(verifReponse ? vrai : faux , fit: BoxFit.cover),
         Container( alignment: Alignment.topCenter,

           height: 40,
           width: 200,
           padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),

           child:Text(question.explication),
         ),
         Container(height: 20.0, width: 60,),

         SizedBox(

           width: 2,
             child: RaisedButton(
           onPressed:(){ Navigator.pop(context);
           getNextQuestion();   },
           color:Colors.blue,
           child: Text("Next Question"),
         ), )

       ],

     );
     }

   );
  }

  getNextQuestion(){
    if(index<listQuestions.length-1){
      index++;
      setState(() {
        question=listQuestions[index];
      });
    } else alerte();

  }



  Future<Null> alerte()async{
  return showDialog(context: context,barrierDismissible: false,
  builder: (BuildContext buildContext){
    return AlertDialog(
      title: Text('Fin de Quizz',  style: TextStyle(color: Colors.blue),),
      contentPadding: EdgeInsets.all(20),
      content: Text('Votre Score : $score /4', style: TextStyle(color: Colors.deepPurpleAccent),),
      actions: <Widget>[
        FlatButton(
          onPressed: ((){Navigator.pop(buildContext); Navigator.pop(context);}),
          child: Text('Exit'),
        )
      ],
    );
  }
  );


  }



 }

