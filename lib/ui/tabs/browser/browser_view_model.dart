import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api/api_manger.dart';
import 'package:movies/data/models/film_catagory/film_category.dart';
import 'package:movies/data/models/film_catagory/genres.dart';

class BrowserViewModel extends Cubit<BrowserState> {
  BrowserViewModel() : super(Loading());

  void getCategory() async {
    emit(Loading());
    try {
      FilmCategory response = await ApiManger.getCategory();
      if (response.statusCode != null) {
        emit(Error("Some thing wnent Wrong!"));
      } else {
        emit(Success(response.genres ?? []));
      }
    } catch (e) {
      Error("check your internet network");
    }
  }
}

sealed class BrowserState {}

class Loading extends BrowserState {}

class Success extends BrowserState {
  List<Genres> types;

  Success(this.types);
}

class Error extends BrowserState {
  String error;

  Error(this.error);
}
