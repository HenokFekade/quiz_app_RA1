import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${question.id}. ${question.question}',
            style: Theme.of(context).textTheme.button!.copyWith(fontSize: 20),
          ),
          ..._getChoices(),
        ],
      ),
    );
  }

  List<Widget> _getChoices() {
    List<Widget> choices = [];
    List<dynamic> answers = question.answers;
    for (int i = 0; i < answers.length; i++) {
      bool isCorrect = question.correctAnswer == i;
      choices.add(GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            Color getColor(int index) {
              if (controller.answered.value &&
                  controller.selectedIndex == i) if (isCorrect)
                return kGreenColor;
              else
                return kRedColor;
              else if (controller.answered.value && isCorrect)
                return kGreenColor;
              else
                return kGrayColor;
            }

            return Option(
              answer: answers[i],
              color: getColor(i),
              onTab: () {
                if (!controller.answered.value)
                  return controller.checkAnswer(question: question, index: i);
                return null;
              },
            );
          }));
    }
    return choices;
  }
}
