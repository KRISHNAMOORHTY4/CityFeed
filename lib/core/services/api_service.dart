import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  const ApiService();

  Future<dynamic> getData({required String url}) async {
    try {
      final uri = Uri.parse(url);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
          'Failed to load data. Status Code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
