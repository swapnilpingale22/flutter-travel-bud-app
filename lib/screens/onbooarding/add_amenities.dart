// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_amenity.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/stepper.dart';

class AddAmenitiesScreen extends StatefulWidget {
  static const String routeName = '/add-amenities';
  const AddAmenitiesScreen({super.key});

  @override
  State<AddAmenitiesScreen> createState() => _AddAmenitiesScreenState();
}

class _AddAmenitiesScreenState extends State<AddAmenitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomStepper(index: 3),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Amenities',
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
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const CustomAmenity(
              text: 'Home Theater',
              icon: Icons.remove_circle_outline,
              textColor: Colors.black,
            ),
            const CustomAmenity(
              text: 'Master Suite Balcony',
              icon: Icons.remove_circle_outline,
              textColor: Colors.black,
            ),
            const CustomAmenity(
              text: 'Amenities 3',
              icon: Icons.add_circle_outline,
              textColor: Colors.black26,
            ),
            const CustomAmenity(
              text: 'Amenities 4',
              icon: Icons.add_circle_outline,
              textColor: Colors.black26,
            ),
            const CustomAmenity(
              text: 'Amenities 5',
              icon: Icons.add_circle_outline,
              textColor: Colors.black26,
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      text: 'Done',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        showConfirmDialog(context);
                      },
                      child: const Text(
                        'Save and Exit',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
