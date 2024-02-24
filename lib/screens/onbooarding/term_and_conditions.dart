import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';

class TermAndConditionsScreen extends StatefulWidget {
  static const String routeName = '/term-and-conditions';

  const TermAndConditionsScreen({super.key});

  @override
  State<TermAndConditionsScreen> createState() =>
      _TermAndConditionsScreenState();
}

class _TermAndConditionsScreenState extends State<TermAndConditionsScreen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
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
                  'Terms & Conditions',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    children: [
                      Text('1. '),
                      Text('Term 1'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Nisl a pellentesque id semper quam donec. Hendrerit eleifend at vel curabitur. Risus morbi adipiscing porttitor et facilisis. Ornare massa at ut morbi felis dui senectus. Cum ac varius sapien id nam nisl.',
                      style: TextStyle(
                        color: Color(0xff707376),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text('2. '),
                      Text('Term 2'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Aliquet lacus vitae bibendum morbi. Id ornare ultricies sit sapien arcu auctor sed pretium. Non lectus egestas consectetur urna viverra tincidunt iaculis lacus donec. Mauris arcu gravida dui mauris nunc mauris blandit. Ut quam augue sodales nibh quis. Eu suspendisse aliquet sed blandit nullam libero. Nunc vivamus non id eleifend ullamcorper. Non malesuada consectetur ante ultrices morbi. Tortor maecenas sed scelerisque fermentum ut quam. Urna enim etiam fames gravida.',
                      style: TextStyle(
                        color: Color(0xff707376),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text('3. '),
                      Text('Term 3'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Mi bibendum volutpat non eget. Ultrices semper sit enim tincidunt. Vitae purus sed in sapien feugiat ac a. Congue sit lacus nulla non nibh facilisi tempor justo. Porttitor augue enim diam netus aliquam ut. Cursus pretium in fringilla gravida. Id habitasse dictum proin feugiat amet elit. Ac gravida et quis diam elementum aliquet. Ante lorem id lacus sit arcu quam gravida in. Tellus mollis malesuada nulla phasellus vitae aliquet risus neque odio. Rhoncus condimentum sagittis at nisl pellentesque sed vitae id.  ',
                      style: TextStyle(
                        color: Color(0xff707376),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text('4. '),
                      Text('Term 4'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Morbi vel aliquam nisl vel a convallis faucibus at. Pulvinar tellus imperdiet amet massa turpis suspendisse non id. Aliquet sagittis maecenas vitae sapien sapien consequat accumsan ultricies. Pellentesque morbi et pellentesque aliquet integer vulputate. Id nunc nisl vitae facilisis turpis tempus. Nisi nulla faucibus erat metus bibendum sollicitudin suscipit laoreet. Urna pharetra risus magnis orci amet sed interdum malesuada.',
                      style: TextStyle(
                        color: Color(0xff707376),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur. Nisl a pellentesque id semper quam donec. Hendrerit eleifend at vel curabitur. Risus morbi adipiscing porttitor et facilisis. Ornare massa at ut morbi felis dui senectus. Cum.',
                          style: TextStyle(
                            color: Color(0xff707376),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                text: 'Done',
                onTap: _isChecked
                    ? () {
                        // method to upload homestay data to db
                        showCongratulationsDialog(context);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
