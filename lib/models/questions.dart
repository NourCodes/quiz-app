class Question {
  final List<String> answers;
  final String question;
  const Question({required this.answers, required this.question});

  List<String> get shuffleList {
    final shuffledList =
        List.of(answers); //creates list with the elements of answers list
    shuffledList.shuffle();
    return shuffledList;
  }
}
