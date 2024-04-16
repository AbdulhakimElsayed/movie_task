import 'package:movies/data/models/film_details/results.dart';

import 'BelongsToCollection.dart';
import 'Genres.dart';
import 'ProductionCompanies.dart';
import 'ProductionCountries.dart';
import 'SpokenLanguages.dart';

/// adult : false
/// backdrop_path : "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg"
/// belongs_to_collection : {"id":1199601,"name":"Five Nights at Freddy's Collection","poster_path":null,"backdrop_path":null}
/// budget : 20000000
/// genres : [{"id":27,"name":"Horror"},{"id":9648,"name":"Mystery"}]
/// homepage : "https://www.fivenightsatfreddys.movie"
/// id : 507089
/// imdb_id : "tt4589218"
/// original_language : "en"
/// original_title : "Five Nights at Freddy's"
/// overview : "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems."
/// popularity : 5378.969
/// poster_path : "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg"
/// production_companies : [{"id":3172,"logo_path":"/kDedjRZwO8uyFhuHamomOhN6fzG.png","name":"Blumhouse Productions","origin_country":"US"},{"id":211144,"logo_path":null,"name":"Scott Cawthon Productions","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2023-10-25"
/// revenue : 149400000
/// runtime : 110
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Can you survive five nights?"
/// title : "Five Nights at Freddy's"
/// video : false
/// vote_average : 8.364
/// vote_count : 1280

class FilmDetail {
  FilmDetail({
    this.statusCode,
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.results,
    this.page,
    this.totalPages,
    this.totalResults,
  });

  FilmDetail.fromJson(dynamic json) {
    statusCode = json['status_code'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genre.fromJson(v));
      });
    }
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    page = json['page'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  num? page;
  num? totalPages;
  num? totalResults;
  List<Result>? results;
  num? statusCode;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  num? budget;
  List<Genre>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  FilmDetail copyWith(
          {bool? adult,
          String? backdropPath,
          BelongsToCollection? belongsToCollection,
          num? budget,
          List<Genre>? genres,
          String? homepage,
          num? id,
          String? imdbId,
          String? originalLanguage,
          String? originalTitle,
          String? overview,
          num? popularity,
          String? posterPath,
          List<ProductionCompanies>? productionCompanies,
          List<ProductionCountries>? productionCountries,
          String? releaseDate,
          num? revenue,
          num? runtime,
          List<SpokenLanguages>? spokenLanguages,
          String? status,
          String? tagline,
          String? title,
          bool? video,
          num? voteAverage,
          num? voteCount,
          num? page,
          List<Result>? results,
          num? totalPages,
          num? totalResults}) =>
      FilmDetail(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        belongsToCollection: belongsToCollection ?? this.belongsToCollection,
        budget: budget ?? this.budget,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        imdbId: imdbId ?? this.imdbId,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        productionCountries: productionCountries ?? this.productionCountries,
        releaseDate: releaseDate ?? this.releaseDate,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
}
