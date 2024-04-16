import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/recommended_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class RecommendedViewModel extends Cubit<RecommendedState> {
  RecommendedRepo repo;

  @factoryMethod
  RecommendedViewModel(this.repo) : super(Loading());

  void getRecommended() async {
    emit(Loading());
    try {
      FilmDetail recommended = await repo.getRecommended();
      emit(Success(recommended.results ?? []));
    } catch (e) {
      emit(Error("Some Thing went wrong or no Intrnet"));
    }
  }

  void addTolocal(Result film) async {
    await repo.addToLocal(film);
  }
}

sealed class RecommendedState {}

class Success extends RecommendedState {
  List<Result> films;

  Success(this.films);
}

class Loading extends RecommendedState {}

class Error extends RecommendedState {
  String error;

  Error(this.error);
}
