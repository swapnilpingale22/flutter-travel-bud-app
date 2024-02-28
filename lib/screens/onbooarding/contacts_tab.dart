// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/provider/homestay_provider.dart';

class ContactsTabContent extends StatelessWidget {
  final int index;
  const ContactsTabContent({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var property =
        Provider.of<HomestayProvider>(context, listen: false).properties[index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Owner Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              ' ${property.ownerContactNo}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.mail_outline,
              color: Colors.blue,
            ),
            Text(
              ' ${property.ownerEmail}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Homestay Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              ' ${property.homestayContactNo}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(
              Icons.mail_outline,
              color: Colors.blue,
            ),
            Text(
              ' ${property.homestayEmail}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Done',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
