// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String title;
  final bool value;
  final Function(bool)? onPressed;
  const CustomSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      child: ListTile(
        title: Text(widget.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: widget.value,
              onChanged: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
