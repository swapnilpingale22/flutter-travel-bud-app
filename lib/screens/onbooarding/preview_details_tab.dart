import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_chip.dart';
import 'package:travel_bud/common_widgets/custom_icon_chip.dart';
import 'package:travel_bud/common_widgets/custom_numbered_chip.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/term_and_conditions.dart';

class PreviewDetailsTabContent extends StatelessWidget {
  const PreviewDetailsTabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var homestay =
        Provider.of<HomestayProvider>(context, listen: false).homestay;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            CustomChip(
              text: homestay.homestayType,
              path: 'assets/images/traditional.svg',
            ),
            CustomChip(
              text: (homestay.area == 'entirePlace')
                  ? "Entire Place"
                  : "Private Room",
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
          children: [
            CustomNumberedChip(
              path: 'assets/images/privateRoom.svg',
              count: homestay.bedrooms.toString(),
              title: 'Bedrooms',
            ),
            CustomNumberedChip(
              path: 'assets/images/singleBed.svg',
              count: homestay.singleBed.toString(),
              title: 'Single Bed',
            ),
            CustomNumberedChip(
              path: 'assets/images/doubleBed.svg',
              count: homestay.doubleBed.toString(),
              title: 'Double Bed',
            ),
            CustomNumberedChip(
              path: 'assets/images/mattress.svg',
              count: homestay.extraFloorMat.toString(),
              title: 'Floor mattress',
            ),
            CustomNumberedChip(
              path: 'assets/images/bathroom.svg',
              count: homestay.bathrooms.toString(),
              title: 'Bathrooms',
            ),
            CustomNumberedChip(
              path: 'assets/images/guests.svg',
              count: homestay.maxGuests.toString(),
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
        Text(
          homestay.description,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Check-in Time'),
                    Text(
                      (homestay.isCheckInFlexible)
                          ? 'Flexible'
                          : '${homestay.checkInTime}',
                      style: const TextStyle(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Check-out Time'),
                    Text(
                      (homestay.isCheckOutFlexible)
                          ? 'Flexible'
                          : '${homestay.checkOutTime}',
                      style: const TextStyle(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconChip(
              title: homestay.amenities[0],
              path: 'assets/images/face.svg',
            ),
            if (homestay.amenities.length > 1)
              CustomIconChip(
                title: homestay.amenities[1],
                path: 'assets/images/face.svg',
              ),
            if (homestay.amenities.length > 2)
              CustomIconChip(
                title: homestay.amenities[2],
                path: 'assets/images/face.svg',
              ),
            if (homestay.amenities.length > 3)
              CustomIconChip(
                title: homestay.amenities[3],
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
              liteModeEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(homestay.latitude, homestay.longitude),
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('id'),
                  position: LatLng(homestay.latitude, homestay.longitude),
                )
              },
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
        Text(
          // "400 West 42nd Street, Hell's Kitchen, New York, NY 10036, United States",
          "${homestay.address}, ${homestay.streetAddress}, ${homestay.landmark}, ${homestay.city}, ${homestay.state}, ${homestay.pincode}",
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
