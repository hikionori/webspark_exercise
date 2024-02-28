import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_exercise/core/error/failures.dart';
import 'package:webspark_exercise/core/usecases/usecases.dart';
import 'package:webspark_exercise/core/utils/algoritms.dart';
import 'package:webspark_exercise/data/models/fetch_data_response.dart';
import 'package:webspark_exercise/domain/usecases/fetch_data_usecase.dart';
import 'package:webspark_exercise/domain/usecases/send_data_usecase.dart';
import 'package:webspark_exercise/core/injector.dart';
import 'package:webspark_exercise/presentation/result/list_view_results.dart';


part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(const ProgressState());

  Future<void> fetchData() async {
    emit(state.copyWith(isLoading: true, progressPercentage: 0));

    final data = await getIt<FetchDataUseCase>()(NoParams());

    data.fold(
      (l) => emit(state.copyWith(isLoading: false, error: (l as ServerFailure).message)),
      (r) async {
        for (int i = 0; i <= 100; i += 20) {
          await Future.delayed(const Duration(milliseconds: 500));
          emit(state.copyWith(progressPercentage: i.toDouble()));
        }
        List<Map<String, dynamic>> results = [];

        for (var item in r.data) {
          List<List<String>> field = (item.field).map((e) => e.split('')).toList();
          Position start = Position(x: item.start.x, y: item.start.y);
          Position end = Position(x: item.end.x, y: item.end.y);

          BFS pathfinding = BFS(field, start, end);
          Map<String, dynamic> result = pathfinding.getPathResult(item.id);
          results.add(result);
        }

        emit(state.copyWith(results: results, isLoading: false, error: '', progressPercentage: 100));
      },
    );
  }

  Future<void> sendData({required List<Map<String, dynamic>> data, required BuildContext context}) async {
    final result = await getIt<SendDataUseCase>()(SendDataParams(data: data));

    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              error: (l as ServerFailure).message,
            )),
        (r) async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListViewResults(items: state.results)));
          emit(state.copyWith(isLoading: false, error: ''));
        });
  }
}
