// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_chip.dart';
import 'package:travel_bud/common_widgets/custom_icon_chip.dart';
import 'package:travel_bud/common_widgets/custom_numbered_chip.dart';
import 'package:travel_bud/provider/homestay_provider.dart';

class DetailsTabContent extends StatelessWidget {
  final int index;
  const DetailsTabContent({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var property =
        Provider.of<HomestayProvider>(context, listen: false).properties[index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            CustomChip(
              text: property.homestayType,
              path: 'assets/images/traditional.svg',
            ),
            CustomChip(
              text: (property.area == 'entirePlace')
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
              count: property.bedrooms.toString(),
              title: 'Bedrooms',
            ),
            CustomNumberedChip(
              path: 'assets/images/singleBed.svg',
              count: property.singleBed.toString(),
              title: 'Single Bed',
            ),
            CustomNumberedChip(
              path: 'assets/images/doubleBed.svg',
              count: property.doubleBed.toString(),
              title: 'Double Bed',
            ),
            CustomNumberedChip(
              path: 'assets/images/mattress.svg',
              count: property.extraFloorMat.toString(),
              title: 'Floor mattress',
            ),
            CustomNumberedChip(
              path: 'assets/images/bathroom.svg',
              count: property.bathrooms.toString(),
              title: 'Bathrooms',
            ),
            CustomNumberedChip(
              path: 'assets/images/guests.svg',
              count: property.maxGuests.toString(),
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
          property.description,
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
                      (property.isCheckInFlexible)
                          ? 'Flexible'
                          : '${property.checkInTime}',
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
                      (property.isCheckOutFlexible)
                          ? 'Flexible'
                          : '${property.checkOutTime}',
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
              title: property.amenities[0],
              path: 'assets/images/face.svg',
            ),
            if (property.amenities.length > 1)
              CustomIconChip(
                title: property.amenities[1],
                path: 'assets/images/face.svg',
              ),
            if (property.amenities.length > 2)
              CustomIconChip(
                title: property.amenities[2],
                path: 'assets/images/face.svg',
              ),
            if (property.amenities.length > 3)
              CustomIconChip(
                title: property.amenities[3],
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
                target: LatLng(property.latitude, property.longitude),
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('id'),
                  position: LatLng(property.latitude, property.longitude),
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
          "${property.address}, ${property.streetAddress}, ${property.landmark}, ${property.city}, ${property.state}, ${property.pincode}",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Done',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
