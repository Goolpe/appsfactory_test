import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/presentation/main/bloc/stored_albums_cubit.dart';
import 'package:appsfactory_test/presentation/main/bloc/stored_albums_state.dart';
import 'package:appsfactory_test/presentation/search_artists/pages/search_artists_page.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoredAlbumsBuilder extends BlocBuilder<StoredAlbumsCubit, StoredAlbumsState> {
  const StoredAlbumsBuilder({
    super.key,
  }) : super(
    builder: _builder,
  );

  static Widget _builder(BuildContext context, StoredAlbumsState state) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    
    if(state is StoredAlbumsStateSuccess){
      if(state.albums.isEmpty){
        return TextWithButton(
          text: locale.thereAreNoAlbumsHereYet,
          textButton: locale.findAnArtist,
          onPressed: () => Navigator.pushNamed(
            context, SearchArtistsPage.screenName,),
        );
      }
    
      return NestedWrapper(
        title: '${locale.yourAlbums} [${state.albums.length}]',
        body: Scrollbar(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
            itemCount: state.albums.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (BuildContext context, int index){
              final AlbumDetail albumDetail = state.albums[index];
              
              return AlbumCard(
                key: Key(albumDetail.mbid),
                albumDetail: albumDetail,
              );
            }, 
          ),
        ),
      );
    }

    if(state is StoredAlbumsStateError){
      return TextWithButton(
        text: state.error,
        textButton: locale.tryAgain,
        onPressed: state.repeat,
      );
    }

    return const LoadingIndicator();
  }
}
