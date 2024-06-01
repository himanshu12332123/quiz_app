import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class Startscreen extends StatelessWidget {
  Startscreen( this.startquiz,{super.key});

  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.9,
         child: Image.asset(
            'assets/images/quiz-logo.png',
             width: 300,
            //  color:Colors.white, give color to image
            ),
            ),
            SizedBox(height:80),
            Text(
              'learn flutter in fun way!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 237, 223, 252),
                fontSize: 24,
              ),
            ),
            SizedBox(height:80),
            ElevatedButton.icon(
              onPressed: (){
                startquiz();
              },
              style: ElevatedButton.styleFrom(
                // foregroundColor:  Colors.white,
              ),
              icon: Icon(Icons.arrow_right),
             label: const Text('Start Quiz')
             ),


           
        ],
      )
    );
  }
}