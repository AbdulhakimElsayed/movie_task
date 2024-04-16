import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/tabs/home/recommend/film_poster_recomended.dart';
import 'package:movies/ui/tabs/home/recommend/recommended_view_model.dart';

class RecommendedBuilder extends StatefulWidget {
  const RecommendedBuilder({super.key});

  @override
  State<RecommendedBuilder> createState() => _RecommendedBuilderState();
}

class _RecommendedBuilderState extends State<RecommendedBuilder> {
  RecommendedViewModel recommendedViewModel = getIt.get<RecommendedViewModel>();

  @override
  void initState() {
    //  function to get the recommended films
    super.initState();
    recommendedViewModel.getRecommended();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedViewModel, RecommendedState>(
        bloc: recommendedViewModel,
        builder: (context, state) {
          switch (state) {
            case Loading(): //  case of loading data from internet
              {
                return const SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ));
              }
            case Error(): //  case of error
              {
                return SafeArea(
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          state.error,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))));
              }
            case Success(): //  case of loading data successfully
              {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FilmPosterRecomended(
                          film: state.films[index],
                          add: () {
                            recommendedViewModel.addTolocal(state.films[index]);
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
