import 'dart:math';

import 'package:flutter/material.dart';
  String winnerTxt="";
  int yourPoint=0;
  int computerPoint=0;
main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RPS(),
      
    );
  }
}
class RPS extends StatefulWidget {
  @override
  _RPSState createState() => _RPSState();
}

class _RPSState extends State<RPS> {
  String photoName="qm";
  String computerName="qm";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Rock Paper Scissor",
        ),
        backgroundColor: Colors.blue,
      ),
      body:Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "Choose One",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
                    Row(
           children: [
            
               Expanded(
            child:  FlatButton(
              child: Image.asset("images/S.png"),
              onPressed: (){
                setState(() {
                  photoName="S";
      computerName=getForComputer();
       winnerTxt="";
                });
              },
              ),
              
               ),
                    
               Expanded(
            child: FlatButton(
              child: Image.asset("images/R.png"),
              onPressed: (){
                setState(() {
                  photoName="R";
                  computerName=getForComputer();
                  winnerTxt="";
                });
              },
              ),
              
              
               ),
                    
               Expanded(
            child: FlatButton(
              child: Image.asset("images/P.png"),
              onPressed: (){
                setState(() {
                  photoName="P";
                  computerName=getForComputer();
                   winnerTxt="";
                });
              },
              ),
              
              
               )
          
           ],
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
                Expanded(
            child:  Image.asset("images/$photoName.png"),
               
               ),
               Text(
                 "VS",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 50,
                   fontFamily: 'Audiowide',
                   fontStyle: FontStyle.italic
                 ),
               ),
               Expanded(
            child:  Image.asset("images/$computerName.png"),
              
               ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
              Text(
                "You ",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Text(
                "Computer",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
              Text(
                "Point: $yourPoint",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Text(
                "Point:$computerPoint",
                style: TextStyle(
                  fontSize: 25
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            winner(photoName, computerName),
            style: winnerColor(photoName, computerName),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: (){
              setState(() {
                 photoName="qm";
                  computerName="qm";
                  winnerTxt="Winner";
              });
            },
                      child: Icon(
              Icons.replay,
              size: 50,
            ),
          )
        ],
        
      )
    );
  }
}
String getDecision(String choice){
  return (choice=="P")?"P":(choice=="R")?"R":"S";
}
String getForComputer(){
int number=Random().nextInt(3)+1;
return (number==1)?"P":(number==2)?"R":"S";
}

String winner(String user,String computer){
  if((user=="P" && computer =="R") ||(user=="R" && computer=="S")||(user=="S" && computer=="P")){
  return (winnerTxt=="Winner")?winnerTxt:"You Win";
  }
else if((user=="P" && computer=="P") || (user=="S" && computer=="S") || (user=="R" && computer=="R")){
 return (winnerTxt=="Winner")?winnerTxt:"Draw";
  }else if(user=="qm" && computer=="qm"){
    return "Winner";
  }
  else{
    return   (winnerTxt=="Winner")?winnerTxt:"You Lose";
  }
}
TextStyle winnerColor(String user,String computer){
    if((user=="P" && computer =="R") ||(user=="R" && computer=="S")||(user=="S" && computer=="P")){
  return TextStyle(
     fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.green
  );
  }else if((user=="P" && computer=="P") || (user=="S" && computer=="S") || (user=="R" && computer=="R")){
    return TextStyle(
     fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.yellow[900]
  );
  }else if(winnerTxt=="Winner" || (user=="qm" && computer=="qm")){
    return TextStyle(
     fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
  }
  else{
     return TextStyle(
     fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.red
  );
  }
  }