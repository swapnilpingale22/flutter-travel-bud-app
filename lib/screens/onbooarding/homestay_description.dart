import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_textfield.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/screens/onbooarding/price_contact_details.dart';

class HomestayDescriptionScreen extends StatefulWidget {
  static const String routeName = '/homestay-desc';
  const HomestayDescriptionScreen({super.key});

  @override
  State<HomestayDescriptionScreen> createState() =>
      _HomestayDescriptionScreenState();
}

class _HomestayDescriptionScreenState extends State<HomestayDescriptionScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  bool _isButtonEnabled = false;
  int _wordCount = 0;
  final int maxWords = 500;

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(_checkTextField);
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _descriptionController.text.isNotEmpty;
      _wordCount = _descriptionController.text.trim().length;
    });
  }

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
                      'Homestay Description',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description'),
            Stack(
              children: [
                CustomTextField(
                  controller: _descriptionController,
                  hintText: 'Enter your description',
                  maxLines: 2,
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Text(
                    '$_wordCount/$maxWords',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          _wordCount > maxWords ? Colors.red : Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'Next',
                  onTap: _isButtonEnabled
                      ? () {
                          Navigator.pushNamed(
                            context,
                            PriceContactDetailsScreen.routeName,
                          );
                        }
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
