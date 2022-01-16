import 'dart:convert';

import 'package:flutter_testovoe/models/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Model>> fetchNews() async {
    const uri = 'http://188.40.167.45:3001/?page=1';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List<dynamic> newsJson = json.decode(response.body);
      return newsJson.map((json) => Model.fromJson(json)).toList();
    } else {
      throw Exception('Error news');
    }
  }
}
