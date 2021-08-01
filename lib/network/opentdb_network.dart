import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<List<dynamic>> getData() async {
  List<dynamic> data = await _requestData();
  return data;
}

Future<List<dynamic>> _requestData() async {
  var url = Uri.parse(
      'https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple');
  var response = await (http.get(url));
  if (response.statusCode == 200) {
    var tempData = convert.jsonDecode(response.body) as Map<String, dynamic>;
    if (tempData['response_code'] == 0) {
      return tempData['results'];
    }
  }

  return [];
}
