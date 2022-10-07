import 'package:http/http.dart' as http;
import 'dart:convert';

class Utils {

  static Future<String> parseQuote() async {
    var url = Uri.parse("http://fucking-great-advice.ru/api/random");
    http.Response response = await http.get(url);

    Map<String,dynamic> data = jsonDecode(response.body);
    String verse = data["text"];

    return verse;
  }

}
