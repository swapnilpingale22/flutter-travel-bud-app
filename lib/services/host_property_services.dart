// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/constants/utils.dart';
import 'package:travel_bud/provider/homestay_provider.dart';

class HostPropertyServices {
  Future<List<String>> uploadImages({
    required List<File> images,
    required BuildContext context,
  }) async {
    final homestay = Provider.of<HomestayProvider>(
      context,
      listen: false,
    ).homestay;
    List<String> imageUrls = [];
    try {
      final cloudinary = CloudinaryPublic(
        'dwl8x7x78',
        'wzimubcf',
        cache: false,
      );

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: homestay.title,
          ),
        );
        imageUrls.add(res.secureUrl);
      }
      showSnackbar(
        context,
        'Photos uploaded',
        Colors.green,
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.red,
      );
    }
    return imageUrls;
  }
}
