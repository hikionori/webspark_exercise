import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:webspark_exercise/core/api/app_api.dart';
import 'package:webspark_exercise/data/repositories/fetch_data_repository.dart';
import 'package:webspark_exercise/domain/repositories/fetch_data_repository.dart';
import 'package:webspark_exercise/domain/usecases/fetch_data_usecase.dart';
import 'package:webspark_exercise/domain/usecases/send_data_usecase.dart';
final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => FetchDataUseCase(getIt()));
  getIt.registerLazySingleton(() => SendDataUseCase(getIt()));

  getIt.registerLazySingleton<FetchDataRepository>(() => FetchDataRepositoryImpl(getIt()));

  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<AppApi>(() => AppApi(getIt<Dio>()));

}
