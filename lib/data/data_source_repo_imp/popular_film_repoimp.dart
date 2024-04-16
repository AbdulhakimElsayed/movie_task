import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/popular_film_source_contract.dart';
import 'package:movies/data/data_source_repo_contract/popular_film_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: PopularFilmRepo)
class PopularFilmRepoImp extends PopularFilmRepo {
  PopularFilmSource source;

  @factoryMethod
  PopularFilmRepoImp(this.source);

  @override
  Future<FilmDetail> getPopular() async {
    FilmDetail popular = await source.getPopular();
    return popular;
  }
}
