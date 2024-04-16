import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/recommended_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/shared_preference/shared_preference_manger.dart';

@Injectable(as: RecommendedSource)
class RecommendedSourceImp extends RecommendedSource {
  ApiManger apiManger;
  LocalStorage storage;

  @factoryMethod
  RecommendedSourceImp(this.apiManger, this.storage);

  @override
  Future<FilmDetail> getRecommended() async {
    FilmDetail recommended = await apiManger.getRecommended();
    return recommended;
  }

  @override
  Future<void> addToLocal(Result film) async {
    return await storage.addList(film);
  }
}
