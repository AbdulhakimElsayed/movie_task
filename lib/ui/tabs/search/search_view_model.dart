import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/search_data_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class SearchViewModel extends Cubit<SearchState> {
  SearchRepo repo;

  @factoryMethod
  SearchViewModel(this.repo) : super(Empty());

  void getResults(String query) async {
    emit(Empty());
    try {
      FilmDetail results = await repo.search(query);
      if (results.results!.isEmpty) {
        emit(Empty());
      } else {
        emit(Success(results.results ?? []));
      }
    } catch (e) {
      emit(Error("sone thing went wrong or no intrnet"));
    }
  }
}

sealed class SearchState {}

class Empty extends SearchState {}

class Error extends SearchState {
  String error;

  Error(this.error);
}

class Success extends SearchState {
  List<Result> films;

  Success(this.films);
}
