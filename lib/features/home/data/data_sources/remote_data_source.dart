import 'package:movie_app/constans.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieModel>> fetchPopularMovies();
  Future<List<MovieModel>> fetchUpComingMovies();
  Future<List<MovieModel>> searchMovies({required String query});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<MovieModel>> fetchPopularMovies() async {
    var data = await apiService.getData(endPoint: 'movie/popular', query: {
      'api_key': apiKey,
    });
    List<MovieModel> movies = [];

    for (var moviesFromData in data['results']) {
      movies.add(MovieModel.fromJson(moviesFromData));
    }
    return movies;
  }

  @override
  Future<List<MovieModel>> fetchUpComingMovies() async {
    var data = await apiService.getData(endPoint: 'movie/upcoming', query: {
      'api_key': apiKey,
    });
    List<MovieModel> movies = [];
    for (var moviesFromData in data['results']) {
      movies.add(MovieModel.fromJson(moviesFromData));
    }
    return movies;
  }

  @override
  Future<List<MovieModel>> searchMovies({required String query}) async {
    var data = await apiService.getData(endPoint: 'search/movie', query: {
      'query': query,
      'api_key': apiKey,
    });
    List<MovieModel> movies = [];
    for (var moviesFromData in data['results']) {
      movies.add(MovieModel.fromJson(moviesFromData));
    }

    return movies;
  }
}
