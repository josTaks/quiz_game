import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

import 'quiz_content.dart';
import 'result_content.dart';
import 'welcome_content.dart';

int addition(int nombre1, int nombre2) {
  return nombre1 + nombre2;
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var activeContent = 'welcome-content';
  List<String> reponsesChoisies = [];

  void update() {
    setState(() {
      activeContent = 'quiz-content';
    });
  }

  void reset(){
    setState(() {
      reponsesChoisies.clear();
      activeContent = 'welcome-content';
    });
  }

  void repondons(String gout) {
    reponsesChoisies.add(gout);
  }

  bool verifionsSiCestFini() {
    return reponsesChoisies.length == monQuiz.length;
  }

  void okCestVraimentFini() {
    setState(() {
      activeContent = 'result-content';
    });
  }

  void processusDeReponse(String reponse) {
    repondons(reponse);
    if (verifionsSiCestFini() == true) {
      okCestVraimentFini();
    }
  }

  void repondre(String reponse) {
    reponsesChoisies.add(reponse);

    if (reponsesChoisies.length == monQuiz.length) {
      setState(() {
        activeContent = 'result-content';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? content;

    if (activeContent == 'welcome-content') {
      content = WelcomeContent(bouton: update);
    }

    if (activeContent == 'quiz-content') {
      content = QuizContent(processus: processusDeReponse);
    }

    if (activeContent == 'result-content') {
      content = ResultContent(
        reponsesChoisies: reponsesChoisies,
        onReinitialiser: reset,
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff32128B),
        body: content,
      ),
    );
  }
}

//OPERATION TERNAIRE
/**
 * = : affectation
 * == : égalité x==y
 * > : supérieur x>y
 * < : inférieur x<y
 * >= : sup ou égal x>=y
 * <= : inf ou égal x<=y
 * != : différent de x!=y
 * 
 * Une opération ternaire c'est 
 * COMPARAISON ? TRUE : FALSE,
 */
