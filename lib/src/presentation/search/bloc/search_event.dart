part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchQuery extends SearchEvent with EquatableMixin {
  final String query;

  const SearchQuery({
    required this.query,
  });

  @override
  List<Object?> get props {
    return <String>[
      query,
    ];
  }
}
