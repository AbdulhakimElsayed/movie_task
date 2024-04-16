import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/new_release_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/shared_preference/shared_preference_manger.dart';

@Injectable(as: NewReleaseSource)
class NewReleaseSourceImp extends NewReleaseSource {
  ApiManger apiManger;
  LocalStorage storage;

  @factoryMethod
  NewReleaseSourceImp(this.apiManger, this.storage);

  @override
  Future<FilmDetail> getRelease() async {
    FilmDetail newRelease = await apiManger.getRecent();
    return newRelease;
  }

  @override
  Future<void> addToLocal(Result film) async {
    return await storage.addList(film);
  }
}
