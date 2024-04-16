import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies/data/data_source_repo_contract/film_details_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class FilmDetailsViewModel extends Cubit<FilmDetailsState> {
  FilmDetailsRepo repo;

  @factoryMethod
  FilmDetailsViewModel(this.repo) : super(Loading());

  void getFilm(num id) async {
    try {
      FilmDetail film = await repo.getFilm(id);
      emit(Success(film));
    } catch (e) {
      emit(Error("Some thine went Wrong!,"));
    }
  }

  void hasIntrnet({num id = 0}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      getFilm(id);
    } else {
      emit(NoIntrnet());
    }
  }

  void addTolocal(Result film) async {
    await repo.addToLocal(film);
  }
}

sealed class FilmDetailsState {}

class Success extends FilmDetailsState {
  FilmDetail film;

  Success(this.film);
}

class Error extends FilmDetailsState {
  String error;

  Error(this.error);
}

class Loading extends FilmDetailsState {}

class NoIntrnet extends FilmDetailsState {}
