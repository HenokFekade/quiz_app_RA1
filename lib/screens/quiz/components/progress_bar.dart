import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Color(0xFF3F4768), width: 3),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraint) => Container(
                  width: constraint.maxWidth * controller.animation!.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                  child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    '${double.parse((controller.animation!.value * 60).toString()).round()} Sec',
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/icons/clock.svg'),
                  SizedBox(width: 20),
                ],
              ))
            ],
          );
        },
      ),
    );
  }
}
