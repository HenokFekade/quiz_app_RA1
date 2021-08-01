import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/question_controller.dart';

class Option extends StatelessWidget {
  final String answer;
  final Color color;
  final VoidCallback onTab;
  const Option(
      {required this.answer,
      required this.color,
      required this.onTab,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color containerBackground;
    Color iconBackground;
    IconData icon;
    Color textColor;

    if (color == kGrayColor) {
      containerBackground = Colors.transparent;
      iconBackground = Colors.transparent;
      icon = Icons.close;
      textColor = kSecondaryColor;
    } else {
      containerBackground = color.withOpacity(0.1);
      iconBackground = color;
      textColor = color;
      if (color == kGreenColor)
        icon = Icons.done;
      else
        icon = Icons.close;
    }

    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return GestureDetector(
            onTap: onTab,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: containerBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: color, width: 2),
              ),
              child: Row(
                children: [
                  Text(
                    answer,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: textColor, fontSize: 17),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                      backgroundColor: iconBackground,
                      minRadius: 15,
                      maxRadius: 15,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// class Choice extends StatefulWidget {
//   String answer;
//   bool isCorrect;
//   bool _answered = false;

//   Choice({
//     Key? key,
//     required this.answer,
//     required this.isCorrect,
//   }) : super(key: key);

//   @override
//   _ChoiceState createState() => _ChoiceState();
// }

// class _ChoiceState extends State<Choice> {
//   Color _primayColor = kSecondaryColor;
//   Color _backgroundColor = Colors.transparent;
//   IconData _icon = Icons.close;

//   Color _iconBackgroundColor = Colors.white;
//   QuestionController _questionController = Get.put(QuestionController());
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<QuestionController>(
//       builder: (controller) => GestureDetector(
//         onTap: () {
//           print(widget._answered);
//           if (!widget._answered) _onTap();
//         },
//         child: Container(
//           width: double.infinity,
//           margin: EdgeInsets.only(top: kDefaultPadding),
//           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//           decoration: BoxDecoration(
//             color: _backgroundColor,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: _primayColor, width: 2),
//           ),
//           child: Row(
//             children: [
//               Text(
//                 widget.answer,
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyText1!
//                     .copyWith(color: _primayColor),
//               ),
//               Spacer(),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: _primayColor, width: 2),
//                   shape: BoxShape.circle,
//                 ),
//                 child: CircleAvatar(
//                   child: Icon(
//                     _icon,
//                     color: Colors.white,
//                   ),
//                   backgroundColor: _iconBackgroundColor,
//                   minRadius: 15,
//                   maxRadius: 15,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _onTap() {
//     setState(() {
//       widget._answered = true;
//     });
//     print(widget._answered);

//     setState(() {
//       if (widget.isCorrect) {
//         _primayColor = kGreenColor;
//         _iconBackgroundColor = kGreenColor;
//         _backgroundColor = kGreenColor.withOpacity(0.1);
//         _icon = Icons.done;
//       } else {
//         _primayColor = kRedColor;
//         _iconBackgroundColor = kRedColor;
//         _backgroundColor = kRedColor.withOpacity(0.1);
//         _icon = Icons.close;
//       }
//     });
//     _questionController.checkAnswer(widget.isCorrect);
//   }
// }
