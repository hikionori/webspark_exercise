import 'package:flutter/material.dart';
import 'package:test_exercise/core/utils/constants.dart';
import 'package:test_exercise/presentation/pages/result/result_grid_page.dart';

class ListViewResults extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ListViewResults({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result list screen'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          thickness: 0.5,
          color: Constants.black,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultGridPage(pathData: items[index]),
                ),
              );
            },
            title: Center(child: Text(items[index]["result"]["path"])),
          );
        },
      ),
    );
  }
}
