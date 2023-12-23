class EventQuestion {
  final String question;
  final String answer;
  EventQuestion({required this.question, required this.answer});

  /*factory EventQuestion.fromJson(Map<String, dynamic> json) {
    List<EventQuestion> qanda = [];
    json.forEach((key, value) {
      qanda.add(EventQuestion(question: key, answer: value));
    });
    return qanda;
  }*/
}
