class QuizQuestion {
  final String text;
  final List<String> answer;
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }

  QuizQuestion(this.text, this.answer);
}
