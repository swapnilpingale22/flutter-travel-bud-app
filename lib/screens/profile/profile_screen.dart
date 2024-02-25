import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/provider/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 53,
              backgroundColor: Colors.black38,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHVzZXJ8ZW58MHx8MHx8fDA%3D',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text('Name: ${user.name}'),
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text('Mobile No: ${user.mobileNo}'),
                leading: const Icon(
                  Icons.phone_android_sharp,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text('Email: ${user.email}'),
                leading: const Icon(
                  Icons.email_outlined,
                  color: Colors.blue,
                ),
              ),
            ),
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
