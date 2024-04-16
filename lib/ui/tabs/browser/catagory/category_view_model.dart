import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/data_source_repo_contract/categorized_film_repo.dart';
import 'package:movies/data/models/film_details/Film_details.dart';
import 'package:movies/data/models/film_details/results.dart';

@injectable
class CategoryViewModel extends Cubit<CategoryState> {
  CategorizedFilmRepo category;

  @factoryMethod
  CategoryViewModel(this.category) : super(Loading());

  void getFilms(double id) async {
    emit(Loading());
    try {
      FilmDetail result = await category.getCategorizedFilm(id);
      emit(Success(result.results ?? []));
    } catch (e) {
      Error(e.toString());
    }
  }
}

sealed class CategoryState {}

class Loading extends CategoryState {}

class Success extends CategoryState {
  List<Result> types;

  Success(this.types);
}

class Error extends CategoryState {
  String error;

  Error(this.error);
}
