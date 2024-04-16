import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/categorized_film_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: CategorizedFilmSource)
class CategorizedFilmSourceimp extends CategorizedFilmSource {
  ApiManger apiManger;

  @factoryMethod
  CategorizedFilmSourceimp(this.apiManger);

  @override
  Future<FilmDetail> getCategorizedFilm(num id) async {
    FilmDetail response = await apiManger.getGenereFilm(id);
    return response;
  }
}
