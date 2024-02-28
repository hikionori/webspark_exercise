import 'dart:collection';

import 'package:webspark_exercise/data/models/fetch_data_response.dart';

class BFS {
  List<List<String>> field;
  Position start;
  Position end;

  BFS(this.field, this.start, this.end);

  List<Position> findPath() {
    Map<Position, Position> cameFrom = {start: start};
    Queue<Position> queue = Queue();
    queue.add(start);

    while (queue.isNotEmpty) {
      Position current = queue.removeFirst();

      if (current == end) {
        return reconstructPath(cameFrom, current);
      }

      for (Position neighbor in getNeighbors(current)) {
        if (!cameFrom.containsKey(neighbor)) {
          cameFrom[neighbor] = current;
          queue.add(neighbor);
        }
      }
    }

    return [];
  }

  List<Position> getNeighbors(Position point) {
    List<Position> neighbors = [];
    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        if (dx != 0 || dy != 0) {
          int newX = point.x + dx;
          int newY = point.y + dy;

          if (newX >= 0 &&
              newX < field[0].length &&
              newY >= 0 &&
              newY < field.length &&
              field[newY][newX] == '.') {
            neighbors.add(Position(x: newX, y: newY));
          }
        }
      }
    }
    return neighbors;
  }

  List<Position> reconstructPath(
      Map<Position, Position> cameFrom, Position current) {
    List<Position> path = [current];
    while (cameFrom[current] != current) {
      current = cameFrom[current]!;
      path.add(current);
    }
    return path.reversed.toList();
  }

  Map<String, dynamic> getPathResult(String id) {
    List<Position> path = findPath();
    String formattedPath = formatPath(path);

    List<Map<String, String>> steps = path
        .map((point) => {"x": point.x.toString(), "y": point.y.toString()})
        .toList();

    return {
      "id": id,
      "result": {
        "steps": steps,
        "path": formattedPath,
      },
    };
  }

  String formatPath(List<Position> path) {
    return path.map((point) => "(${point.x},${point.y})").join("->");
  }
}
