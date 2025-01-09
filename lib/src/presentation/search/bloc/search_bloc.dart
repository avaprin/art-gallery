import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/inputs/search_art_previews_input.dart';
import '../../../data/models/pagination/pagination.dart';
import '../../../data/models/preview/art_preview.dart';
import '../../../data/repositories/art/art_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ArtRepository _artRepository;

  SearchBloc({
    required ArtRepository artRepository,
  })  : _artRepository = artRepository,
        super(const SearchIdle()) {
    on<SearchQuery>(_handleSearchQuery, transformer: _searchQueryTransformer);
  }

  Future<void> _handleSearchQuery(
    SearchQuery event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(
        SearchLoading(
          suggestions: state.suggestions,
        ),
      );

      final PageResponse<ArtPreview> response =
          await _artRepository.searchArtPreviews(
        SearchArtPreviewsInput(
          query: event.query,
          limit: 20,
          page: 1,
        ),
      );

      if (response.items.isEmpty) {
        return emit(
          SearchEmpty(
            suggestions: state.suggestions,
          ),
        );
      }

      emit(
        SearchSuccess(
          query: event.query,
          suggestions: <String>{
            if (event.query.isNotEmpty) event.query,
            ...state.suggestions,
          },
          artPreviews: <ArtPreview>[
            ...response.items,
          ],
        ),
      );
    } catch (_) {
      emit(
        SearchFailure(
          suggestions: state.suggestions,
        ),
      );
    }
  }

  Stream<T> _searchQueryTransformer<T>(
    Stream<T> events,
    Stream<T> Function(T) mapper,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .distinct()
        .switchMap(mapper);
  }
}
