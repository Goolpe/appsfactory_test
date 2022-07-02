import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/artist.dart';
import 'package:appsfactory_test/domain/usecases/search_artists.dart';
import 'package:appsfactory_test/presentation/search_artists/bloc/search_artists_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

class SearchArtistsCubit extends SafeCubit<SearchArtistsState> {
  SearchArtistsCubit() : super(SearchArtistsStateInitial());

  TextEditingController searchController = TextEditingController();

  String get _searchText => searchController.text.trim();

  Future<void> search() async {
    emit(SearchArtistsStateInitial());

    if(_searchText.isEmpty){
      emit(SearchArtistsStateEmpty());
      
      return;
    }
    
    emit(SearchArtistsStateSuccess());
  }

  Future<Either<Failure, List<Artist>>> fetchArtists(int page) async {
    final SearchArtists searchArtists = SearchArtists();

    final Future<Either<Failure, List<Artist>>> result = searchArtists(
      SearchArtistsParams(
        artistName: _searchText,
        page: page,
      ),
    );

    return result;
  }

  @override
  Future<void> close() {
    searchController.dispose();

    return super.close();
  }
}
