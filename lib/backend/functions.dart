import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technewz/components/searchbar.dart';
import 'package:technewz/utils/key.dart';

Future<List> fetchNews(String country, String category) async {
  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=$country&category=$category&pageSize=100&apiKey=' +
          Key.key+'&q=' +
          SearchBars.searchcontroller.text,
    ),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}