class Question {
  final int id;
  final String question;
  final int correctAnswer;
  final List<dynamic> answers;
  static int _id = 1;

  Question({
    required this.id,
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

// Conver in coming map to Question object.
  static Question fromJson(Map<String, dynamic> data) {
    data = _organizeData(data);
    Question question = Question(
      id: _id++,
      question: data['question'],
      correctAnswer: data['correctAnswer'],
      answers: data['answers'],
    );
    // print(question.answers);
    return question;
  }

// Merge the correct answer and incorrect answers then shuffle
// inorder to make the correct answer index random.
// At last add the index of correct answer to the incoming data
// and the List that is shuffled (which contain the correct and incorrect answers)
  static Map<String, dynamic> _organizeData(Map<String, dynamic> data) {
    List<dynamic> temp = [];
    temp.add(data['correct_answer']);
    temp.addAll(data['incorrect_answers']);
    temp.shuffle();
    temp.shuffle();
    int correctAnswer = temp.indexOf(data['correct_answer']);
    data['answers'] = temp;
    data['correctAnswer'] = correctAnswer;
    return data;
  }
}
