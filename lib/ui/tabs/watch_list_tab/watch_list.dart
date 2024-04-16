import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/shared_widget/result_item.dart';
import 'package:movies/ui/tabs/watch_list_tab/watch_list_view_model.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  WatchListViewModel watchListViewModel = getIt.get<WatchListViewModel>();

  @override
  void initState() {
    //  function to get the watch list
    super.initState();
    watchListViewModel.getWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListViewModel, WatchListState>(
        bloc: watchListViewModel,
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
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 30,
                      start: 20.5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Watch List",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                            //Item(film: watchList.films?.first ?? Result(),isStart: false,)
                            child: ListView.separated(
                          itemBuilder: (context, index) => Item(
                            film: state.films?[index] ?? Result(),
                            isStart: false,
                          ),
                          separatorBuilder: (context, index) => Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.white,
                            margin:
                                EdgeInsetsDirectional.only(top: 9, bottom: 20),
                          ),
                          itemCount: state.films?.length ?? 0,
                        ))
                      ],
                    ),
                  ),
                );
              }
          }
        });
  }
}
