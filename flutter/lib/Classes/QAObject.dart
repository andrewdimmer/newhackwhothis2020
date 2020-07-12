class QALiteObject {
  final int questionNumber;
  int answer;

  QALiteObject({this.questionNumber, this.answer});
}

class QAObject extends QALiteObject {
  final String question;
  final List<String> answers;

  QAObject({int questionNumber, this.question, this.answers, int answer})
      : super(questionNumber: questionNumber, answer: answer);
}
