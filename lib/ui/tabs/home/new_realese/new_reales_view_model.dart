import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/new_release_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class NewRealeseViewModel extends Cubit<NewRealeseState> {
  NewReleaseRepo repo;

  @factoryMethod
  NewRealeseViewModel(this.repo) : super(Loading());

  void getNewReales() async {
    emit(Loading());
    try {
      FilmDetail newRelease = await repo.getRelease();
      emit(Success(newRelease.results ?? []));
    } catch (e) {
      emit(Error("some thing went wrong or no intrnet"));
    }
  }

  void addTolocal(Result film) async {
    await repo.addToLocal(film);
  }
}

sealed class NewRealeseState {}

class Success extends NewRealeseState {
  List<Result> films;

  Success(this.films);
}

class Loading extends NewRealeseState {}

class Error extends NewRealeseState {
  String error;

  Error(this.error);
}
