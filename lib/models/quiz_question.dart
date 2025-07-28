class QuizQuestion {
  final String question;
  final List<String> options;
  final int answerIndex;
  const QuizQuestion({
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question:    json['question'] as String,
      options:     List<String>.from(json['options'] as List<dynamic>),
      answerIndex: json['answerIndex'] as int? ?? 0,
    );
  }
}
