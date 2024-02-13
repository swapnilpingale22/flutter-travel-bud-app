// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTile extends StatelessWidget {
  final Color color;
  final Color bordeColor;
  final Color textColor;
  final String assetPath;
  final String text;
  final double height;
  final double fontSize;
  const CustomTile({
    Key? key,
    this.color = Colors.black26,
    this.bordeColor = Colors.black26,
    this.textColor = Colors.black,
    required this.assetPath,
    required this.text,
    this.height = 50,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: bordeColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            height: height,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
