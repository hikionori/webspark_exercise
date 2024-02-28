import 'package:flutter/material.dart';

class UrlTextField extends StatelessWidget {
  final TextEditingController controller;
  final String errorMessage;

  UrlTextField({required this.controller, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Enter URL',
        errorText: errorMessage.isNotEmpty ? errorMessage : null,
      ),
    );
  }
}
