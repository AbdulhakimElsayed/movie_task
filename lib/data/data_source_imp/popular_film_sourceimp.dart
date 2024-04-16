import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/popular_film_source_contract.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: PopularFilmSource)
class PopularFilmSourceimp extends PopularFilmSource {
  ApiManger apiManger;

  @factoryMethod
  PopularFilmSourceimp(this.apiManger);

  @override
  Future<FilmDetail> getPopular() async {
    FilmDetail popular = await apiManger.getPopular();
    return popular;
  }
}
