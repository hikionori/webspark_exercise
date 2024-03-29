import 'package:dartz/dartz.dart';
import 'package:webspark_exercise/core/api/app_api.dart';
import 'package:webspark_exercise/core/error/failures.dart';
import 'package:webspark_exercise/data/models/sended_data_response.dart';
import 'package:webspark_exercise/data/models/fetch_data_response.dart';

abstract interface class FetchDataRepository {
  final APIHelper remoteClient;

  FetchDataRepository(this.remoteClient);

  Future<Either<Failure, FetchDataResponse>> getData();

  Future<Either<Failure, SendedDataResponse>> sendData({required List<Map<String, dynamic>> data});
}
