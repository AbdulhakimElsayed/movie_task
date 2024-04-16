import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/notifications/snack_message.dart';
import 'package:movies/ui/filmdetails/film_details.dart';

typedef callback = void Function();

class FilmPoster extends StatelessWidget {
  FilmPoster({super.key, required this.film, required this.add});

  callback add;
  Result film;

  @override
  Widget build(BuildContext context) {
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, FilmDetails.route, arguments: film);
        },
        child: CachedNetworkImage(
          imageUrl: posterPath,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Center(
            child: Text(
              "NO IMAGE",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          imageBuilder: (context, provideImage) {
            return Container(
                alignment: AlignmentDirectional.topStart,
                width: 97,
                height: 128,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: provideImage,
                )),
                child: InkWell(
                    onTap: () {
                      add();
                      showSnack("${film.title} added to watchList", context);
                    },
                    child: Image.asset("assets/images/add_icon.png")));
          },
        ));
  }
}
