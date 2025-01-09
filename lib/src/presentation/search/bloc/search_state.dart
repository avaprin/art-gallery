part of 'search_bloc.dart';

sealed class SearchState {
  final Set<String> suggestions;

  const SearchState({
    required this.suggestions,
  });
}

final class SearchIdle extends SearchState {
  const SearchIdle()
      : super(
          suggestions: const <String>{},
        );
}

final class SearchLoading extends SearchState {
  const SearchLoading({
    required super.suggestions,
  });
}

final class SearchFailure extends SearchState {
  const SearchFailure({
    required super.suggestions,
  });
}

final class SearchEmpty extends SearchState {
  const SearchEmpty({
    required super.suggestions,
  });
}

final class SearchSuccess extends SearchState with EquatableMixin {
  final String query;
  final List<ArtPreview> artPreviews;

  const SearchSuccess({
    required this.query,
    required this.artPreviews,
    required super.suggestions,
  });

  @override
  List<Object?> get props {
    return <Object?>[
      query,
      artPreviews,
      suggestions,
    ];
  }
}
