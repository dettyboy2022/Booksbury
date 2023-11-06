import 'dart:convert';
import 'package:audio_books/services/api_service.dart';
import 'package:http/http.dart' as http;

// get request for popular books
Future<List<VolumeInfo>> fetchBooks() async {
  final response = await http.get(Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=java&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> items = data['items'];

    return items.map((item) {
      return VolumeInfo.fromJson(item['volumeInfo']);
    }).toList();
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}

// get request for trending books
Future<List<VolumeInfo>> trendingbooks() async {
  final response = await http.get(Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=dart&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> items = data['items'];

    return items.map((item) {
      return VolumeInfo.fromJson(item['volumeInfo']);
    }).toList();
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}

// get request for the explore books market
Future<List<VolumeInfo>> exploremarket() async {
  final response = await http.get(Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=javascript&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> items = data['items'];

    return items.map((item) {
      return VolumeInfo.fromJson(item['volumeInfo']);
    }).toList();
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}


class ApiService {
  static Future<List<SearchResult>> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=$query&key=AIzaSyAWgSL7r9fDLOODB38fCCQ1vaIJKKaS5dE'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> items = jsonResponse['items'];
      return items.map((data) => SearchResult.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
