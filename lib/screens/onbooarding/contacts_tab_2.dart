import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/term_and_conditions.dart';

class ContactsTabContent2 extends StatelessWidget {
  const ContactsTabContent2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homestay =
        Provider.of<HomestayProvider>(context, listen: false).homestay;
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
              ' ${homestay.ownerContactNo}',
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
              ' ${homestay.ownerEmail}',
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
              ' ${homestay.homestayContactNo}',
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
              ' ${homestay.homestayEmail}',
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
            Navigator.pushNamed(
              context,
              TermAndConditionsScreen.routeName,
            );
          },
        ),
      ],
    );
  }
}
