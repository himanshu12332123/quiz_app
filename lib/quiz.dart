import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget{
 Quiz({super.key});

  @override
  State<Quiz> createState() {
   return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // approach 1
// Widget? activescreeen ;

// @override
//   void initState() {
//   activescreeen = Startscreen(switchscreeen);

//     super.initState();
//   }

// approach 2  using ternary operator
var activescreen = 'start-screen';
List<String> selectedans = [];

void switchscreeen(){
  setState(() {

    // activescreeen = QuestionsScreen();
    activescreen = 'question-screen';
  });
}

void chooseans(String ans){
  selectedans.add(ans);

  if(selectedans.length == questions.length)
{
   setState(() {
   
     activescreen = 'results-screen';
     
   });
}
}

void restartquiz(){

  setState(() {
    selectedans = [];
    activescreen = 'question-screen';
  });
}

 
  @override
  Widget build(context){
   Widget screenwidget = Startscreen(switchscreeen);

   if(activescreen == 'question-screen'){
    screenwidget = QuestionsScreen(onselectans: chooseans,);
   }

   if(activescreen == 'results-screen'){
    screenwidget = Resultsscreen(chosenans: selectedans, onrestart:restartquiz,);
   }

    return  MaterialApp(
      home: Scaffold(
        body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Colors.deepPurple,
              Colors.orange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft
            ),
        ),
        child: screenwidget,
        ),
      ),
    );
  }
}