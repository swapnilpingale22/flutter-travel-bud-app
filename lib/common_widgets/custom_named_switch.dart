// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomNamedSwitch extends StatefulWidget {
  final String title;
  final bool value;
  final Function(bool)? onPressed;
  const CustomNamedSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomNamedSwitch> createState() => _CustomNamedSwitchState();
}

class _CustomNamedSwitchState extends State<CustomNamedSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(widget.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'No',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            Switch(
              value: widget.value,
              onChanged: widget.onPressed,
            ),
            const SizedBox(width: 5),
            const Text(
              'Yes',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
