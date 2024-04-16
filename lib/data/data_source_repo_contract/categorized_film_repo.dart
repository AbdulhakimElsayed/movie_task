import 'package:movies/data/models/film_details/Film_details.dart';

abstract class CategorizedFilmRepo {
  Future<FilmDetail> getCategorizedFilm(num id);
}
