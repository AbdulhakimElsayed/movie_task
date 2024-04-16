import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/similar_film_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class SimilarFilmsViewModel extends Cubit<SimilarFilmsState> {
  SimilarFilmRepo repo;

  @factoryMethod
  SimilarFilmsViewModel(this.repo) : super(Loading());

  void getSimilar(num id) async {
    emit(Loading());
    try {
      FilmDetail similar = await repo.getSimilar(id);
      emit(Success(similar.results ?? []));
    } catch (e) {
      emit(Error("Some thing went Wrong may be no Internet or something else"));
    }
  }

  void addTolocal(Result film) async {
    await repo.addToLocal(film);
  }
}

sealed class SimilarFilmsState {}

class Success extends SimilarFilmsState {
  List<Result> films;

  Success(this.films);
}

class Error extends SimilarFilmsState {
  String error;

  Error(this.error);
}

class Loading extends SimilarFilmsState {}
