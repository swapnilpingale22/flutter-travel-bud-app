import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_amenity.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_textfield.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/screens/onbooarding/preview.dart';

class PriceContactDetailsScreen extends StatefulWidget {
  static const String routeName = '/price-contact-details';

  const PriceContactDetailsScreen({super.key});

  @override
  State<PriceContactDetailsScreen> createState() =>
      _PriceContactDetailsScreenState();
}

class _PriceContactDetailsScreenState extends State<PriceContactDetailsScreen> {
  final _contactDetailsFormKey = GlobalKey<FormState>();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _startPriceController = TextEditingController();
  final TextEditingController _endPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomStepper(index: 8),
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
                      'Price and Contact Details',
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
        padding: const EdgeInsets.all(10).copyWith(bottom: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Price'),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.',
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    child: Form(
                      key: _contactDetailsFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: _startPriceController,
                                  hintText: 'Enter start price',
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text('to'),
                              ),
                              Expanded(
                                child: CustomTextField(
                                  controller: _endPriceController,
                                  hintText: 'Enter end price',
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Owner Details',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Owner Contact No.'),
                          const Text(
                            'Lorem ipsum dolor sit amet consectetur.',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                          CustomTextField(
                            controller: _contactNoController,
                            hintText: 'Enter your contact number',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20),
                          const Text('Owner Email ID'),
                          const Text(
                            'Lorem ipsum dolor sit amet consectetur.',
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Enter your email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Homestay Details',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Homestay Contact No.'),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.',
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                  const CustomAmenity(
                    text: 'Enter homestay contact no. 1',
                    icon: Icons.add_circle_outline,
                    textColor: Colors.black26,
                  ),
                  const CustomAmenity(
                    text: 'Enter homestay contact no. 2',
                    icon: Icons.add_circle_outline,
                    textColor: Colors.black26,
                  ),
                  const SizedBox(height: 10),
                  const Text('Homestay Email ID'),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.',
                    style: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                  const CustomAmenity(
                    text: 'Enter homestay email Id',
                    icon: Icons.add_circle_outline,
                    textColor: Colors.black26,
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: 'Done',
                onTap: () {
                  if (_contactDetailsFormKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      PreviewScreen.routeName,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
