import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/browser/browser_view_model.dart';
import 'package:movies/ui/tabs/browser/film_type.dart';

class BrowderBuilder extends StatefulWidget {
  const BrowderBuilder({super.key});

  @override
  State<BrowderBuilder> createState() => _BrowderBuilderState();
}

class _BrowderBuilderState extends State<BrowderBuilder> {
  BrowserViewModel browserViewModel = BrowserViewModel();

  @override
  void initState() {
    //  function to get the category
    super.initState();
    browserViewModel.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowserViewModel, BrowserState>(
        bloc: browserViewModel,
        builder: (context, state) {
          switch (state) {
            case Loading(): //  case of loading data from the internet
              {
                return const SafeArea(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                ));
              }
            case Error(): //  case of there is an error
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
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 38,
                    mainAxisSpacing: 47,
                  ),
                  itemBuilder: (context, index) {
                    return FilmType(
                      index: index,
                      genres: state.types[index],
                    );
                  },
                  itemCount: state.types.length,
                );
              }
          }
        });
  }
}
