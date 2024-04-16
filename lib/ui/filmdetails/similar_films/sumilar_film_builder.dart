import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/notifications/snack_message.dart';
import 'package:movies/ui/filmdetails/similar_films/similar_film_view_model.dart';
import 'package:movies/ui/tabs/home/recommend/film_poster_recomended.dart';

class SimilarFilmsBuilder extends StatefulWidget {
  num id;

  SimilarFilmsBuilder({super.key, required this.id});

  @override
  State<SimilarFilmsBuilder> createState() => _SimilarFilmsBuilderState();
}

class _SimilarFilmsBuilderState extends State<SimilarFilmsBuilder> {
  SimilarFilmsViewModel similarFilmsViewModel =
      getIt.get<SimilarFilmsViewModel>();

  @override
  void initState() {
    super.initState();
    similarFilmsViewModel.getSimilar(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarFilmsViewModel, SimilarFilmsState>(
        bloc: similarFilmsViewModel,
        builder: (context, state) {
          switch (state) {
            case Loading():
              {
                return const SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ));
              }
            case Error():
              {
                return SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          state.error,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ))));
              }

            case Success():
              {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FilmPosterRecomended(
                          film: state.films[index],
                          isFirst: false,
                          add: () {
                            similarFilmsViewModel
                                .addTolocal(state.films[index]);
                            showSnack(
                                "${state.films[index].title} added to watch list",
                                context);
                          },
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemCount: state.films.length);
              }
          }
        });
  }
}
