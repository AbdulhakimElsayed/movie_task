import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/models/film_details/results.dart';
import 'package:movies/di/di.dart';
import 'package:movies/notifications/snack_message.dart';
import 'package:movies/ui/filmdetails/film_details_view_model.dart';
import 'package:movies/ui/filmdetails/film_type_tag.dart';

class FilmDetailsBuilder extends StatefulWidget {
  num id;
  Result film;

  FilmDetailsBuilder({super.key, required this.id, required this.film});

  @override
  State<FilmDetailsBuilder> createState() => _FilmDetailsBuilderState();
}

class _FilmDetailsBuilderState extends State<FilmDetailsBuilder> {
  FilmDetailsViewModel filmDetailsViewModel = getIt.get<FilmDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    filmDetailsViewModel.hasIntrnet(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmDetailsViewModel, FilmDetailsState>(
        bloc: filmDetailsViewModel,
        builder: (context, state) {
          switch (state) {
            case Success():
              {
                String backGroundPath =
                    "https://image.tmdb.org/t/p/w500${state.film.backdropPath}";
                String posterPath =
                    "https://image.tmdb.org/t/p/w500${state.film.posterPath}";

                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          state.film.releaseDate ?? "",
                          style: const TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "-${(state.film.runtime) ?? 0 ~/ 60}h ${state.film.runtime ?? 0 % 60}m",
                          style: const TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: posterPath,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(
                            child: Text(
                              "NO IMAGE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            alignment: AlignmentDirectional.topStart,
                            width: 130,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                            child: InkWell(
                                onTap: () {
                                  filmDetailsViewModel.addTolocal(widget.film);
                                  showSnack(
                                      "${widget.film.title} added to watch list",
                                      context);
                                },
                                child:
                                    Image.asset("assets/images/add_icon.png")),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 90,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 3.5,
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 15),
                                      itemBuilder: (context, index) => FilmTag(
                                        type: state.film.genres?[index].name,
                                      ),
                                      itemCount: state.film.genres?.length,
                                    ),
                                  ),
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Text(
                                      state.film.overview ?? "",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          height: 2,
                                          fontSize: 13),
                                    ),
                                  )),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 25,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${state.film.voteAverage ?? 0.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
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
                        padding: const EdgeInsets.all(20),
                        child: Center(
                            child: Text(
                          state.error,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ))));
              }
            case NoIntrnet():
              {
                String backGroundPath =
                    "https://image.tmdb.org/t/p/w500${widget.film.backdropPath}";
                String posterPath =
                    "https://image.tmdb.org/t/p/w500${widget.film.posterPath}";

                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.film.releaseDate ?? "",
                          style: const TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "",
                          style: TextStyle(
                            color: Color(0xFFB5B4B4),
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: posterPath,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(
                            child: Text(
                              "NO IMAGE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            alignment: AlignmentDirectional.topStart,
                            width: 130,
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                            child: Image.asset("assets/images/add_icon.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                    child: Text(
                                      widget.film.overview ?? "",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          height: 2,
                                          fontSize: 13),
                                    ),
                                  )),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 25,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${widget.film.voteAverage ?? 0.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
          }
        });
  }
}
