import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/data_sources/remote_data_source.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      List<MovieModel> data = await homeRemoteDataSource.fetchPopularMovies();
      log('Movies Length : ${data.length.toString()}');
      return right(data);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioErr(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchUpComingMovies() async {
    try {
      List<MovieModel> data = await homeRemoteDataSource.fetchUpComingMovies();

      return right(data);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioErr(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(
      {required String query}) async {
    try {
      List<MovieModel> data = await homeRemoteDataSource.searchMovies(
        query: query,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioErr(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
