import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/score/score.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? _animationController;
  Animation? _animation;
  PageController? _pageController;
  Rx<Color> _primayColor = kSecondaryColor.obs;
  Rx<Color> _backgroundColor = Colors.transparent.obs;
  Rx<Color> _iconBackgroundColor = Colors.white.obs;
  RxInt _questionNumber = 1.obs;
  RxInt _numberOfCorrectAnswer = 0.obs;
  RxBool _answered = false.obs;
  int _selectedIndex = -1.obs;

  Animation? get animation => _animation;
  PageController? get pageController => _pageController;
  RxInt get questionNumber => this._questionNumber;
  List<Question> questions =
      sampleData.map((question) => Question.fromJson(question)).toList();
  Rx<Color> get primaryColor => _primayColor;
  Rx<Color> get backgroundColor => _backgroundColor;
  Rx<Color> get iconBackgroundColor => _iconBackgroundColor;
  RxInt get numberOfCorrectAnswers => _numberOfCorrectAnswer;
  RxBool get answered => _answered;
  int get selectedIndex => _selectedIndex;

  void checkAnswer({required Question question, required int index}) {
    question.correctAnswer == index ? _numberOfCorrectAnswer++ : null;
    _selectedIndex = index;
    _answered.value = true;
    _animationController!.stop();
    update();
    Future.delayed(Duration(seconds: 5), nextQuestion);
  }

  void nextQuestion() {
    if (_questionNumber.value != questions.length) {
      _questionNumber.value++;
      _pageController!
          .nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
      _answered.value = false;
      _animationController!.reset();
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => ScorePage(), transition: Transition.rightToLeft);
    }
  }

  @override
  void onInit() {
    _pageController = PageController();

    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });

    _animationController!.forward().whenComplete(nextQuestion);

    super.onInit();
  }

  @override
  void onClose() {
    _pageController!.dispose();
    _animationController!.dispose();
    super.onClose();
  }
}
