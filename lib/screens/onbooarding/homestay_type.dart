import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_tile.dart';
import 'package:travel_bud/constants/global_varialbles.dart';
import 'package:travel_bud/screens/onbooarding/accommodation_details.dart';

class HomestayTypeScreen extends StatefulWidget {
  static const String routeName = '/homestay-type';
  const HomestayTypeScreen({super.key});

  @override
  State<HomestayTypeScreen> createState() => _HomestayTypeScreenState();
}

class _HomestayTypeScreenState extends State<HomestayTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Homestay Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet consectetur.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 130,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: GlobalVariables.homestayType.map((value) {
                return CustomTile(
                  assetPath: value['icon'].toString(),
                  text: value['title'].toString(),
                );
              }).toList(),
            ), 
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AccommodationDetailsScreen.routeName,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
