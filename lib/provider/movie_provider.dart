import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstants.dart';
import '../model/movie_model.dart';

class ModelProvider with ChangeNotifier {
  Future<List<MovieModel>> searchMovies(keyword) async {
    String url = ApiConstants.BASEURL + keyword + ApiConstants.APIKEY.trim();
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);

      if (data['Response'] == "True") {
        var list = (data['Search'] as List)
            .map((item) => MovieModel.fromJson(item))
            .toList();
        return list;
      } else {
        throw Exception(data['Error']);
      }
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
