import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

import 'sommaire_question.dart';

class ResultContent extends StatelessWidget {
  final List<String> reponsesChoisies;
  final Function onReinitialiser;
  const ResultContent({
    Key? key,
    required this.reponsesChoisies,
    required this.onReinitialiser,
  }) : super(key: key);

  List<Map<String, Object>> statistiques() {
    List<Map<String, Object>> liste = [];
    // SYNTAXE DU FOR
    // for(initialise monCompteur; condition d'arret; incrément)
    for (int i = 0; i < monQuiz.length; i++) {
      //instructions
      liste.add({
        'numQuestion': i + 1,
        'texteQuestion': monQuiz[i].texte,
        'bonneReponse': monQuiz[i].reponses[0],
        'reponseChoisie': reponsesChoisies[i],
      });
    }
    return liste;
  }

  @override
  Widget build(context) {
    final stats = statistiques();
    final nombreTotal = monQuiz.length;
    final reponsesVraies = stats
        .where(
          (chaqueElement) =>
              chaqueElement['bonneReponse'] == chaqueElement['reponseChoisie'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Vous avez trouvé $reponsesVraies questions sur $nombreTotal',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(16 * 3),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...stats.map(
                      (chaqueMap) => SommaireQuestion(
                        bonneReponse: chaqueMap['bonneReponse'] as String,
                        numQuestion: chaqueMap['numQuestion'] as int,
                        reponseChoisie: chaqueMap['reponseChoisie'] as String,
                        texteQuestion: chaqueMap['texteQuestion'] as String,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16 * 3),
            TextButton(
              onPressed: (){
                onReinitialiser();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text(
                'REESSAYER',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
