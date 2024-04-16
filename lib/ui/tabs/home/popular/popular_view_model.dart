import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/popular_film_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class PopularViewModel extends Cubit<PopularStates> {
  PopularFilmRepo filmRepo;

  @factoryMethod
  PopularViewModel(this.filmRepo) : super(Loading());

  void getPopularFilms() async {
    emit(Loading());
    try {
      FilmDetail popular = await filmRepo.getPopular();
      emit(Success(popular.results ?? []));
    } catch (e) {
      emit(Error("some thing went wrong or no intrnet"));
    }
  }
}

sealed class PopularStates {}

class Success extends PopularStates {
  List<Result> films;

  Success(this.films);
}

class Error extends PopularStates {
  String error;

  Error(this.error);
}

class Loading extends PopularStates {}
