import 'package:flutter/material.dart';
import 'package:test_exercise/core/utils/constants.dart';
import 'package:test_exercise/presentation/pages/home/widgets/url_text_field.dart';
import 'package:test_exercise/presentation/pages/home/widgets/start_button.dart';
import 'package:test_exercise/presentation/pages/progress/progress_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late TextEditingController _urlController;
  String _errorMessage = '';

  @override
  void initState() {
    _urlController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  void _showError(String errorMessage) {
    setState(() {
      _errorMessage = errorMessage;
    });
  }

  void _handleTap() {
    if (_urlController.text.trim().isEmpty) {
      _showError('URL cannot be empty.');
      return;
    }

    if (!Constants.urlRegExp.hasMatch(_urlController.text.trim())) {
      _showError('Invalid URL. Please enter the correct URL.');
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProgressPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.compare_arrows_outlined),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: UrlTextField(controller: _urlController, errorMessage: _errorMessage),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: StartButton(onTap: _handleTap),
          ),
        ],
      ),
    );
  }
}
