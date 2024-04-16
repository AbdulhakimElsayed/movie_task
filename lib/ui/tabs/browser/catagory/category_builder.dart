import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/tabs/browser/catagory/category_view_model.dart';
import 'package:movies/ui/tabs/browser/category_item.dart';

class CategoryBuilder extends StatefulWidget {
  double id;

  CategoryBuilder({super.key, required this.id});

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  CategoryViewModel categoryViewModel = getIt.get<CategoryViewModel>();

  @override
  void initState() {
    super.initState();
    categoryViewModel.getFilms(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryViewModel, CategoryState>(
        bloc: categoryViewModel,
        listener: (contex, state) {},
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
                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          state.error,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))));
              }
            case Success():
              {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3 / 2,
                      crossAxisSpacing: 38,
                    ),
                    itemBuilder: (context, index) => CategoryItem(
                          filmDetail: state.types[index],
                        ),
                    itemCount: state.types.length);
              }
          }
        });
  }
}
