import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

abstract class SimilarFilmSource {
  Future<FilmDetail> getSimilar(num id);

  Future<void> addToLocal(Result film);
}
