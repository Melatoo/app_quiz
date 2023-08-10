import 'package:app_quiz/questions_summary/questions_item.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      //singlechildscrollview eh um widget que permite que o conteudo seja scrollavel
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              //row eh um widget que organiza os itens em uma linha(horizontal)
              //diferente da column que organiza os itens em uma coluna(vertical)
              /*return Row(
                children: [
                  Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 10),
                      foregroundDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5)),
                      child: Text(
                        ((data['questionIndex'] as int) + 1).toString(),
                      )),
                  //expanded eh um widget que expande o item para ocupar o maximo de espaco possivel
                  //ele eh necessario para que o texto nao fique cortado nem de overflow
                  //o overflow aconteceria pois a column dentro da row ignora
                  //o limite maximo da row, o expanded limita o tamanho da column
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['question'] as String,
                              style: GoogleFonts.lato(
                                color: Colors.white,
                              )),
                          Text(data['userAnswer'] as String),
                          Text(
                            data['correctAnswer'] as String,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );*/
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
