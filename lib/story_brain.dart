import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
        storyTitle:
            'Xe của bạn bị xẹp lốp trên một con đường vắng. Bạn quyết định đi nhờ xe. Một chiếc xe tải màu gỉ sét dừng lại bên cạnh bạn. Một người đàn ông với đôi mắt vô hồn mở cửa xe và hỏi: "Cần đi nhờ không?"',
        choice1: 'Đồng ý đi nhờ. Cảm ơn vì sự giúp đỡ!',
        choice2:
            'Khoan đã, tốt hơn là tôi nên hỏi anh ta trước xem anh ta có phải là kẻ giết người không.'),
    Story(
        storyTitle: 'Anh ta gật đầu lia lịa mà không thèm nhìn bạn.',
        choice1: 'Ít nhất thì anh ta cũng không phải là kẻ giết người.',
        choice2: 'Đợi đã, tôi biết cách thay lốp xe mà.'),
    Story(
        storyTitle:
            'Khi bạn bắt đầu nói, anh ta nhìn bạn với ánh mắt kinh hoàng. Anh ta hét lên "Cái gì? Mau cút khỏi đây ngay!" rồi lái xe đi.',
        choice1: 'Bắt đầu lại',
        choice2: ''),
    Story(
        storyTitle:
            'Thật là may mắn! Bạn đã thoát khỏi một tình huống nguy hiểm. Chúc mừng bạn đã đến được cuối câu chuyện.',
        choice1: 'Bắt đầu lại',
        choice2: ''),
    Story(
        storyTitle:
            'Bạn nhận ra mình đã quên mất cách thay lốp xe. Thật không may, bạn đã bỏ lỡ cơ hội duy nhất để được giúp đỡ. Chúc bạn may mắn lần sau.',
        choice1: 'Bắt đầu lại',
        choice2: '')
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 1;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 2 && choiceNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 2 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1) {
      return true;
    } else {
      return false;
    }
  }
}
