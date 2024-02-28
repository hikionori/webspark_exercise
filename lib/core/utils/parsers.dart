class Parser {
  static List<List<int>> parsePath(String pathString) {
    List<String> steps = pathString.replaceAll("(", "").replaceAll(")", "").split("->");

    List<List<int>> parsedPath = [];
    for (var step in steps) {
      List<String> coordinates = step.split(",");
      parsedPath.add([int.parse(coordinates[0]), int.parse(coordinates[1])]);
    }

    return parsedPath;
  }
}
