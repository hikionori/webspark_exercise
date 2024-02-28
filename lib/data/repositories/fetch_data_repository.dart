import 'package:dartz/dartz.dart';
import 'package:webspark_exercise/core/api/app_api.dart';
import 'package:webspark_exercise/core/error/failures.dart';
import 'package:webspark_exercise/data/models/sended_data_response.dart';
import 'package:webspark_exercise/data/models/fetch_data_response.dart';
import 'package:webspark_exercise/domain/repositories/fetch_data_repository.dart';


class FetchDataRepositoryImpl implements FetchDataRepository {
  FetchDataRepositoryImpl(this.remoteClient);

  @override
  late final APIHelper remoteClient;

  @override
  Future<Either<Failure, FetchDataResponse>> getData() async {
    try {
      final data = await remoteClient.fetchData();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SendedDataResponse>> sendData({required List<Map<String, dynamic>> data}) async {
    try {
      final result = await remoteClient.sendData(data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
