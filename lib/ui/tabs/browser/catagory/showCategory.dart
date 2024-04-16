import 'package:flutter/material.dart';
import 'package:movies/data/models/film_catagory/genres.dart';
import 'package:movies/ui/tabs/browser/catagory/category_builder.dart';

class ShowCategory extends StatelessWidget {
  static const String route = "show_category";

  const ShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Genres type = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              top: 70, start: 17, end: 33, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type.name ?? "",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 19,
              ),
              Expanded(child: CategoryBuilder(id: type.id!.toDouble())),
            ],
          ),
        ),
      ),
    );
  }
}
