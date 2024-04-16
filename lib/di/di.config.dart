// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/api_manger.dart' as _i3;
import '../data/data_scource_contract/categorized_film_source.dart' as _i4;
import '../data/data_scource_contract/film_details_source.dart' as _i25;
import '../data/data_scource_contract/new_release_source.dart' as _i7;
import '../data/data_scource_contract/popular_film_source_contract.dart' as _i9;
import '../data/data_scource_contract/recommended_source.dart' as _i11;
import '../data/data_scource_contract/search_data_source.dart' as _i13;
import '../data/data_scource_contract/similar_films_source.dart' as _i15;
import '../data/data_scource_contract/watch_list_data_source.dart' as _i17;
import '../data/data_source_imp/categorized_film_sourceimp.dart' as _i5;
import '../data/data_source_imp/film_details_sourceimp.dart' as _i26;
import '../data/data_source_imp/new_release_sourceimp.dart' as _i8;
import '../data/data_source_imp/popular_film_sourceimp.dart' as _i10;
import '../data/data_source_imp/recommended_sourceimp.dart' as _i12;
import '../data/data_source_imp/search_data_sourceimp.dart' as _i14;
import '../data/data_source_imp/similar_films_sourceimp.dart' as _i16;
import '../data/data_source_imp/watch_list_data_sourceimp.dart' as _i18;
import '../data/data_source_repo_contract/categorized_film_repo.dart' as _i22;
import '../data/data_source_repo_contract/film_details_repo.dart' as _i41;
import '../data/data_source_repo_contract/new_release_repo.dart' as _i27;
import '../data/data_source_repo_contract/popular_film_repo.dart' as _i29;
import '../data/data_source_repo_contract/recommended_repo.dart' as _i32;
import '../data/data_source_repo_contract/search_data_repo.dart' as _i35;
import '../data/data_source_repo_contract/similar_film_repo.dart' as _i38;
import '../data/data_source_repo_contract/watch_list_repo.dart' as _i19;
import '../data/data_source_repo_imp/categorized_film_repoimp.dart' as _i23;
import '../data/data_source_repo_imp/film_details_repoimp.dart' as _i42;
import '../data/data_source_repo_imp/new_release_repoimp.dart' as _i28;
import '../data/data_source_repo_imp/popular_film_repoimp.dart' as _i30;
import '../data/data_source_repo_imp/recommended_repoimp.dart' as _i33;
import '../data/data_source_repo_imp/search_data_repoimp.dart' as _i36;
import '../data/data_source_repo_imp/similar_film_repoimp.dart' as _i39;
import '../data/data_source_repo_imp/watch_list_repoimp.dart' as _i20;
import '../shared_preference/shared_preference_manger.dart' as _i6;
import '../ui/filmdetails/film_details_view_model.dart' as _i43;
import '../ui/filmdetails/similar_films/similar_film_view_model.dart' as _i40;
import '../ui/tabs/browser/catagory/category_view_model.dart' as _i24;
import '../ui/tabs/home/new_realese/new_reales_view_model.dart' as _i44;
import '../ui/tabs/home/popular/popular_view_model.dart' as _i31;
import '../ui/tabs/home/recommend/recommended_view_model.dart' as _i34;
import '../ui/tabs/search/search_view_model.dart' as _i37;
import '../ui/tabs/watch_list_tab/watch_list_view_model.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(_i3.ApiManger());
    gh.factory<_i4.CategorizedFilmSource>(
        () => _i5.CategorizedFilmSourceimp(gh<_i3.ApiManger>()));
    gh.singleton<_i6.LocalStorage>(_i6.LocalStorage());
    gh.factory<_i7.NewReleaseSource>(() => _i8.NewReleaseSourceImp(
          gh<_i3.ApiManger>(),
          gh<_i6.LocalStorage>(),
        ));
    gh.factory<_i9.PopularFilmSource>(
        () => _i10.PopularFilmSourceimp(gh<_i3.ApiManger>()));
    gh.factory<_i11.RecommendedSource>(() => _i12.RecommendedSourceImp(
          gh<_i3.ApiManger>(),
          gh<_i6.LocalStorage>(),
        ));
    gh.factory<_i13.SearchSource>(
        () => _i14.SearchSourceImp(gh<_i3.ApiManger>()));
    gh.factory<_i15.SimilarFilmSource>(() => _i16.SimilarFilmSourceImp(
          gh<_i3.ApiManger>(),
          gh<_i6.LocalStorage>(),
        ));
    gh.factory<_i17.WatchListDataSource>(
        () => _i18.WatchListDataSourceimp(gh<_i6.LocalStorage>()));
    gh.factory<_i19.WatchListRepo>(
        () => _i20.WatchListRepoImp(gh<_i17.WatchListDataSource>()));
    gh.factory<_i21.WatchListViewModel>(
        () => _i21.WatchListViewModel(gh<_i19.WatchListRepo>()));
    gh.factory<_i22.CategorizedFilmRepo>(
        () => _i23.CategorizedFilmRepoimp(gh<_i4.CategorizedFilmSource>()));
    gh.factory<_i24.CategoryViewModel>(
        () => _i24.CategoryViewModel(gh<_i22.CategorizedFilmRepo>()));
    gh.factory<_i25.FilmDetailsSource>(() => _i26.FilmDetailsSourceImp(
          gh<_i3.ApiManger>(),
          gh<_i6.LocalStorage>(),
        ));
    gh.factory<_i27.NewReleaseRepo>(
        () => _i28.NewReleaseRepoImp(gh<_i7.NewReleaseSource>()));
    gh.factory<_i29.PopularFilmRepo>(
        () => _i30.PopularFilmRepoImp(gh<_i9.PopularFilmSource>()));
    gh.factory<_i31.PopularViewModel>(
        () => _i31.PopularViewModel(gh<_i29.PopularFilmRepo>()));
    gh.factory<_i32.RecommendedRepo>(
        () => _i33.RecommendedRepoImp(gh<_i11.RecommendedSource>()));
    gh.factory<_i34.RecommendedViewModel>(
        () => _i34.RecommendedViewModel(gh<_i32.RecommendedRepo>()));
    gh.factory<_i35.SearchRepo>(
        () => _i36.SearchRepoImp(gh<_i13.SearchSource>()));
    gh.factory<_i37.SearchViewModel>(
        () => _i37.SearchViewModel(gh<_i35.SearchRepo>()));
    gh.factory<_i38.SimilarFilmRepo>(
        () => _i39.SimilarFilmRepoImp(gh<_i15.SimilarFilmSource>()));
    gh.factory<_i40.SimilarFilmsViewModel>(
        () => _i40.SimilarFilmsViewModel(gh<_i38.SimilarFilmRepo>()));
    gh.factory<_i41.FilmDetailsRepo>(
        () => _i42.FilmDetailsRepoImp(gh<_i25.FilmDetailsSource>()));
    gh.factory<_i43.FilmDetailsViewModel>(
        () => _i43.FilmDetailsViewModel(gh<_i41.FilmDetailsRepo>()));
    gh.factory<_i44.NewRealeseViewModel>(
        () => _i44.NewRealeseViewModel(gh<_i27.NewReleaseRepo>()));
    return this;
  }
}
