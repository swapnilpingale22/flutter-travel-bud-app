import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_switch.dart';
import 'package:travel_bud/common_widgets/custom_text_field_title.dart';
import 'package:travel_bud/common_widgets/custom_textfield.dart';
import 'package:travel_bud/common_widgets/drop_down.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/screens/onbooarding/photos.dart';

class AddresssScreen extends StatefulWidget {
  static const String routeName = '/address';

  const AddresssScreen({super.key});

  @override
  State<AddresssScreen> createState() => _AddresssScreenState();
}

class _AddresssScreenState extends State<AddresssScreen> {
  final _addressFormKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityTownController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _streetAddressController.dispose();
    _landmarkController.dispose();
    _cityTownController.dispose();
    _pincodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomStepper(index: 6),
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
                      'Address',
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
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        child: Form(
                          key: _addressFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomTextFieldTitle(
                                title: 'Address',
                              ),
                              CustomTextField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter your address';
                                  }
                                  return null;
                                },
                                controller: _addressController,
                                hintText: 'Enter your address',
                              ),
                              const SizedBox(height: 10),
                              const CustomTextFieldTitle(
                                title: 'Street Address',
                              ),
                              CustomTextField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter your street address';
                                  }
                                  return null;
                                },
                                controller: _streetAddressController,
                                hintText: 'Enter your street address',
                              ),
                              const SizedBox(height: 10),
                              const Text('Landmark'),
                              CustomTextField(
                                controller: _landmarkController,
                                hintText: 'Enter your landmark',
                              ),
                              const SizedBox(height: 10),
                              const CustomTextFieldTitle(
                                title: 'City/Town',
                              ),
                              CustomTextField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter your city';
                                  }
                                  return null;
                                },
                                controller: _cityTownController,
                                hintText: 'Enter your city',
                              ),
                              const SizedBox(height: 10),
                              const CustomTextFieldTitle(
                                title: 'Pin code',
                              ),
                              CustomTextField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please enter your pincode';
                                  }
                                  if (int.tryParse(val) == null) {
                                    return 'Mobile number must contain only digits';
                                  }
                                  if (val.length < 6) {
                                    return 'Enter minimum 6 digit number';
                                  }

                                  return null;
                                },
                                controller: _pincodeController,
                                hintText: 'Enter your pin code',
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 10),
                              const CustomTextFieldTitle(
                                title: 'State',
                              ),
                              const StateDropdown(),
                              const CustomSwitch(
                                title: 'Show your specific location',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: 'Next',
                onTap: () {
                  if (_addressFormKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      PhotosScreen.routeName,
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
