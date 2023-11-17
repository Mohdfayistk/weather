import 'dart:convert';

import 'package:http/http.dart';


import '../ModelClass/Weather.dart';
import 'api_client.dart';

class AnimeApi {
  ApiClient apiClient = ApiClient();

  Future<Weather> getAnime(String text) async {
    String trendingpath = 'https://forecast9.p.rapidapi.com/rapidapi/forecast/kochi/summary/';
    var body = {
    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Weather.fromJson(jsonDecode(response.body));
  }
}