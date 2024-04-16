import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

abstract class NewReleaseRepo {
  Future<FilmDetail> getRelease();

  Future<void> addToLocal(Result film);
}
