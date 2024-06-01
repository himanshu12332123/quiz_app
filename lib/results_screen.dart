import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';


class Resultsscreen extends StatelessWidget{
   Resultsscreen({
    super.key,
   required this.chosenans,
   required this.onrestart,
   });


   final void Function() onrestart;
   final List<String>chosenans;
    List<Map<String, Object>> getsummarydata(){

    List<Map<String, Object>>summary = [];

    for(var i = 0; i < chosenans.length; i++){
      summary.add({
        'question_index': i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenans[i]
      });
    }
    return summary;
   }

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    final summmarydata = getsummarydata();
   final numtotalquestions = questions.length;
   final numcorrectquestions = summmarydata.where((data) {
     return  data['user_answer'] == data['correct_answer'];
   }).length;

    return
    SizedBox(
    width: double.infinity,
    child: Container(
    margin:EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("YOU ANSWERERD $numcorrectquestions OUT $numtotalquestions, QUESTION CORRECTLY",
           style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight:FontWeight.bold,
           ),
           textAlign: TextAlign.center,
        ),
        SizedBox(height: 30,),
        QuestionSummary(summmarydata),
         SizedBox(height: 30,),
           TextButton.icon(
            onPressed: onrestart,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.refresh),
            label: Text('Restart Quiz'),
            ),

    ],
    ),
    ),
    );
  }
}