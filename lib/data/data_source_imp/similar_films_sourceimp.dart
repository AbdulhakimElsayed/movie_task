import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/similar_films_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/shared_preference/shared_preference_manger.dart';

@Injectable(as: SimilarFilmSource)
class SimilarFilmSourceImp extends SimilarFilmSource {
  ApiManger apiManger;
  LocalStorage storage;

  @factoryMethod
  SimilarFilmSourceImp(this.apiManger, this.storage);

  @override
  Future<FilmDetail> getSimilar(num id) async {
    FilmDetail similar = await apiManger.getSimilarFilms(id);
    return similar;
  }

  @override
  Future<void> addToLocal(Result film) async {
    return await storage.addList(film);
  }
}
