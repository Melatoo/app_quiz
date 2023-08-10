import "package:flutter/material.dart";
import 'package:app_quiz/question_button.dart';
import 'package:app_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void nextQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
        currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    //ao inves de center, poderia ter usado uma sized box com tamanho infinito
    return Center(
        child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        //faz com que os itens sejam centralizados na vertical
        mainAxisSize: MainAxisSize.min,
        //faz com que os itens sejam centralizados na horizontal
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(fontSize: 30, color: Colors.white),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          //map eh usado para percorrer uma lista e
          //retornar outra lista(iterable na verdade),
          //ou sejaa lista original nao eh alterada
          ...currentQuestion.getShuffledAnswers().map((answer) {
            //o ... eh usado para espalhar os itens da lista[
            //e nao fazer uma lista de listas

            return QuestionButton(answer, () {
              nextQuestion(answer);
            });
          }),
          /*
          mais facil usar map do que repetir o codigo
          QuestionButton(currentQuestion.answers[0], () {}),
          QuestionButton(currentQuestion.answers[1], () {}),
          QuestionButton(currentQuestion.answers[2], () {}),
          QuestionButton(currentQuestion.answers[3], () {}),
          */
        ],
      ),
    ));
  }
}
