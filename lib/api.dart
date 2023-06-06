import 'dart:convert';
import 'package:http/http.dart' as http;
Future<List<dynamic>> getRadioStations() async {
  final response = await http.get(Uri.parse(
      'https://firestore.googleapis.com/v1/projects/spacefm-8abbf/databases/(default)/documents/radio_stations'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final List<dynamic> documents = responseData['documents'];
    return documents;
  } else {
    throw Exception('Failed to load radio stations');
  }
}
