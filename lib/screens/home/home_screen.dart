import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_cliprrect.dart';
import 'package:travel_bud/models/homestay.dart';
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
    fetchProperties();
  }

  fetchProperties() async {
    properties = await hps.fetchAllProperties(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return properties == null
        ? const Center(child: CircularProgressIndicator())
        : properties!.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "No properties hosted yet",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Be the one to host a property!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Click on Host below',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: properties!.length,
                shrinkWrap: true,
                // itemExtent: 350,
                itemBuilder: (context, index) {
                  HomestayModel data = properties![index];
                  return Container(
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
                                  data.photos[0],
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
                  );
                },
              );
  }
}
