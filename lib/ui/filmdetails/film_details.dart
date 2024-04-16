import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/ui/filmdetails/film_details_builde.dart';
import 'package:movies/ui/filmdetails/similar_films/sumilar_film_builder.dart';

class FilmDetails extends StatelessWidget {
  static const String route = "FilmDetails";

  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Result film = ModalRoute.of(context)?.settings.arguments as Result;
    String backGroundPath =
        "https://image.tmdb.org/t/p/w500${film.backdropPath}";
    String posterPath = "https://image.tmdb.org/t/p/w500${film.posterPath}";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          film.title ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
                imageUrl: backGroundPath,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Center(
                      child: Text(
                        "NO IMAGE",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)))),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 13, start: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.title ?? "",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FilmDetailsBuilder(id: film.id ?? 0, film: film),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsetsDirectional.only(
                    start: 27,
                    top: 16,
                    bottom: 9,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "More Like This",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(child: SimilarFilmsBuilder(id: film.id ?? 0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
