import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  //poderia ser criado um construtor com parametros nomeados, que sao os envoltos em {}
  //QuestionButton({required this.questionText, required this.questionAnswered});
  //e entao, na chamada do construtor, seria passado os parametros nomeados
  //QuestionButton(questionText: 'Question 1', questionAnswered: () {});
  //required
  const QuestionButton(this.questionText, this.questionAnswered, {super.key});

  final String questionText;
  final void Function() questionAnswered;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: questionAnswered,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 80, 8, 212),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )),
      child: Text(
        questionText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
