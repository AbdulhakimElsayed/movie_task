import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/home/new_realese/new_realese_builder.dart';
import 'package:movies/ui/tabs/home/recommend/recommended_builder.dart';

class FilmsContainer extends StatelessWidget {
  String title;
  bool isRecommended;
  double? height;

  FilmsContainer(
      //constructor of the film container
      {super.key,
      required this.title,
      this.isRecommended = false,
      this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsetsDirectional.only(
        start: 27,
        top: 16,
        bottom: 9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          isRecommended
              ? const Expanded(
                  child: RecommendedBuilder()) // case of true recommended film
              : const Expanded(
                  child: NewRealeseBuilder()) // case of false recommended film
        ],
      ),
    );
  }
}
