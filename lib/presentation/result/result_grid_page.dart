import 'package:flutter/material.dart';
import 'package:webspark_exercise/core/utils/constants.dart';
import 'package:webspark_exercise/core/utils/parsers.dart';

class ResultGridPage extends StatelessWidget {
  final Map<String, dynamic> pathData;

  const ResultGridPage({Key? key, required this.pathData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<int>> path = Parser.parsePath(pathData["result"]["path"]);

    if (path.isNotEmpty) {
      int minX = path[0][0];
      int minY = path[0][1];
      int maxX = path[0][0];
      int maxY = path[0][1];

      for (var cords in path) {
        if (cords[0] < minX) minX = cords[0];
        if (cords[0] > maxX) maxX = cords[0];
        if (cords[1] < minY) minY = cords[1];
        if (cords[1] > maxY) maxY = cords[1];
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Preview screen'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: maxX - minX + 1,
          ),
          itemBuilder: (context, index) {
            int row = index ~/ (maxX - minX + 1);
            int col = index % (maxX - minX + 1);
            List<int> currentCords = [minX + col, minY + row];
            Color cellColor = Constants.defaultCellColor;

            if (path[0][0] == currentCords[0] && path[0][1] == currentCords[1]) {
              cellColor = Constants.startCellColor;
            } else if (path.last[0] == currentCords[0] && path.last[1] == currentCords[1]) {
              cellColor = Constants.endCellColor;
            } else if (path.any((cords) => cords[0] == currentCords[0] && cords[1] == currentCords[1])) {
              cellColor = Constants.pathCellColor;
            } else {
              cellColor = Constants.defaultCellColor;
            }
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Constants.black),
                color: cellColor,
              ),
              child: Center(child: Text('(${currentCords[0]}, ${currentCords[1]})')),
            );
          },
          itemCount: (maxX - minX + 1) * (maxY - minY + 1),
        ),
      );
    } else {
      return const Center(
        child: Text('Invalid path data.'),
      );
    }
  }
}
