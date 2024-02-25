// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/confirm_dialog.dart';
import 'package:travel_bud/constants/error_handling.dart';
import 'package:travel_bud/constants/utils.dart';
import 'package:travel_bud/models/homestay.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/provider/user_provider.dart';
import 'package:travel_bud/secrets/secret.dart';

class HostPropertyServices {
  //upload images
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

//host a property
  void hostProperty({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final hs = Provider.of<HomestayProvider>(context, listen: false).homestay;
    try {
      HomestayModel product = HomestayModel(
        title: hs.title,
        homestayType: hs.homestayType,
        area: hs.area,
        maxGuests: hs.maxGuests,
        bedrooms: hs.bedrooms,
        singleBed: hs.singleBed,
        doubleBed: hs.doubleBed,
        extraFloorMat: hs.extraFloorMat,
        bathrooms: hs.bathrooms,
        isKitchen: hs.isKitchen,
        amenities: hs.amenities,
        checkInTime: hs.checkInTime,
        checkOutTime: hs.checkOutTime,
        isCheckInFlexible: hs.isCheckInFlexible,
        isCheckOutFlexible: hs.isCheckOutFlexible,
        latitude: hs.latitude,
        longitude: hs.longitude,
        address: hs.address,
        streetAddress: hs.streetAddress,
        landmark: hs.landmark,
        city: hs.city,
        pincode: hs.pincode,
        state: hs.state,
        isLocationSpecific: hs.isLocationSpecific,
        photos: hs.photos,
        description: hs.description,
        startPrice: hs.startPrice,
        endPrice: hs.endPrice,
        ownerContactNo: hs.ownerContactNo,
        ownerEmail: hs.ownerEmail,
        homestayContactNo: hs.homestayContactNo,
        homestayEmail: hs.homestayEmail,
        userId: userProvider.user.id,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/host-property'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: product.toJson(),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showCongratulationsDialog(context);
        },
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
  }

  //get all properties
  Future<List<HomestayModel>> fetchAllProperties(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<HomestayModel> propertyList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/get-properties'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            propertyList.add(
              HomestayModel.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
    return propertyList;
  }

//get properties by current user
  Future<List<HomestayModel>> fetchCurrentUserProperties(
      BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<HomestayModel> propertyList = [];
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/get-your-properties'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode({
          'id': userProvider.user.id,
        }),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            propertyList.add(
              HomestayModel.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
    return propertyList;
  }

  //delete a product

  void deleteProduct({
    required BuildContext context,
    required HomestayModel homestay,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/delete-property'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode({
          'id': homestay.id,
        }),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
        Colors.brown,
      );
    }
  }
}
