import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/ui/filmdetails/film_details.dart';

class Item extends StatelessWidget {
  Result film;
  bool isStart;

  Item({super.key, required this.film, this.isStart = true});

  @override
  Widget build(BuildContext context) {
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FilmDetails.route, arguments: film);
      },
      child: Row(
        crossAxisAlignment:
            isStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: posterPath,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(
              child: Text(
                "NO IMAGE",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            width: 200,
            height: 200,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isStart
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  film.title ?? "",
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(
                  film.releaseDate ?? "",
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
