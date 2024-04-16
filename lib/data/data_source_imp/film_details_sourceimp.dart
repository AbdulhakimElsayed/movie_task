import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/film_details_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/shared_preference/shared_preference_manger.dart';

@Injectable(as: FilmDetailsSource)
class FilmDetailsSourceImp extends FilmDetailsSource {
  ApiManger apiManger;
  LocalStorage storage;

  FilmDetailsSourceImp(this.apiManger, this.storage);

  @override
  Future<FilmDetail> getFilm(num id) async {
    FilmDetail film = await apiManger.getFilmDetails(id);
    return film;
  }

  @override
  Future<void> addToLocal(Result film) async {
    return await storage.addList(film);
  }
}
