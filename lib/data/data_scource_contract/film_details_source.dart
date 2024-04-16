import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

abstract class FilmDetailsSource {
  Future<FilmDetail> getFilm(num id);

  Future<void> addToLocal(Result film);
}
