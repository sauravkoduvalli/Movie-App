import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app_ihits/models/movie_model.dart';
import 'package:movie_app_ihits/service/api_service.dart';

Future<List<MoviewModelClass>> getMovieData() async {
  final response = await http.get(Uri.parse(ApiService.baseUrl));
  var data = jsonDecode(response.body);
  List<MoviewModelClass> list = [];

  for (var item in data) {
    list.add(MoviewModelClass.fromJson(item));
  }
  return list;
}

List<String> getGerner(List<MoviewModelClass> list) {
  List<String> genreDataList = [];
  try {
    for (var genreItem in list) {
      genreDataList = genreDataList + genreItem.genres;
    }
    return genreDataList;
  } on Exception catch (e) {
    return genreDataList;
  }
}
