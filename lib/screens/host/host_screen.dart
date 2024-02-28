import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_cliprrect.dart';
import 'package:travel_bud/constants/utils.dart';
import 'package:travel_bud/models/homestay.dart';
import 'package:travel_bud/screens/onbooarding/homestay_title.dart';
import 'package:travel_bud/services/host_property_services.dart';

class HostScreen extends StatefulWidget {
  static const routeName = '/host';
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  List<HomestayModel>? properties;
  HostPropertyServices hps = HostPropertyServices();
  @override
  void initState() {
    super.initState();
    fetchProperties();
  }

  fetchProperties() async {
    properties = await hps.fetchCurrentUserProperties(context);
    setState(() {});
  }

  void deleteProperty(HomestayModel homestay, int index) {
    hps.deleteProduct(
      context: context,
      homestay: homestay,
      onSuccess: () {
        properties!.removeAt(index);
        setState(() {});
        showSnackbar(
          context,
          'Product deleted!',
          Colors.green,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return properties == null
        ? const Center(child: CircularProgressIndicator())
        : properties!.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "We're here for you",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Click to list property',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: CustomButton(
                          text: 'Host Property',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              HomeStayTitle.routeName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: properties!.length,
                shrinkWrap: true,
                // itemExtent: 355,
                itemBuilder: (context, index) {
                  HomestayModel data = properties![index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '\$${data.startPrice} - \$${data.endPrice}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteProperty(data, index);
                              },
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
  }
}
