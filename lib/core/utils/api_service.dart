import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final Dio dio = Dio();
  Future<Map<String, dynamic>> getData(
      {Map<String, dynamic>? query, String? endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint', queryParameters: query);

    return response.data;
  }
}
