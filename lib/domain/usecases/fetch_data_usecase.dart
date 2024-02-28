import 'package:dartz/dartz.dart';
import 'package:test_exercise/core/error/failures.dart';

import 'package:test_exercise/core/usecases/usecases.dart';
import 'package:test_exercise/data/models/fetch_data_response.dart';
import 'package:test_exercise/domain/repositories/fetch_data_repository.dart';

class FetchDataUseCase implements UseCase<FetchDataResponse, NoParams> {
  final FetchDataRepository repository;

  FetchDataUseCase(this.repository);

  @override
  Future<Either<Failure, FetchDataResponse>> call(NoParams params) async {
    // return await repository.getData();
    return repository.getData();
  }
}
