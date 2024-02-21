import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: CustomButton(
                text: 'Logout',
                onTap: () {
                  showLogOutDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
