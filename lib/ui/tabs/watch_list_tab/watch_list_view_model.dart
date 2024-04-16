import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/watch_list_repo.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/data/models/wach_list/watch_list.dart';

@injectable
class WatchListViewModel extends Cubit<WatchListState> {
  WatchListRepo repo;

  @factoryMethod
  WatchListViewModel(this.repo) : super(Loading());

  Future<void> getWatchList() async {
    emit(Loading());
    try {
      WatchListFilms films = await repo.getWatchList();
      return emit(Success(films.films ?? []));
    } catch (e) {
      return emit(Error("some thing went wrong!"));
    }
  }
}

sealed class WatchListState {}

class Success extends WatchListState {
  List<Result> films;

  Success(this.films);
}

class Error extends WatchListState {
  String error;

  Error(this.error);
}

class Loading extends WatchListState {}
