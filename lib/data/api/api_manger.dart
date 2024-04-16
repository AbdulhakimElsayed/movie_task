import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies/data/models/film_catagory/film_category.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@singleton
class ApiManger {
  static const String host = "api.themoviedb.org";
  static const Map<String, String> headers = {
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
    "accept": "application/json"
  };

  Future<FilmDetail> getPopular() async {
    var url = Uri.https(host, "3/movie/popular", {
      "language": "en-US",
      "page": "1",
    });

    var response = await http.get(url, headers: headers);
    var jsonFile = jsonDecode(response.body);
    var popularResponse = FilmDetail.fromJson(jsonFile);
    return popularResponse;
  }

  Future<FilmDetail> getRecent() async {
    var url = Uri.https(host, "/3/movie/upcoming", {
      "language": "en-US",
    });

    var response = await http.get(url, headers: headers);
    var jsonFile = jsonDecode(response.body);
    var releasesResponse = FilmDetail.fromJson(jsonFile);
    return releasesResponse;
  }

  Future<FilmDetail> getRecommended() async {
    Uri url = Uri.https(host, "/3/movie/top_rated", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail films = FilmDetail.fromJson(json);
    return films;
  }

  Future<FilmDetail> getFilmDetails(num filmId) async {
    Uri url = Uri.https(host, "/3/movie/${filmId}", {"language": "en_US"});
    try {
      var response = await http.get(url, headers: headers);
      var json = jsonDecode(response.body);
      FilmDetail filmDetail = FilmDetail.fromJson(json);
      return filmDetail;
    } catch (e) {
      print(e.toString());
    }
    return FilmDetail();
  }

  Future<FilmDetail> getSimilarFilms(num filmId) async {
    Uri url =
        Uri.https(host, "/3/movie/$filmId/similar", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail similar = FilmDetail.fromJson(json);
    return similar;
  }

  Future<FilmDetail> getSearchResults(String query) async {
    Uri url = Uri.https(
        host, "3/search/movie", {"language": "en_US", "query": query});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmDetail results = FilmDetail.fromJson(json);
    return results;
  }

  static Future<FilmCategory> getCategory() async {
    Uri url = Uri.https(host, "3/genre/movie/list", {"language": "en_US"});
    var response = await http.get(url, headers: headers);
    var json = jsonDecode(response.body);
    FilmCategory results = FilmCategory.fromJson(json);
    return results;
  }

  Future<FilmDetail> getGenereFilm(num id) async {
    Uri url = Uri.https(host, "3/discover/movie", {
      "language": "en_US",
      "with_genres": id.toString(),
    });
    try {
      var response = await http.get(url, headers: headers);
      var json = jsonDecode(response.body); //sucess //success
      FilmDetail results = FilmDetail.fromJson(json); //fail??? //success
      print(results); //fail???? //success?? HOW ?!?!?!
      return results;
    } catch (e) {
      print(e.toString());
    }
    print("object");
    return FilmDetail();
  }
}
