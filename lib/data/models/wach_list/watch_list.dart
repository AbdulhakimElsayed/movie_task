import 'package:movies/data/models/film_details/results.dart';

class WatchListFilms {
  List<Result>? films = [];

  WatchListFilms();

  WatchListFilms.fromjson(dynamic json) {
    if (json['films'] != null) {
      films = [];
      json['films'].forEach((v) {
        films?.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['films'] = films;
    return map;
  }
}
