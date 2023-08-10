class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //cadeia de metodos/funcoes
    final shuffledList = List.of(answers);
    //o shuffle nao retorna nada, ele altera a lista original, por isso
    //funciona sem o return, caso fosse uma variavel normal
    //o shuffle montaria uma lista nova e sobreporia a variavel
    shuffledList.shuffle();
    return shuffledList;
  }
}
