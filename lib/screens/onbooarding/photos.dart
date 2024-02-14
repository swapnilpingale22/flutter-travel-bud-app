import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_tile.dart';
import 'package:travel_bud/screens/onbooarding/homestay_description.dart';

class PhotosScreen extends StatefulWidget {
  static const String routeName = '/photos';
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Photos',
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cover Photo'),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: DottedBorder(
                  stackFit: StackFit.expand,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  color: Colors.black26,
                  dashPattern: const [8, 6],
                  strokeCap: StrokeCap.round,
                  strokeWidth: 0.6,
                  child: const CustomTile(
                    assetPath: 'assets/images/upload.svg',
                    height: 25,
                    color: Colors.blue,
                    text: 'click photo or choose file to upload',
                    textColor: Colors.black38,
                    fontSize: 12,
                    bordeColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Homestay Photos'),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      color: Colors.black26,
                      dashPattern: const [8, 6],
                      strokeCap: StrokeCap.round,
                      strokeWidth: 0.6,
                      child: const CustomTile(
                        assetPath: 'assets/images/upload.svg',
                        height: 25,
                        color: Colors.blue,
                        text: 'click photo or choose file to upload',
                        textColor: Colors.black38,
                        fontSize: 12,
                        bordeColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HomestayDescriptionScreen.routeName,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
