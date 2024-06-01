import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';



class QuestionsScreen extends StatefulWidget{
    QuestionsScreen({super.key,required this.onselectans});

    void Function ( String ans) onselectans;
  @override
  State<QuestionsScreen>createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentquestionindex = 0;

   void anserquestion(String selectedans) {
      widget.onselectans(selectedans);

    setState(() {
          currentquestionindex = currentquestionindex + 1;

    });
  }
  @override
  Widget build(BuildContext context){
    

    final currentquestion = questions[currentquestionindex];
    return  SizedBox(
    width: double.infinity,
    child: Container(
    margin:EdgeInsets.all(20),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

    Text(currentquestion.text,
    style: GoogleFonts.lato(
      color: Colors.white,
      fontSize: 26,
      fontWeight:FontWeight.bold,
    ),
    textAlign: TextAlign.center,
    ),  
    SizedBox(height: 30),


    ...currentquestion.getShuffledAnswers().map((answer) {
      return AnswerButton(answerText: answer,
      ontap: () {
        anserquestion(answer);
      },);
    }
    ),
    
    

    ],
    ),
    ),
    );
  }
} 