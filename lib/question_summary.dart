import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionSummary extends StatelessWidget{
  QuestionSummary(
    this.summarydata,
    {super.key}
  );

final List<Map<String,Object>> summarydata;

@override
Widget build(BuildContext context) {
   return SizedBox(
    height: 400,
    child:SingleChildScrollView(
   child: Column(
    children: 
      summarydata.map((data){
       return Row(
               crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(((data['question_index'] as int) + 1).toString()),
            Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(data['question'] as String,
         style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 16,
              fontWeight:FontWeight.bold,
            ),
            
            
            ),
            
            Text(data['user_answer'] as String,
            style: TextStyle(
                   color: Colors.red,
            ),
            
            ),
            Text(data['correct_answer'] as String,
             style: TextStyle(
                   color: Colors.green,
            ),
            ),
                
             ],
             ),
            ),
       ],
       );
      }).toList(),
    
   ),
    ),
   );
  }
}