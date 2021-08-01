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

// opentdb.com/api.php?
// https://opentdb.com/api_token.php?command=request
// https://opentdb.com/api.php?amount=10&token=YOURTOKENHERE
// https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple
// var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
// if (response.statusCode == 200) {
//     var jsonResponse =
//         convert.jsonDecode(response.body) as Map<String, dynamic>;
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }