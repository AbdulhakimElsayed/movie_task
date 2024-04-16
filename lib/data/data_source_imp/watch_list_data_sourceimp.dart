import 'package:injectable/injectable.dart';
import 'package:movies/data/data_scource_contract/watch_list_data_source.dart';
import 'package:movies/data/models/wach_list/watch_list.dart';
import 'package:movies/shared_preference/shared_preference_manger.dart';

@Injectable(as: WatchListDataSource)
class WatchListDataSourceimp extends WatchListDataSource {
  LocalStorage localStorage;

  @factoryMethod
  WatchListDataSourceimp(this.localStorage);

  @override
  Future<WatchListFilms> getWatchList() async {
    WatchListFilms listFilms = await localStorage.getFilms();
    return listFilms;
  }
}
