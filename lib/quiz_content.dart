import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

import 'bouton_reponse.dart';

class QuizContent extends StatefulWidget {
  final Function processus;
  
  const QuizContent({
    super.key,
    required this.processus,
  });

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  var index = 0;

  void questionSuivante() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeQuestion = monQuiz[index];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              activeQuestion.texte,
              style: GoogleFonts.openSans(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(16 * 4),
            ...activeQuestion.qcm().map((reponse) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16 / 2,
                ),
                child: BoutonReponse(
                  texte: reponse,
                  clic: (){
                    widget.processus(reponse);
                    questionSuivante();
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}


//SYNTAXE DE MAP
/**
 * laListe.map()
 * 
 * map est une méthode qui apprtient à la classe
 * List DONC '(' et ')'
 * 
 * Dans les parenthèses, vous allez passer une fonction
 * qui va prendre en paramètre chaque élément de votre liste
 * et va retourner quelque chose de spécifique
 * Ce en quoi vous voullez transformer chaque élément
 * 
 * laListe.map(
 *  (e) => CEQUEJEVEUX;
 * )
 */