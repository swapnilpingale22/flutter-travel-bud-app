import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_switch.dart';
import 'package:travel_bud/common_widgets/custom_textfield.dart';
import 'package:travel_bud/common_widgets/drop_down.dart';
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
        title: const Column(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Form(
                      key: _addressFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Address'),
                          CustomTextField(
                            controller: _addressController,
                            hintText: 'Enter your address',
                          ),
                          const SizedBox(height: 10),
                          const Text('Street Address'),
                          CustomTextField(
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
                          const Text('City/Town'),
                          CustomTextField(
                            controller: _cityTownController,
                            hintText: 'Enter your city',
                          ),
                          const SizedBox(height: 10),
                          const Text('Pin code'),
                          CustomTextField(
                            controller: _pincodeController,
                            hintText: 'Enter your pin code',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),
                          const Text('State'),
                          const StateDropdown(),
                          const CustomSwitch(
                            title: 'Show your specific location',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
