import 'package:injectable/injectable.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/data_scource_contract/search_data_source.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: SearchSource)
class SearchSourceImp extends SearchSource {
  ApiManger apiManger;

  @factoryMethod
  SearchSourceImp(this.apiManger);

  @override
  Future<FilmDetail> search(String query) async {
    FilmDetail results = await apiManger.getSearchResults(query);
    return results;
  }
}
