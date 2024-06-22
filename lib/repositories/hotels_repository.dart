import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_code_flutter_fire/models/hotels.dart';

class HotelRepository {
  final String apiUrl =
      "https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json";

  Future<List<Hotel>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Hotel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
