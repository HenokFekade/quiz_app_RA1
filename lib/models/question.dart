class Question {
  final int id;
  final String question;
  final int correctAnswer;
  final List<String> answers;

  Question({
    required this.id,
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

// Conver in coming map to Question object.
  static Question fromJson(Map<String, dynamic> data) {
    data = _organizeData(data);
    return Question(
      id: data['id'],
      question: data['question'],
      correctAnswer: data['correctAnswer'],
      answers: data['answers'],
    );
  }

// Merge the correct answer and incorrect answers then shuffle
// inorder to make the correct answer index random.
// At last add the index of correct answer to the incoming data
// and the List that is shuffled (which contain the correct and incorrect answers)
  static Map<String, dynamic> _organizeData(Map<String, dynamic> data) {
    List<String> temp = [];
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

List sampleData = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "incorrect_answers": ['Apple', 'Facebook', 'Microsoft'],
    "correct_answer": 'Google',
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "incorrect_answers": ['Jun 2017', 'Jun 2017', 'May 2018'],
    "correct_answer": 'May 2017',
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "incorrect_answers": ['Double', 'Int', 'Word'],
    "correct_answer": 'Char',
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "incorrect_answers": ['Cin', 'Count>>', 'Output>>'],
    "correct_answer": 'Cout',
  },
];
