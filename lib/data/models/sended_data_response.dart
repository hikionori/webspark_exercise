class SendedDataResponse {
  final bool error;
  final String message;
  final List<DataItem> data;

  SendedDataResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory SendedDataResponse.fromJson(Map<String, dynamic> json) {
    return SendedDataResponse(
      error: json['error'] ?? false,
      message: json['message'] ?? "",
      data: (json['data'] as List<dynamic>? ?? [])
          .map((item) => DataItem.fromJson(item))
          .toList(),
    );
  }
}

class DataItem {
  final String id;
  final bool correct;

  DataItem({
    required this.id,
    required this.correct,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      id: json['id'] ?? "",
      correct: json['correct'] ?? false,
    );
  }
}
