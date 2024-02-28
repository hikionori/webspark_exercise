class FetchDataResponse {
  bool error;
  String message;
  List<FetchDataItems> data;

  FetchDataResponse({required this.error, required this.message, required this.data});

  factory FetchDataResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<FetchDataItems> puzzleItems =
    dataList.map((item) => FetchDataItems.fromJson(item)).toList();

    return FetchDataResponse(
      error: json['error'],
      message: json['message'],
      data: puzzleItems,
    );
  }
}

class FetchDataItems {
  String id;
  List<String> field;
  Position start;
  Position end;

  FetchDataItems({required this.id, required this.field, required this.start, required this.end});

  factory FetchDataItems.fromJson(Map<String, dynamic> json) {
    return FetchDataItems(
      id: json['id'],
      field: List<String>.from(json['field']),
      start: Position.fromJson(json['start']),
      end: Position.fromJson(json['end']),
    );
  }
}

class Position {
  int x;
  int y;

  Position({required this.x, required this.y});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      x: json['x'],
      y: json['y'],
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Position && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
class PathResult {
  final String id;
  final Result result;

  PathResult({
    required this.id,
    required this.result,
  });

  factory PathResult.fromJson(Map<String, dynamic> json) {
    return PathResult(
      id: json['id'] ?? "",
      result: Result.fromJson(json['result'] ?? {}),
    );
  }
}

class Result {
  final List<Step> steps;
  final String path;

  Result({
    required this.steps,
    required this.path,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      steps: (json['steps'] as List<dynamic>? ?? [])
          .map((step) => Step.fromJson(step))
          .toList(),
      path: json['path'] ?? "",
    );
  }
}

class Step {
  final String x;
  final String y;

  Step({
    required this.x,
    required this.y,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      x: json['x'] ?? "",
      y: json['y'] ?? "",
    );
  }
}

