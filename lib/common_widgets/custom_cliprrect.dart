import 'package:flutter/material.dart';

class CustomClipRRect extends StatelessWidget {
  const CustomClipRRect({
    super.key,
    required this.photoUrl,
  });

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white70,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 3,
            spreadRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          photoUrl,
          fit: BoxFit.cover,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
