import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/screens/onbooarding/term_and_conditions.dart';

class ContactsTabContent extends StatelessWidget {
  const ContactsTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        const Row(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              ' +1 56445 54876',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.mail_outline,
              color: Colors.blue,
            ),
            Text(
              ' johndoe0601@gmail.com',
              style: TextStyle(
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
        const Row(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              ' +1 56445 54876',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.call,
              color: Colors.blue,
            ),
            Text(
              ' +1 87564 23847',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            Icon(
              Icons.mail_outline,
              color: Colors.blue,
            ),
            Text(
              ' johndoe0601@gmail.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.mail_outline,
              color: Colors.blue,
            ),
            Text(
              ' jeonzjk0601@gmail.com',
              style: TextStyle(
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
