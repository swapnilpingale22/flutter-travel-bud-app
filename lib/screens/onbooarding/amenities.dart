import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/add_amenities.dart';
import 'package:travel_bud/screens/onbooarding/check_in_out_details.dart';

class AmenitiesScreen extends StatefulWidget {
  static const String routeName = '/amenities';
  const AmenitiesScreen({super.key});

  @override
  State<AmenitiesScreen> createState() => _AmenitiesScreenState();
}

class _AmenitiesScreenState extends State<AmenitiesScreen> {
  List<String> amenities = [];

  void _handleAmenityTap(String amenity) {
    setState(() {
      amenities.contains(amenity)
          ? amenities.remove(amenity)
          : amenities.add(amenity);
    });
  }

  void updateAmenitiesProvider() {
    var homestayProvider = Provider.of<HomestayProvider>(
      context,
      listen: false,
    );
    homestayProvider.updateAmenities(
      amenitiesList: amenities,
    );
  }

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
                      'Amenities',
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AddAmenitiesScreen.routeName,
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '+ Add Amenities',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text('Wi-Fi'),
                leading: const Icon(
                  Icons.wifi,
                  color: Colors.blue,
                ),
                trailing: Checkbox(
                  shape: const CircleBorder(),
                  activeColor: Colors.blue,
                  value: amenities.contains('Wi-Fi'),
                  onChanged: (value) => _handleAmenityTap('Wi-Fi'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text('Air-conditioner'),
                leading: SvgPicture.asset('assets/images/airConditioner.svg'),
                trailing: Checkbox(
                  shape: const CircleBorder(),
                  activeColor: Colors.blue,
                  value: amenities.contains('Air-conditioner'),
                  onChanged: (value) => _handleAmenityTap('Air-conditioner'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text('Fire alarm'),
                leading: SvgPicture.asset('assets/images/fireAlarm.svg'),
                trailing: Checkbox(
                  shape: const CircleBorder(),
                  activeColor: Colors.blue,
                  value: amenities.contains('Fire alarm'),
                  onChanged: (value) => _handleAmenityTap('Fire alarm'),
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CheckInOutDetailsScreen.routeName,
                );
              },
              child: const Text(
                'Skip',
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
                      text: 'Next',
                      onTap: amenities.isNotEmpty
                          ? () {
                              updateAmenitiesProvider();
                              Navigator.pushNamed(
                                context,
                                CheckInOutDetailsScreen.routeName,
                              );
                            }
                          : null,
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
