import 'package:movies/data/models/film_details/Film_details.dart';

abstract class PopularFilmRepo {
  Future<FilmDetail> getPopular();
}
