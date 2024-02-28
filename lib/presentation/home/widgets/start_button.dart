import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onTap;

  StartButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue.shade500,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blue.shade900),
          ),
          child: const Text(
            'Start counting progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
    );
  }
}