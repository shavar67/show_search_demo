import 'package:show_search_demo/model/movie_model.dart';

class MovieModelResult {
  late List<MovieModel> result;
  String? totalResults;
  String? response;

  MovieModelResult({required this.result, this.totalResults, this.response});

  MovieModelResult.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      result = <MovieModel>[];
      json['Search'].forEach((v) {
        result.add(MovieModel.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['Search'] = result.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
