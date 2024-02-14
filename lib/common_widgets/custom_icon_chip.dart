import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconChip extends StatelessWidget {
  final String path;
  final String title;
  const CustomIconChip({
    Key? key,
    required this.path,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 75,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade50,
              child: SvgPicture.asset(path),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 35,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
