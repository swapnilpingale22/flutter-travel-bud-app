import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_textfield.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/screens/onbooarding/homestay_type.dart';

class HomeStayTitle extends StatefulWidget {
  static const String routeName = '/homestay-screen';
  const HomeStayTitle({super.key});

  @override
  State<HomeStayTitle> createState() => _HomeStayTitleState();
}

class _HomeStayTitleState extends State<HomeStayTitle> {
  final TextEditingController _titleController = TextEditingController();
  bool _isButtonEnabled = false;
  int _wordCount = 0;
  final int maxWords = 100;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_checkTextField);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _titleController.text.isNotEmpty;
      _wordCount = _titleController.text.trim().length;
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
            const CustomStepper(index: 1),
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
                      'Homestay Title',
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
            const Text('Title'),
            Stack(
              children: [
                CustomTextField(
                  controller: _titleController,
                  hintText: 'Enter your title',
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
                            HomestayTypeScreen.routeName,
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
