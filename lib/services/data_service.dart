import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  static Future<void> fetchScannedCards() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/tags'));

      if (response.statusCode == 200) {
        print(response.body);
        // Parse the JSON response
        //return json.decode(response.body);
      } else {
        // Throw an exception if the HTTP request fails
        throw Exception(
          'Failed to load tags. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      throw Exception('Error fetching tags: $e');
    }
  }
}
