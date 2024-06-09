part of 'request_value_cubit.dart';

@immutable
sealed class RequestValueState {}

final class RequestValueInitial extends RequestValueState {}

final class RequestValueUpComingSuccessState extends RequestValueState {}

final class RequestValuePopularSuccessState extends RequestValueState {}
