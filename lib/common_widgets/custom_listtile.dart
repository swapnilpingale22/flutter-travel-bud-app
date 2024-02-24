// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
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
        title: Text(widget.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: (widget.count > 0)
               ? widget.onDecrease 
               : null,
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.black26,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              (widget.count < 10)
                  ? '0${widget.count}'
                  : widget.count.toString(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: widget.onIncrease,
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.black26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
