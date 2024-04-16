import 'package:movies/data/models/film_details/Film_details.dart';

abstract class SearchRepo {
  Future<FilmDetail> search(String query);
}
