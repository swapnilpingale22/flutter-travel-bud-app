import 'package:flutter/material.dart';

class CustomAmenity extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  const CustomAmenity({
    Key? key,
    required this.text,
    required this.icon,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
