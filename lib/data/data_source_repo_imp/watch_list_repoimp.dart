import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/watch_list_data_source.dart';
import 'package:movies/data/data_source_repo_contract/watch_list_repo.dart';
import 'package:movies/data/models/wach_list/watch_list.dart';

@Injectable(as: WatchListRepo)
class WatchListRepoImp extends WatchListRepo {
  WatchListDataSource source;

  @factoryMethod
  WatchListRepoImp(this.source);

  @override
  Future<WatchListFilms> getWatchList() async {
    WatchListFilms listFilms = await source.getWatchList();
    return listFilms;
  }
}
