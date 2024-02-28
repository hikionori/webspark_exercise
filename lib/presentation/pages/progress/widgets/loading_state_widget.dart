import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_exercise/core/utils/constants.dart';
import 'package:webspark_exercise/presentation/pages/progress/cubit/progress_cubit.dart';

class LoadingStateWidget extends StatelessWidget {
  final ProgressState state;

  const LoadingStateWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.defaultCellColor,
                  ),
                  child: CircularProgressIndicator(
                    value: state.progressPercentage / 100,
                    strokeWidth: 10.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text('${state.progressPercentage}%',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: GestureDetector(
              onTap: state.progressPercentage != 100 || state.isLoading
                  ? null
                  : () async {
                      context
                          .read<ProgressCubit>()
                          .sendData(data: state.results, context: context);
                    },
              child: Container(
                child: const Text('Send Data'),
                alignment: Alignment.center,
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: state.progressPercentage != 100 || state.isLoading
                      ? Colors.grey
                      : Colors.blue.shade500,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: state.progressPercentage != 100 || state.isLoading
                        ? Colors.grey
                        : Colors.blue.shade900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
