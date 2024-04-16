import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/tabs/home/new_realese/film_poster.dart';
import 'package:movies/ui/tabs/home/new_realese/new_reales_view_model.dart';

class NewRealeseBuilder extends StatefulWidget {
  const NewRealeseBuilder({super.key});

  @override
  State<NewRealeseBuilder> createState() => _NewRealeseBuilderState();
}

class _NewRealeseBuilderState extends State<NewRealeseBuilder> {
  NewRealeseViewModel newRealeseViewModel = getIt.get<NewRealeseViewModel>();

  @override
  void initState() {
    //  function to get release films
    super.initState();
    newRealeseViewModel.getNewReales();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRealeseViewModel, NewRealeseState>(
        bloc: newRealeseViewModel,
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
                  itemBuilder: (context, index) => FilmPoster(
                    film: state.films[index],
                    add: () {
                      newRealeseViewModel.addTolocal(state.films[index]);
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemCount: state.films.length,
                );
              }
          }
        });
  }
}
