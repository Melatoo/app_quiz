import 'package:app_quiz/data/questions.dart';
import 'package:app_quiz/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.onPressedButton, this.chosenAnswers, {super.key});

  final void Function() onPressedButton;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      //o {} eh a maneira de criar um valor map
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'userAnswer': chosenAnswers[i],
        'correctAnswer': questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final int numTotalQuestions = questions.length;
    //where eh um metodo que retorna uma lista com os itens que satisfazem a condicao
    //direfente do map, ele nao modifica a lista original
    final int numCorrectAnswers = summaryData.where((data) {
      return data['userAnswer'] == data['correctAnswer'];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: onPressedButton,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shortcut, color: Colors.white),
                  Text('Restart Quiz', style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
