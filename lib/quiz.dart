import 'package:app_quiz/data/questions.dart';
import 'package:app_quiz/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/home_screen.dart';
import 'package:app_quiz/result_screen.dart';

//stateful eh um widget que pode ser alterado, buildado novamente
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//_ representa que a classe eh privada
class _QuizState extends State<Quiz> {
  //abordagem 1 para mudar de tela, com initstate e variavel Widget
  /*
  //o ? no final representa que a variavel pode ser nula
  //e ela eh nula pq initState acontece na inicialização, antes da construcao do widget
  Widget? activeScreen; //Widget activeScreen = Home(switchScreen);

  @override
  //initstate eh necessario pois o activescreen eh construido antes do switchScreen(ou no mesmo tempo),
  //logo, nao poderiamos passar o ponteiro para a classe filha
  void initState() {
    //em initState nao precisa do setstate pois o widget ainda nao foi construido
    activeScreen = Home(switchScreen);
    super.initState();
  }

  void switchScreen() {
    //setstate builda o widget novamente
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }*/

  //abordagem 2 para mudar de tela, com variavel int, menos codigo e nao precisa de initstate
  final List<String> answers = [];
  int activeScreen = 1;

  void switchScreen() {
    setState(() {
      activeScreen = 2;
    });
  }

  void selectingAnswer(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(() {
        activeScreen = 3;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 1;
      answers.clear();
    });
  }

  Widget getScreen() {
    switch (activeScreen) {
      case 1:
        return Home(switchScreen);
      case 2:
        return QuestionsScreen(selectingAnswer);
      case 3:
        return ResultScreen(restartQuiz, answers);
      default:
        return const Text('Wait what?');
    }
  }

  //override eh usado para sobrescrever um metodo, no caso o build
  @override
  //build eh chamado para construir o widget, ele roda quando o widget eh construido e quando o setstate eh chamado
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 0, 234, 0.8),
                Color.fromRGBO(94, 37, 77, 0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // expressao ternaria, identica ao do c++, se activeScreen == 1, entao retorna Home, se nao retorna QuestionsScreen
          /*child: activeScreen == 1
              ? Home(switchScreen)
              : QuestionsScreen(selectingAnswer),*/
          child: getScreen(),
        ),
      ),
    );
  }
}
