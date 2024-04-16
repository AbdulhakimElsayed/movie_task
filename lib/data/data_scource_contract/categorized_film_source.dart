import 'package:movies/data/models/film_details/Film_details.dart';

abstract class CategorizedFilmSource {
  Future<FilmDetail> getCategorizedFilm(num id);
}
