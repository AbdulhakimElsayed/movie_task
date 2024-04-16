import 'package:movies/data/models/wach_list/watch_list.dart';

abstract class WatchListRepo {
  Future<WatchListFilms> getWatchList();
}
