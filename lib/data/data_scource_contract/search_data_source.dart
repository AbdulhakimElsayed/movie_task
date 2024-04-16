import 'package:movies/data/models/film_details/Film_details.dart';

abstract class SearchSource {
  Future<FilmDetail> search(String query);
}
