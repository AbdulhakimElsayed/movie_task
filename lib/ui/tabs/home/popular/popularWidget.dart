import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/ui/filmdetails/film_details.dart';

class PopularWidget extends StatelessWidget {
  PopularWidget({super.key, required this.film});

  Result film;

  @override
  Widget build(BuildContext context) {
    String backGroundPath =
        "https://image.tmdb.org/t/p/w500${film.backdropPath}";
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    return InkWell(
      //  logic will be done when the user touch the film
      onTap: () {
        Navigator.pushNamed(context, FilmDetails.route, arguments: film);
      },
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  backGroundPath,
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              height: double.infinity,
            )),
            Container(
              height: 144,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    height: 73,
                    padding: EdgeInsetsDirectional.only(start: 60, top: 10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                film.title ?? "",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                film.releaseDate ?? "",
                                style: TextStyle(
                                    color: Color(0xFFB5B4B4), fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: posterPath,
                    height: 199,
                    width: 129,
                    placeholder: (context, text) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
