import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieServices {
  final String baseURL = "https://api.themoviedb.org/3";
  final String? apiKey = dotenv.env['API_KEY'];

  Future<List<dynamic>> fetchPopularMovies() async {
    final response =
        await http.get(Uri.parse('$baseURL/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
