part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<MovieModel> movies;

  SearchSuccess(this.movies);
}

final class SearchError extends SearchState {
  final String errMsg;

  SearchError(this.errMsg);
}
