import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
