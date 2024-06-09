part of 'upcoming_cubit.dart';

@immutable
sealed class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoadingState extends UpcomingState {}

final class UpcomingSuccessState extends UpcomingState {
  final List<MovieModel> movies;

  UpcomingSuccessState(this.movies);
}

final class UpcomingErrorState extends UpcomingState {
  final String errMsg;

  UpcomingErrorState(this.errMsg);
}
