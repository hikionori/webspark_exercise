import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_exercise/core/error/failures.dart';

import 'package:test_exercise/core/usecases/usecases.dart';
import 'package:test_exercise/data/models/sended_data_response.dart';
import 'package:test_exercise/domain/repositories/fetch_data_repository.dart';

class SendDataUseCase implements UseCase<SendedDataResponse, SendDataParams> {
  final FetchDataRepository repository;

  SendDataUseCase(this.repository);

  @override
  Future<Either<Failure, SendedDataResponse>> call(SendDataParams params) async {
    return await repository.sendData(data: params.data);
  }
}

class SendDataParams extends Equatable {
  final List<Map<String, dynamic>> data;

  const SendDataParams({required this.data});

  @override
  List<Object> get props => [data];
}
