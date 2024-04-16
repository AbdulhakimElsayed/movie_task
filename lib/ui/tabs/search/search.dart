import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/shared_widget/result_item.dart';
import 'package:movies/ui/tabs/search/search_view_model.dart';

class Search extends StatelessWidget {
  Search({super.key});

  SearchViewModel searchViewModel = getIt.get<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsetsDirectional.only(start: 25, end: 25, top: 20),
      child: Column(
        children: [
          TextFormField(
            //  text field for the search screen
            onChanged: (query) {
              searchViewModel.getResults(query);
            },
            cursorColor: Color(0xFF48CFAD),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Color(0xFF514F4F),
              filled: true,
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 1, color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 1, color: Colors.white)),
              prefixIcon: ImageIcon(
                AssetImage("assets/images/search.png"),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          BlocBuilder<SearchViewModel, SearchState>(
              bloc: searchViewModel,
              builder: (context, state) {
                switch (state) {
                  case Empty(): //  the case when the text field is empty
                    {
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .3,
                          ),
                          Icon(
                            Icons.local_movies_rounded,
                            color: Color(0xFFB5B4B4),
                            size: 100,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "There is no movies found",
                            style: TextStyle(
                                color: Color(0xFFB5B4B4), fontSize: 13),
                          ),
                        ],
                      );
                    }
                  case Error(): //  case of error
                    {
                      return SafeArea(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                  child: Text(
                                state.error,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ))));
                    }
                  case Success(): //  case of filled the text field successfully
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Item(
                                film: state.films[index],
                              ),
                          separatorBuilder: (context, index) => Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.white,
                                margin: EdgeInsetsDirectional.only(
                                    top: 9, bottom: 20),
                              ),
                          itemCount: state.films.length),
                    );
                }
              })
        ],
      ),
    ));
  }
}
