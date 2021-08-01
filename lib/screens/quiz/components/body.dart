import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/quiz/components/progress_bar.dart';
import 'package:quiz_app/screens/quiz/components/quesion_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(),
              SizedBox(height: kDefaultPadding),
              Obx(
                () => Text.rich(
                  TextSpan(
                    text:
                        "Question ${_questionController.questionNumber.value}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: kSecondaryColor),
                    children: [
                      TextSpan(
                        text: "/${_questionController.questions!.length}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: kSecondaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                    controller: _questionController.pageController,
                    itemCount: _questionController.questions!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Question question = _questionController.questions![index];
                      return QuestionCard(question: question);
                    }),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ))
      ],
    );
  }
}
