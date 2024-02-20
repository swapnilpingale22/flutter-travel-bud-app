import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ${user.name}!',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Welcome to Travelbud.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'TB',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            text: 'Logout',
            onTap: () {
              showLogOutDialog(context);
            },
          ),
        ),
      ),
    );
  }
}
