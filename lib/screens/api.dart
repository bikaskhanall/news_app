import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/News_model.dart';

class Api {
  Future<NewsModel?> fetchNews() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://saurav.tech/NewsAPI/everything/cnn.json",
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return NewsModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint("exception --- ${e.toString()}");
      return null;
    }
    return null;
  }
}
