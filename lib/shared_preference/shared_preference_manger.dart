import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/data/models/wach_list/watch_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalStorage {
  static const String filmKey = "films";
  static WatchListFilms appdata = WatchListFilms();

  Future<void> addList(Result film) async {
    if (!appdata.films!.contains(film)) {
      appdata.films?.add(film);
    }
    String json = jsonEncode(appdata.toJson());
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      await init.setString(filmKey, json);
    } catch (e) {}
  }

  Future<WatchListFilms> getFilms() async {
    try {
      SharedPreferences init = await SharedPreferences.getInstance();
      String? data = init.getString(filmKey);
      var json = jsonDecode(data ?? "");
      appdata = WatchListFilms.fromjson(json);
      return appdata;
    } catch (e) {
      print(e.toString());
    }
    return WatchListFilms();
  }

  void delete() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
