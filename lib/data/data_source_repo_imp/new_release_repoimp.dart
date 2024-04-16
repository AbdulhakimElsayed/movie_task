import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/new_release_source.dart';
import 'package:movies/data/data_source_repo_contract/new_release_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@Injectable(as: NewReleaseRepo)
class NewReleaseRepoImp extends NewReleaseRepo {
  NewReleaseSource source;

  @factoryMethod
  NewReleaseRepoImp(this.source);

  @override
  Future<FilmDetail> getRelease() async {
    FilmDetail newRelease = await source.getRelease();
    return newRelease;
  }

  @override
  Future<void> addToLocal(Result film) async {
    return await source.addToLocal(film);
  }
}
