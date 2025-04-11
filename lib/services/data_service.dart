import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  static List<String> uids = [];
  static Future<void> fetchScannedCards() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/tags'));

      if (response.statusCode == 200) {
        //print('Fetched tags: ${response.body}');
        final Map<String, dynamic> tagsMap = json.decode(response.body);

        // Convert dynamic list to List<String>
        uids = (tagsMap['uids'] as List).map((uid) => uid.toString()).toList();

        print('Loaded ${uids.length} UIDs');
      } else {
        // Throw an exception if the HTTP request fails
        /*throw Exception(
          'Failed to load tags. Status code: ${response.statusCode}',
        );*/
      }
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      print('Error fetching tags: $e');
    }
  }

  static Future<void> deleteScannedCard(String uid) async {
    try {
      print('Attempting to delete card with UID: $uid');
      final response = await http.delete(
        Uri.parse('http://127.0.0.1:8000/tags/$uid'),
      );

      if (response.statusCode == 200) {
        print('Card deleted successfully: ${response.body}');
      } else {
        // Throw an exception if the HTTP request fails
        throw Exception(
          'Failed to delete card. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      print('Error deleting card: $e');
      rethrow;
    }
  }
}
