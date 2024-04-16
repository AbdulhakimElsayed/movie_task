import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

abstract class RecommendedSource {
  Future<FilmDetail> getRecommended();

  Future<void> addToLocal(Result film);
}
