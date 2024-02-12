// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String title;
  // final bool value;
  const CustomSwitch({
    Key? key,
    required this.title,
    // required this.value,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    bool _value = false;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
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
              'Yes',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            Switch(
                value: _value,
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                }),
            const SizedBox(width: 5),
            const Text(
              'No',
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
