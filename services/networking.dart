import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/screens/loading_screen.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } catch (e) {
      print(e);
    }
  }
}
