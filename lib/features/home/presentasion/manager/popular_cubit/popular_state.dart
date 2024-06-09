part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoadingState extends PopularState {}

final class PopularErrorState extends PopularState {
  final String errMsg;

  PopularErrorState(this.errMsg);
}

final class PopularSuccessState extends PopularState {
  final List<MovieModel> movies;

  PopularSuccessState(this.movies);
}
