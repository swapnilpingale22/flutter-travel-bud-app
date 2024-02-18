import 'package:flutter/material.dart';

class CustomTextFieldTitle extends StatelessWidget {
  final String title;
  const CustomTextFieldTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          letterSpacing: .5,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
