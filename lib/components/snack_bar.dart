import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {

  final String text;

  const MySnackBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(text),

    );
  }
}