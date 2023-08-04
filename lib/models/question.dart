// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Question {
  final String texte;
  final List<String> reponses;
  const Question({
    required this.texte,
    required this.reponses,
  });

  List<String> qcm(){
    final lesReponses = List.of(reponses);
    lesReponses.shuffle();
    return lesReponses;
  }
}
