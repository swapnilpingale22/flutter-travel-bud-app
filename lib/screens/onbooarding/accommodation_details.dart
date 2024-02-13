import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_listtile.dart';
import 'package:travel_bud/common_widgets/custom_named_switch.dart';
import 'package:travel_bud/screens/onbooarding/amenities.dart';

enum Place {
  entirePlace,
  privateRoom,
}

class AccommodationDetailsScreen extends StatefulWidget {
  static const String routeName = '/accommodation-details';
  const AccommodationDetailsScreen({super.key});

  @override
  State<AccommodationDetailsScreen> createState() =>
      _AccommodationDetailsScreenState();
}

class _AccommodationDetailsScreenState
    extends State<AccommodationDetailsScreen> {
  Place _place = Place.entirePlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accomodation Details',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _place == Place.entirePlace
                        ? Colors.blue
                        : Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/traditional.svg',
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      _place == Place.entirePlace
                          ? Colors.blue
                          : Colors.black26,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text('Entire Place'),
                  textColor:
                      _place == Place.entirePlace ? Colors.blue : Colors.black,
                  subtitle: const Text(
                    'Whole place to Guest',
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                  trailing: Radio(
                    value: Place.entirePlace,
                    groupValue: _place,
                    onChanged: (Place? val) {
                      setState(() {
                        _place = val!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _place == Place.privateRoom
                        ? Colors.blue
                        : Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/images/privateRoom.svg',
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      _place == Place.privateRoom
                          ? Colors.blue
                          : Colors.black26,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text('Private Room '),
                  textColor:
                      _place == Place.privateRoom ? Colors.blue : Colors.black,
                  subtitle: const Text(
                    'Guests sleep in private room but some areas are shared',
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                  trailing: Radio(
                    value: Place.privateRoom,
                    groupValue: _place,
                    onChanged: (Place? val) {
                      setState(() {
                        _place = val!;
                      });
                    },
                  ),
                ),
              ),
              const CustomListTile(
                title: 'Max Guests',
                count: 12,
              ),
              const CustomListTile(
                title: 'Bedrooms',
                count: 06,
              ),
              const CustomListTile(
                title: 'Single Bed',
                count: 05,
              ),
              const CustomListTile(
                title: 'Double Bed',
                count: 06,
              ),
              const CustomListTile(
                title: 'Extra floor mattress',
                count: 02,
              ),
              const CustomListTile(
                title: 'Bathrooms',
                count: 06,
              ),
              const CustomNamedSwitch(
                title: 'Kitchen Avaible',
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Next',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AmenitiesScreen.routeName,
                  );
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
