import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_exercise/core/utils/constants.dart';
import 'package:webspark_exercise/presentation/progress/widgets/loading_state_widget.dart';

import 'cubit/progress_cubit.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  bool _isSendingData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress screen'),
      ),
      body: BlocProvider(
        create: (context) => ProgressCubit()..fetchData(),
        child: BlocListener<ProgressCubit, ProgressState>(
          listener: (context, state) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error), backgroundColor: Constants.red));
            }
          },
          child: BlocBuilder<ProgressCubit, ProgressState>(
            builder: (context, state) {
              if (state.isLoading) {
                return LoadingStateWidget(
                  state: state,
                );
              } else {
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
                              child: const CircularProgressIndicator(
                                value: 1.0,
                                strokeWidth: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text('100%', style: TextStyle(fontSize: 18.0)),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: GestureDetector(
                          onTap: (state.progressPercentage != 100 ||
                                  state.isLoading ||
                                  _isSendingData ||
                                  state.error.isNotEmpty)
                              ? null
                              : () async {
                                  setState(() => _isSendingData = true);
                                  await BlocProvider.of<ProgressCubit>(context)
                                      .sendData(
                                          data: state.results, context: context)
                                      .then(
                                    (value) {
                                      setState(() => _isSendingData = false);
                                    },
                                  );
                                },
                          child: Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * 0.8,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _isSendingData
                                    ? Constants.grey
                                    : Colors.blue.shade500,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: _isSendingData
                                      ? Constants.grey
                                      : Colors.blue.shade900,
                                ),
                              ),
                              child: const Text('Send Data',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.0))),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}