import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/categorized_film_source.dart';
import 'package:movies/data/data_source_repo_contract/categorized_film_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: CategorizedFilmRepo)
class CategorizedFilmRepoimp extends CategorizedFilmRepo {
  CategorizedFilmSource source;

  @factoryMethod
  CategorizedFilmRepoimp(this.source);

  @override
  Future<FilmDetail> getCategorizedFilm(num id) async {
    var response = await source.getCategorizedFilm(id);
    return response;
  }
}
