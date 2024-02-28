// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_cliprrect.dart';
import 'package:travel_bud/models/homestay.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/homestay_details_screen.dart';
import 'package:travel_bud/services/host_property_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomestayModel>? properties;
  HostPropertyServices hps = HostPropertyServices();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      HomestayProvider hs =
          Provider.of<HomestayProvider>(context, listen: false);

      if (!hs.dataFetched) {
        hs.fetchData().then((_) {
          fetchProperties();
        });
      }
    });
  }

  fetchProperties() async {
    properties = await hps.fetchAllProperties(context);
    setState(() {});
    if (properties != null) {
      Provider.of<HomestayProvider>(
        context,
        listen: false,
      ).addPropertiesToProvider(properties!);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<HomestayModel> hs =
        Provider.of<HomestayProvider>(context, listen: false).properties;
    return hs.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: hs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              HomestayModel data = hs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    HomestayDetailsScreen.routeName,
                    arguments: index,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 3,
                              spreadRadius: 2,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data.coverPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 90,
                              child: SizedBox(
                                width: 180,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomClipRRect(photoUrl: data.photos[1]),
                                    CustomClipRRect(photoUrl: data.photos[2]),
                                    CustomClipRRect(photoUrl: data.photos[3]),
                                    CustomClipRRect(photoUrl: data.photos[4]),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        '${data.address}, ${data.city}',
                        style: const TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${data.startPrice} - \$${data.endPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
