// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNumberedChip extends StatelessWidget {
  final String path;
  final String count;
  final String title;
  const CustomNumberedChip({
    Key? key,
    required this.path,
    required this.count,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        right: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            path,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Colors.blue,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(count),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
