// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final int count;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.remove_circle_outline,
              color: Colors.black26,
            ),
            const SizedBox(width: 5),
            Text(
              (count < 10) ? '0$count' : count.toString(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.add_circle_outline,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
