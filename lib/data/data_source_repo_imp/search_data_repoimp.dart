import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/search_data_source.dart';
import 'package:movies/data/data_source_repo_contract/search_data_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';

@Injectable(as: SearchRepo)
class SearchRepoImp extends SearchRepo {
  SearchSource source;

  @factoryMethod
  SearchRepoImp(this.source);

  @override
  Future<FilmDetail> search(String query) async {
    FilmDetail results = await source.search(query);
    return results;
  }
}
