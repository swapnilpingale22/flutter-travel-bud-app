import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_listtile.dart';
import 'package:travel_bud/common_widgets/custom_named_switch.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
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
  int maxGuests = 0;
  int bedrooms = 0;
  int singleBed = 0;
  int doubleBed = 0;
  int extraFloorMat = 0;
  int bathrooms = 0;
  bool isKitchenAvailable = false;

  void updateAccomDetailsProvider() {
    var homestayProvider = Provider.of<HomestayProvider>(
      context,
      listen: false,
    );
    homestayProvider.updateAccomDetails(
      area: _place.name,
      guests: maxGuests,
      bedroom: bedrooms,
      singleBed: singleBed,
      doubleBed: doubleBed,
      extraFloorMat: extraFloorMat,
      bathroom: bathrooms,
      kitchen: isKitchenAvailable,
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
            const CustomStepper(index: 2),
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
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            SingleChildScrollView(
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
                      textColor: _place == Place.entirePlace
                          ? Colors.blue
                          : Colors.black,
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
                      textColor: _place == Place.privateRoom
                          ? Colors.blue
                          : Colors.black,
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
                  CustomListTile(
                    title: 'Max Guests',
                    count: maxGuests,
                    onIncrease: () {
                      setState(() {
                        maxGuests = maxGuests + 1;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        maxGuests = maxGuests - 1;
                      });
                    },
                  ),
                  CustomListTile(
                    title: 'Bedrooms',
                    count: bedrooms,
                    onIncrease: () {
                      setState(() {
                        bedrooms = bedrooms + 1;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        bedrooms = bedrooms - 1;
                      });
                    },
                  ),
                  CustomListTile(
                    title: 'Single Bed',
                    count: singleBed,
                    onIncrease: () {
                      setState(() {
                        singleBed = singleBed + 1;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        singleBed = singleBed - 1;
                      });
                    },
                  ),
                  CustomListTile(
                    title: 'Double Bed',
                    count: doubleBed,
                    onIncrease: () {
                      setState(() {
                        doubleBed = doubleBed + 1;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        doubleBed = doubleBed - 1;
                      });
                    },
                  ),
                  CustomListTile(
                    title: 'Extra floor mattress',
                    count: extraFloorMat,
                    onIncrease: () {
                      setState(() {
                        extraFloorMat = extraFloorMat + 1;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        extraFloorMat = extraFloorMat - 1;
                      });
                    },
                  ),
                  CustomListTile(
                    title: 'Bathrooms',
                    count: bathrooms,
                    onIncrease: () {
                      setState(() {
                        bathrooms = bathrooms + 1;
                      });
                    },
                    onDecrease: () {
                      setState(() {
                        bathrooms = bathrooms - 1;
                      });
                    },
                  ),
                  CustomNamedSwitch(
                    title: 'Kitchen Avaible',
                    value: isKitchenAvailable,
                    onPressed: (val) {
                      setState(() {
                        isKitchenAvailable = val;
                      });
                    },
                  ),
                  const SizedBox(height: 110),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    text: 'Next',
                    onTap: () {
                      updateAccomDetailsProvider();
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
          ],
        ),
      ),
    );
  }
}
