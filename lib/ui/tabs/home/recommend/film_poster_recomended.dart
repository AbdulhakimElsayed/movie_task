import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/notifications/snack_message.dart';
import 'package:movies/ui/filmdetails/film_details.dart';

typedef callback = void Function();

class FilmPosterRecomended extends StatelessWidget {
  Result film;
  bool isFirst;
  callback add;

  FilmPosterRecomended(
      {super.key, required this.film, this.isFirst = true, required this.add});

  @override
  Widget build(BuildContext context) {
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    String backGround = "https://image.tmdb.org/t/p/w500${film.backdropPath}";
    return InkWell(
      onTap: () {
        isFirst
            ? Navigator.pushNamed(context, FilmDetails.route, arguments: film)
            : Navigator.pushReplacementNamed(context, FilmDetails.route,
                arguments: film);
        ;
      },
      child: Container(
        width: 120,
        height: 200,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: posterPath,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Center(
                child: Text(
                  "NO IMAGE",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                alignment: AlignmentDirectional.topStart,
                width: double.infinity,
                height: 128,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
                child: InkWell(
                    onTap: () async {
                      add();
                      showSnack("${film.title} added to watchList", context);
                    },
                    child: Image.asset("assets/images/add_icon.png")),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).primaryColor,
                        size: 17,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        (film.voteAverage ?? 0).toStringAsFixed(1),
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    film.title ?? "",
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    film.releaseDate ?? "",
                    style: TextStyle(
                        fontSize: 8,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
