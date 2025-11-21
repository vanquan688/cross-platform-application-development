import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Việt Nam có đường biên giới với Campuchia.', true),
    Question('Thủ đô của Úc là Sydney.', false),
    Question('Sông Nile là con sông dài nhất thế giới.', true),
    Question('Núi Everest là ngọn núi cao nhất thế giới.', true),
    Question('Kim cương được làm từ than chì.', true),
    Question('Google ban đầu được gọi là "Backrub".', true),
    Question('Brazil là quốc gia duy nhất tham dự mọi kỳ World Cup.', true),
    Question('Con người có 4 lá phổi.', false),
    Question('Mặt trời quay quanh Trái đất.', false),
    Question('Nước sôi ở 90 độ C.', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
