import 'package:dio/dio.dart';
import 'package:test_exercise/data/models/sended_data_response.dart';
import 'package:test_exercise/data/models/fetch_data_response.dart';

class AppApi {
  static const String baseUrl = 'https://flutter.webspark.dev/flutter/api';

  final Dio _dio;

  Dio get dio => _dio;

  AppApi(this._dio);

  Future<FetchDataResponse> fetchData() async {
    try {
      Response response = await _dio.get(baseUrl);
      return FetchDataResponse.fromJson(response.data);
    } catch (error) {
      throw _handleError(error);
    }
  }

  Future<SendedDataResponse> sendData(dynamic data) async {
    try {
      Response response = await _dio.post(baseUrl, data: data);
      return SendedDataResponse.fromJson(response.data);
    } catch (error) {
      throw _handleError(error);
    }
  }

  Exception _handleError(error) {
    if (error is DioException) {
      switch (error.response?.statusCode) {
        case 429:
          return Exception('Too Many Requests');
        case 500:
          return Exception('Internal Server Error');
        default:
          return Exception('Something went wrong');
      }
    } else {
      return Exception('Something went wrong');
    }
  }
}
