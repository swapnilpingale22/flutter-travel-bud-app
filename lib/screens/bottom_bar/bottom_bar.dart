import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/provider/user_provider.dart';
import 'package:travel_bud/screens/home/home_screen.dart';
import 'package:travel_bud/screens/onbooarding/homestay_title.dart';
import 'package:travel_bud/screens/profile/profile_screen.dart';
import 'package:travel_bud/screens/host/host_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  List<Widget> pages = const [
    HomeScreen(),
    HostScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
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
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          iconSize: 20,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.real_estate_agent_outlined),
              label: 'Host',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomeStayTitle.routeName,
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
