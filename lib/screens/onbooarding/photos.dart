// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_button.dart';
import 'package:travel_bud/common_widgets/custom_tile.dart';
import 'package:travel_bud/common_widgets/stepper.dart';
import 'package:travel_bud/constants/utils.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/homestay_description.dart';
import 'package:travel_bud/services/host_property_services.dart';

class PhotosScreen extends StatefulWidget {
  static const String routeName = '/photos';
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  HostPropertyServices hps = HostPropertyServices();

  List<String> imageUrls = [];
  List<File> images = [];
  File? coverImage;

  Future<void> selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  Future<void> selectCoverImage() async {
    File? selectedImage = await pickCoverImage();
    if (selectedImage != null) {
      setState(() {
        coverImage = selectedImage;
      });
    }
  }

  Future<void> uploadToDB() async {
    List<String> urlList = await hps.uploadImages(
      images: images,
      context: context,
    );
    if (urlList.isNotEmpty) {
      setState(() {
        imageUrls = urlList;
      });

      Provider.of<HomestayProvider>(
        context,
        listen: false,
      ).updatePhotos(
        photosList: imageUrls,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomStepper(index: 7),
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
              ],
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
                child: coverImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          coverImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectCoverImage,
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
                  return images.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              images[index],
                              fit: BoxFit.cover,
                              height: 120,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: Padding(
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
                          ),
                        );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'Next',
                  onTap: images.isNotEmpty
                      ? () {
                          uploadToDB();
                          Navigator.pushNamed(
                            context,
                            HomestayDescriptionScreen.routeName,
                          );
                        }
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
