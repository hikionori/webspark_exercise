part of 'progress_cubit.dart';

class ProgressState extends Equatable {
  final bool isLoading;
  final String error;
  final List<Map<String, dynamic>> results;
  final double progressPercentage;
  final bool sendDataSuccess;

  const ProgressState({
    this.results = const [],
    this.sendDataSuccess = false,
    this.isLoading = false,
    this.error = '',
    this.progressPercentage = 0,
  });

  @override
  List<Object?> get props => [isLoading, error, results, progressPercentage, sendDataSuccess];

  ProgressState copyWith({
    bool? isLoading,
    bool? sendDataSuccess,
    String? error,
    List<Map<String, dynamic>>? results,
    double? progressPercentage,
  }) {
    return ProgressState(
      sendDataSuccess: sendDataSuccess ?? this.sendDataSuccess,
      results: results ?? this.results,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      progressPercentage: progressPercentage ?? this.progressPercentage,
    );
  }
}
