import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_chip.dart';
import 'package:travel_bud/common_widgets/custom_icon_chip.dart';
import 'package:travel_bud/common_widgets/custom_numbered_chip.dart';
import 'package:travel_bud/screens/onbooarding/term_and_conditions.dart';

class DetailsTabContent extends StatelessWidget {
  const DetailsTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LatLng puneLocation = const LatLng(18.5204, 73.8567);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Row(
          children: [
            CustomChip(
              text: 'Traditional',
              path: 'assets/images/traditional.svg',
            ),
            CustomChip(
              text: 'Entire Place',
              path: 'assets/images/traditional.svg',
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 30,
          ),
          children: const [
            CustomNumberedChip(
              path: 'assets/images/privateRoom.svg',
              count: '6',
              title: 'Bedrooms',
            ),
            CustomNumberedChip(
              path: 'assets/images/singleBed.svg',
              count: '5',
              title: 'Single Bed',
            ),
            CustomNumberedChip(
              path: 'assets/images/doubleBed.svg',
              count: '6',
              title: 'Double Bed',
            ),
            CustomNumberedChip(
              path: 'assets/images/mattress.svg',
              count: '2',
              title: 'Floor mattress',
            ),
            CustomNumberedChip(
              path: 'assets/images/bathroom.svg',
              count: '6',
              title: 'Bathrooms',
            ),
            CustomNumberedChip(
              path: 'assets/images/guests.svg',
              count: '12',
              title: 'Guests',
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Text(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore asperiores temporibus nemo debitis! Ad tenetur a cumque nemo ',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black38,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Check-in Time'),
                    Text(
                      '07 : 30 AM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 35,
                width: 1,
                color: Colors.black26,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Check-out Time'),
                    Text(
                      'Flexible',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Amenities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                color: Colors.black26,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconChip(
              title: 'Wi-Fi',
              path: 'assets/images/wifi.svg',
            ),
            CustomIconChip(
              title: 'Air-\nconditioner',
              path: 'assets/images/airConditioner.svg',
            ),
            CustomIconChip(
              title: 'Home Theater',
              path: 'assets/images/face.svg',
            ),
            CustomIconChip(
              title: 'Master Balcony',
              path: 'assets/images/face.svg',
            ),
          ],
        ),
        const Text(
          'House Rules',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIconChip(
              title: 'No Smoking',
              path: 'assets/images/smoke.svg',
            ),
            CustomIconChip(
              title: 'Damage to Property',
              path: 'assets/images/house.svg',
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 240,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: puneLocation,
                zoom: 12,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Text(
          "400 West 42nd Street, Hell's Kitchen, New York, NY 10036, United States",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Done',
          onTap: () {
            Navigator.pushNamed(
              context,
              TermAndConditionsScreen.routeName,
            );
          },
        ),
      ],
    );
  }
}
