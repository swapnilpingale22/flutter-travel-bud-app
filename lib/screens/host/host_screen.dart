import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/screens/onbooarding/homestay_title.dart';

class HostScreen extends StatelessWidget {
  static const routeName = '/host';
  const HostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "We're here for you",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Click to list property',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: CustomButton(
                text: 'Host Property',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HomeStayTitle.routeName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
